import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../features/authentication/data/models/user_session_model.dart';

const JWT_TOKEN = "access_token";
const REFRESH_TOKEN = "refresh_token";
const CODE_CHALLENGE = 'session_id';
const SESSION_USER = 'session_user';

class AuthenticationService {
  final _storage = FlutterSecureStorage();

  Future<UserSessionModel> getUser() async {
    var tmp = await _storage.read(key: SESSION_USER);
    if (tmp != null) return UserSessionModel.fromJson(jsonDecode(tmp));
    return null;
  }

  Future<void> updateUser(UserSessionModel user) async {
    if (user == null)
      await _storage.delete(key: SESSION_USER);
    else
      await _storage.write(key: SESSION_USER, value: jsonEncode(user.toJson()));
  }

  Future<bool> isLoggedIn() async {
    return !!(await this.getJwtToken() != null) &&
        !!(await this.getUser() != null);
  }

  Future<String> getJwtToken() async {
    return await _storage.read(key: JWT_TOKEN);
  }

  Future<String> getRefreshToken() async {
    return await _storage.read(key: REFRESH_TOKEN);
  }

  getCodeChallenge() async {
    //debugger
    //let code = this.cookieService.get(CODE_CHALLENGE);
    var code = await _storage.read(key: CODE_CHALLENGE);
    // if (code) {
    //   let encryped_code = this.encryptor.encrypt(code);
    //   return code+'.'+encryped_code;
    // }
    return "";
  }

  Future<void> storeTokens(Tokens tokens) async {
    if (tokens != null) {
      await _storage.write(key: JWT_TOKEN, value: tokens.accessToken);
      await _storage.write(key: REFRESH_TOKEN, value: tokens.refreshToken);
      await _storage.write(key: CODE_CHALLENGE, value: tokens.sessionId);
    }
  }

  Future<void> clearTokens() async {
    await _storage.delete(key: JWT_TOKEN);
    await _storage.delete(key: REFRESH_TOKEN);
    await _storage.delete(key: CODE_CHALLENGE);
  }
}

class Tokens {
  final String accessToken;
  final String refreshToken;
  final String sessionId;

  Tokens({this.accessToken, this.refreshToken, this.sessionId});
}
