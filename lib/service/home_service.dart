import 'package:dio/dio.dart';
import 'package:tlc_nyc/api/api_constant.dart';
import 'package:tlc_nyc/service/network_service.dart';

class HomeService {
  final NetworkService _networkService = NetworkService();
  Future<Response> questionTypeList() async {
    try {
      return await _networkService.getRequest(ApiConstant.questypeList);
    } catch (e) {
      print('Error in AddQuestionService - addQuestionType: $e');
      return Future.error(e);
    }
  }
}
