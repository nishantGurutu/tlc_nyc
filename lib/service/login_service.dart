import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tlc_nyc/api/api_constant.dart';
import 'package:tlc_nyc/service/network_service.dart';

class LoginService {
  final NetworkService _networkService = NetworkService();

  Future<Response> registerUser({
    required String name,
    required String mobile,
    required String email,
    required String password,
    required File imagePath,
  }) async {
    final formData = {
      "name": name,
      "mobile": mobile,
      "email": email,
      "password": password,
      "image": await MultipartFile.fromFile(
        imagePath.path,
        filename: imagePath.path.split('/').last,
      ),
    };

    return await _networkService.postRequest(
      ApiConstant.register,
      data: formData,
      isFormData: true,
    );
  }

  Future<Response> loginUser({
    required String email,
    required String password,
  }) async {
    final data = {"email": email, "password": password};

    return await _networkService.postRequest(
      ApiConstant.login,
      data: data,
      isFormData: false,
    );
  }
}
