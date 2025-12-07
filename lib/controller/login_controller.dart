import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/helper/storage_helper.dart';
import 'package:tlc_nyc/routes/app_pages.dart';
import 'package:tlc_nyc/service/login_service.dart';
import 'package:tlc_nyc/utils/custom_snakbar.dart';

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
    required File imagePath,
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
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.back();
        CustomSnackBar.success(
          "Success",
          response.data["message"] ?? "Registration Successful",
        );
      }
    } catch (e) {
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
      if (response.statusCode == 200 || response.statusCode == 201) {
        StorageHelper.setId(response.data["user"]["_id"]);
        StorageHelper.setName(response.data["user"]["name"]);
        StorageHelper.setEmail(response.data["user"]["email"]);
        StorageHelper.setPhone(response.data["user"]["mobile"]);
        StorageHelper.setImage(response.data["user"]["image"]);
        StorageHelper.setRole(response.data["user"]["role"]);
        StorageHelper.setToken(response.data["token"]);

        CustomSnackBar.success(
          "Success",
          response.data["message"] ?? "Login Successful",
        );
        Get.offAllNamed(Routes.DASHBOARDSCREEN);
      }
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
