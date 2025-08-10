import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> sendOtp({required String mobileNumber}) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: "+91$mobileNumber",
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-verification in some cases
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        debugPrint("Verification failed: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        debugPrint("OTP sent. Verification ID: $verificationId");
        // onCodeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        debugPrint("Auto retrieval timeout");
      },
    );
  }

  /// Step 2: Verify OTP
  Future<void> verifyOtp({
    required String verificationId,
    required String otp,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      // onSuccess(userCredential);
    } catch (e) {
      // onError(e.toString());
    }
  }
}
