import 'package:dio/dio.dart';
import 'package:tlc_nyc/api/api_constant.dart';
import 'package:tlc_nyc/model/add_question_type_model.dart';
import 'package:tlc_nyc/model/add_question_with_answers_model.dart';

class AddQuestionService {
  final Dio _dio = Dio();

  Future<bool> addQuestionType(AddQuestionTypeModel questionType) async {
    try {
      final response = await _dio.post(
        '${ApiConstant.baseUrl}${ApiConstant.addQuestionType}',
        data: questionType.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error in AddQuestionService - addQuestionType: $e');
      return false;
    }
  }

  Future<bool> addQuestionWithAnswers(AddQuestionWithAnswersModel questionWithAnswers) async {
    try {
      final response = await _dio.post(
        '${ApiConstant.baseUrl}${ApiConstant.addQuestionWithAnswers}',
        data: questionWithAnswers.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error in AddQuestionService - addQuestionWithAnswers: $e');
      return false;
    }
  }
}
