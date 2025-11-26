import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  Future<bool> login(String mobile, String password) async {
    isLoading.value = true;
    try {
      // Simulate API call
      await Future.delayed(Duration(seconds: 2));
      
      // For demo purposes, accept any mobile/password combination
      if (mobile.isNotEmpty && password.isNotEmpty) {
        Get.snackbar(
          'Success',
          'Login successful!',
          snackPosition: SnackPosition.BOTTOM,
        );
        return true;
      } else {
        Get.snackbar(
          'Error',
          'Please enter valid credentials',
          snackPosition: SnackPosition.BOTTOM,
        );
        return false;
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Login failed: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // Future<void> sendOtp({required String mobileNumber}) async {
  //   await _auth.verifyPhoneNumber(
  //     phoneNumber: "+91$mobileNumber",
  //     timeout: const Duration(seconds: 60),
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       // Auto-verification in some cases
  //       await _auth.signInWithCredential(credential);
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       debugPrint("Verification failed: ${e.message}");
  //     },
  //     codeSent: (String verificationId, int? resendToken) {
  //       debugPrint("OTP sent. Verification ID: $verificationId");
  //       // onCodeSent(verificationId);
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {
  //       debugPrint("Auto retrieval timeout");
  //     },
  //   );
  // }

  // /// Step 2: Verify OTP
  // Future<void> verifyOtp({
  //   required String verificationId,
  //   required String otp,
  // }) async {
  //   try {
  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: verificationId,
  //       smsCode: otp,
  //     );

  //     UserCredential userCredential = await _auth.signInWithCredential(
  //       credential,
  //     );

  //     // onSuccess(userCredential);
  //   } catch (e) {
  //     // onError(e.toString());
  //   }
  // }
}
