import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/service/login_service.dart';
import 'package:tlc_nyc/service/network_service.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var selectedImagePath = ''.obs;
  final LoginService _loginService = LoginService();
  Rx<File> pickedFile = File('').obs;
  Future<void> register({
    required String name,
    required String mobile,
    required String email,
    required String password,
    required String imagePath,
  }) async {
    try {
      isLoading.value = true;

      final response = await _loginService.registerUser(
        name: name,
        mobile: mobile,
        email: email,
        password: password,
        imagePath: imagePath,
      );

      print("REGISTER SUCCESS: ${response.data}");

      Get.snackbar(
        "Success",
        response.data["message"] ?? "Registration Successful",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print("REGISTER ERROR → $e");

      Get.snackbar(
        "Error",
        "Registration failed",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      isLoading.value = true;

      final response = await _loginService.loginUser(
        email: email,
        password: password,
      );

      print("LOGIN SUCCESS: ${response.data}");

      // OPTIONAL: Save token if backend sends one
      if (response.data["token"] != null) {
        NetworkService().setToken(response.data["token"]);
      }

      Get.snackbar(
        "Success",
        response.data["message"] ?? "Login Successful",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print("LOGIN ERROR → $e");

      Get.snackbar(
        "Error",
        "Invalid email or password",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
