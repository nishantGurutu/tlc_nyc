import 'package:get/get.dart';
import 'package:tlc_nyc/controller/home_controller.dart';
import 'package:tlc_nyc/model/add_question_type_model.dart';
import 'package:tlc_nyc/model/add_question_with_answers_model.dart';
import 'package:tlc_nyc/model/question_answer_model.dart';
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
       await homeController.questionTypeListApi();
        
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
    required int questionTypeCode,
    required List<Map<String, dynamic>> answers,
  }) async {
    isLoading.value = true;
    try {
      final questionMast = QuestionMast(
        questioNCODE: 0,  
        questioNNAME: questionName,
        grPCODE: 0,  
        qtypECODE: questionTypeCode,
        isactive: true, 
      );
      print('Preparing to add question: $questionName with type code: $questionTypeCode and answers: $answers');
      final answersList = answers.map((answer) => Answer(
        answerCode: 0,  
        answerName: answer['name'],
        isCorrect: answer["isCorrect"],  
      )).toList();

      final questionWithAnswers = AddQuestionWithAnswersModel(
        questionMast: questionMast,
        answers: answersList,
      );

      final result = await _addQuestionService.addQuestionWithAnswers(questionWithAnswers);
      
      if (result) {
        // Call GetQuestionWithAnswersByTypeCode API after successful add
        final questions = await _addQuestionService.getQuestionWithAnswersByTypeCode(questionTypeCode);
        
        if (questions != null) {
          Get.snackbar(
            'Success',
            'Question with answers added successfully. Retrieved ${questions.length} questions.',
            snackPosition: SnackPosition.BOTTOM,
          );
          print('Retrieved questions: ${questions.length}');
        } else {
          Get.snackbar(
            'Success',
            'Question with answers added successfully, but failed to retrieve updated questions.',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
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

  var isLoadingQuestion = false.obs;
  RxList<QuestionAnswerModel> questionAnswerList = <QuestionAnswerModel>[].obs;
  
  // Test navigation properties
  var currentQuestionIndex = 0.obs;
  var selectedAnswers = <int, int>{}.obs;
  
  Future<void> questionAnswerListApi(int testTypeId) async {
    print('🔄 Starting questionAnswerListApi with testTypeId: $testTypeId');
    isLoadingQuestion.value = true;
    try {
      final result = await AddQuestionService().getQuestionWithAnswersByTypeCode(testTypeId);
      print('📊 API Result: $result');
      print('📊 Result Type: ${result.runtimeType}');
      print('📊 Result Length: ${result?.length ?? 'null'}');
      
      if (result != null) {
        print('✅ Successfully got ${result.length} questions');
        questionAnswerList.assignAll(result);
        // Reset test state when loading new questions
        currentQuestionIndex.value = 0;
        selectedAnswers.clear();
        print('📝 Updated questionAnswerList with ${questionAnswerList.length} items');
      } else {
        print('❌ API returned null result');
      }
    } catch (e) {
      isLoadingQuestion.value = false;
      print('❌ Error fetching or caching data: $e');
      print('❌ Error type: ${e.runtimeType}');
    } finally {
      isLoadingQuestion.value = false;
      print('🏁 Finished questionAnswerListApi');
    }
  }
  
  void selectOption(int questionIndex, int answerIndex) {
    selectedAnswers[questionIndex] = answerIndex;
  }
  
  void goToNextQuestion() {
    if (currentQuestionIndex.value < questionAnswerList.length - 1) {
      currentQuestionIndex.value++;
    }
  }
  
  void goToPreviousQuestion() {
    if (currentQuestionIndex.value > 0) {
      currentQuestionIndex.value--;
    }
  }

  // Result calculation methods
  int getCorrectAnswers() {
    int correct = 0;
    print('🔍 Calculating correct answers...');
    print('🔍 Total questions: ${questionAnswerList.length}');
    print('🔍 Selected answers: $selectedAnswers');
    
    for (int i = 0; i < questionAnswerList.length; i++) {
      if (selectedAnswers.containsKey(i)) {
        final questionData = questionAnswerList[i];
        final selectedAnswerIndex = selectedAnswers[i]!;
        final selectedAnswer = questionData.answers?[selectedAnswerIndex];
        
        print('🔍 Question $i: Selected index $selectedAnswerIndex');
        print('🔍 Selected answer: ${selectedAnswer?.answerName}');
        print('🔍 Is correct: ${selectedAnswer?.isCorrect}');
        
        if (selectedAnswer?.isCorrect == true) {
          correct++;
          print('✅ Question $i is correct!');
        } else {
          print('❌ Question $i is wrong');
        }
      } else {
        print('⚠️ Question $i not answered');
      }
    }
    print('🔍 Total correct: $correct');
    return correct;
  }

  int getWrongAnswers() {
    int wrong = 0;
    for (int i = 0; i < questionAnswerList.length; i++) {
      if (selectedAnswers.containsKey(i)) {
        final questionData = questionAnswerList[i];
        final selectedAnswerIndex = selectedAnswers[i]!;
        final selectedAnswer = questionData.answers?[selectedAnswerIndex];
        
        if (selectedAnswer?.isCorrect != true) {
          wrong++;
        }
      }
    }
    return wrong;
  }

  int getUnansweredQuestions() {
    return questionAnswerList.length - selectedAnswers.length;
  }

  double getPercentage() {
    if (questionAnswerList.isEmpty) return 0.0;
    return (getCorrectAnswers() / questionAnswerList.length) * 100;
  }

  bool hasPassed() {
    return getPercentage() >= 70.0;
  }
}