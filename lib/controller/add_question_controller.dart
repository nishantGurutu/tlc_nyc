import 'package:get/get.dart';
import 'package:tlc_nyc/controller/home_controller.dart';
import 'package:tlc_nyc/model/add_question_type_model.dart';
import 'package:tlc_nyc/model/add_question_with_answers_model.dart';
import 'package:tlc_nyc/service/add_question_service.dart';

class AddQuestionController extends GetxController {
  final AddQuestionService _addQuestionService = AddQuestionService();
  final HomeController homeController = Get.find<HomeController>();
  var isLoading = false.obs;
  var questionTypes = <String>[].obs;
  var selectedQuestionType = ''.obs;
  var selectedGroupCode = 0.obs;

  Future<bool> addQuestionType(String questionTypeName) async {
    isLoading.value = true;
    try {
      final questionType = AddQuestionTypeModel(
        qtypECODE: 0,  
        qtypENAME: questionTypeName,
        isactive: true, 
      );

      final result = await _addQuestionService.addQuestionType(questionType);
      
      if (result) {
       await homeController.groupListApi();
        
      }  
      
      return result;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Error adding question type: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> addQuestionWithAnswers({
    required String questionName,
    required int groupCode,
    required int questionTypeCode,
    required List<Map<String, dynamic>> answers,
  }) async {
    isLoading.value = true;
    try {
      final questionMast = QuestionMast(
        questioNCODE: 0,
        questioNNAME: questionName,
        grPCODE: groupCode,
        qtypECODE: questionTypeCode,
        isactive: true,
      );

      final answersList = answers.map((answer) => Answer(
        answerCode: 0,
        answerName: answer['name'],
        isCorrect: answer['isCorrect'],
      )).toList();

      final questionWithAnswers = AddQuestionWithAnswersModel(
        questionMast: questionMast,
        answers: answersList,
      );

      final result = await _addQuestionService.addQuestionWithAnswers(questionWithAnswers);
      
      if (result) {
        Get.snackbar(
          'Success',
          'Question with answers added successfully',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to add question with answers',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      
      return result;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Error adding question with answers: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}