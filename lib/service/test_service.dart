import 'package:dio/dio.dart';
import 'package:tlc_nyc/api/api_constant.dart';
import 'package:tlc_nyc/model/test_type_model.dart';

class TestService {
  final Dio _dio = Dio();
  
  Future<List<QuestionTypeListModel>?> questionList({int? testTypeId}) async {
    try {
      // Use provided testTypeId or default to 2 for backward compatibility
      int qtypeCode = testTypeId ?? 2;
      var url =
          "${ApiConstant.baseUrl + ApiConstant.questionAnswerBytypeid}?QTYPE_CODE=$qtypeCode";
      final response = await _dio.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        List data = response.data;
        return data.map((e) => QuestionTypeListModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load questions for test type');
      }
    } catch (e) {
      print('Error in TestService: $e');
      return null;
    }
  }
}
