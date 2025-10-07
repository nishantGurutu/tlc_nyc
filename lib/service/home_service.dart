import 'package:dio/dio.dart';
import 'package:tlc_nyc/api/api_constant.dart';
import 'package:tlc_nyc/model/test_type_model.dart';

class HomeService {
  final Dio _dio = Dio();
  Future<List<QuestionTypeListModel>?> groupList() async {
    try {
      var url = ApiConstant.baseUrl + ApiConstant.questypeList;
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
