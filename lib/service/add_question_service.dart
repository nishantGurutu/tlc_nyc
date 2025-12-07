import 'package:dio/dio.dart';
import 'package:tlc_nyc/api/api_constant.dart';
import 'package:tlc_nyc/model/add_question_type_model.dart';
import 'package:tlc_nyc/model/add_question_with_answers_model.dart';
import 'package:tlc_nyc/model/question_answer_model.dart';

class AddQuestionService {
  final Dio _dio = Dio();

  AddQuestionService() {
    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          print('🚀 REQUEST[${options.method}] => PATH: ${options.path}');
          print('📋 Headers: ${options.headers}');
          print('📦 Data: ${options.data}');
          print('🔗 Query Parameters: ${options.queryParameters}');
          handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          print(
            '✅ RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
          );
          print('📋 Headers: ${response.headers}');
          print('📦 Data: ${response.data}');
          print('📊 Data Type: ${response.data.runtimeType}');
          if (response.data is List) {
            print('📝 List Length: ${(response.data as List).length}');
            if ((response.data as List).isNotEmpty) {
              print('📄 First Item: ${(response.data as List).first}');
            }
          }
          handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          print(
            '❌ ERROR[${error.response?.statusCode}] => PATH: ${error.requestOptions.path}',
          );
          print('📋 Error Message: ${error.message}');
          print('📦 Error Data: ${error.response?.data}');
          print('📋 Error Headers: ${error.response?.headers}');
          handler.next(error);
        },
      ),
    );
  }

  Future<bool> addQuestionType(AddQuestionTypeModel questionType) async {
    try {
      final response = await _dio.post(
        '${ApiConstant.baseUrl}${ApiConstant.addQuestionType}',
        data: questionType.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
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

  Future<bool> addQuestionWithAnswers(
    AddQuestionWithAnswersModel questionWithAnswers,
  ) async {
    try {
      final response = await _dio.post(
        '${ApiConstant.baseUrl}${ApiConstant.addQuestionWithAnswers}',
        data: questionWithAnswers.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
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

  Future<List<QuestionAnswerModel>?> getQuestionWithAnswersByTypeCode(
    int qtypeCode,
  ) async {
    try {
      print(
        '🔍 Calling getQuestionWithAnswersByTypeCode with QTYPE_CODE: $qtypeCode',
      );
      print(
        '🌐 Full URL: ${ApiConstant.baseUrl}${ApiConstant.questionAnswerBytypeid}?QTYPE_CODE=$qtypeCode',
      );

      final response = await _dio.post(
        '${ApiConstant.baseUrl}${ApiConstant.questionAnswerBytypeid}?QTYPE_CODE=$qtypeCode',
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      print('📊 Response Status Code: ${response.statusCode}');
      print('📊 Response Status Message: ${response.statusMessage}');

      if (response.statusCode == 200) {
        print('✅ Success! Processing response data...');
        print('📦 Raw Response Data: ${response.data}');
        print('📊 Data Type: ${response.data.runtimeType}');

        if (response.data is List) {
          print(
            '📝 Response is a List with ${(response.data as List).length} items',
          );

          if ((response.data as List).isEmpty) {
            print('⚠️ Warning: Response list is empty');
            return [];
          }

          // Try to parse the first item to see its structure
          try {
            final firstItem = (response.data as List).first;
            print('📄 First Item Structure: $firstItem');
            print('📄 First Item Type: ${firstItem.runtimeType}');
          } catch (e) {
            print('❌ Error accessing first item: $e');
          }

          return (response.data as List)
              .map((item) {
                try {
                  return QuestionAnswerModel.fromJson(item);
                } catch (e) {
                  print('❌ Error parsing item: $item');
                  print('❌ Parsing error: $e');
                  return null;
                }
              })
              .where((item) => item != null)
              .cast<QuestionAnswerModel>()
              .toList();
        } else {
          print('❌ Response is not a List. Type: ${response.data.runtimeType}');
          return null;
        }
      } else {
        print('❌ Non-200 status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('❌ Exception in getQuestionWithAnswersByTypeCode: $e');
      if (e is DioException) {
        print('❌ DioException Type: ${e.type}');
        print('❌ DioException Message: ${e.message}');
        print('❌ DioException Response: ${e.response?.data}');
        print('❌ DioException Status Code: ${e.response?.statusCode}');
      }
      return null;
    }
  }
}
