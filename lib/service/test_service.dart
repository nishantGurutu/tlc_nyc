import 'package:dio/dio.dart';
import 'package:tlc_nyc/api/api_constant.dart';
import 'package:tlc_nyc/model/test_type_model.dart';

class TestService {
  final Dio _dio = Dio();
  Future<List<QuestionTypeListModel>?> questionList() async {
    try {
      var url =
          "${ApiConstant.baseUrl + ApiConstant.questionAnswerBytypeid}?QTYPE_CODE=2";
      final response = await _dio.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        List data = response.data;
        return data.map((e) => QuestionTypeListModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed notes list');
      }
    } catch (e) {
      print('Error in NotesService: $e');
      return null;
    }
  }
}
