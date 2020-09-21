import 'package:firebase_auth/firebase_auth.dart';

typedef void CodeSent(String verificationId, [int forceResendingToken]);
typedef void VerificationFailed(FirebaseAuthException authException);
typedef void VerificationCompleted(PhoneAuthCredential credential);
typedef void CodeAutoRetrievalTimeout(String str);

class PhoneAuthenticationService {
  CodeSent codeSent;
  VerificationCompleted verificationCompleted;
  VerificationFailed verificationFailed;
  CodeAutoRetrievalTimeout codeAutoRetrievalTimeout;
  PhoneAuthenticationService(
      {this.codeSent,
      this.verificationCompleted,
      this.verificationFailed,
      this.codeAutoRetrievalTimeout});

  sendOTPCode(String phoneNumber) async {
    var firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }
}
