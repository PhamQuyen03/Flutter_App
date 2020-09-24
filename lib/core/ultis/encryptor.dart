import 'package:encrypt/encrypt.dart';

String encryptText(String plainText) {
  String secretKey = "E6t187^D43%FiqGnhOyV1IfYrxrQyLil";
  final key = Key.fromUtf8(secretKey);
  final iv = IV.fromUtf8("7061737323313233");
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: "PKCS7"));
  final encrypted = encrypter.encrypt(plainText, iv: iv);
  return encrypted.base64;
}
