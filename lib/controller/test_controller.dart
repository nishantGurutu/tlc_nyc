import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/model/question_model.dart';
import 'package:tlc_nyc/service/test_service.dart';

class TestController extends GetxController {
  final RxInt currentQuestionIndex = 0.obs;
  final RxList<Question> questions = <Question>[].obs;
  final RxMap<int, String> selectedAnswers = <int, String>{}.obs;
  final RxBool isLoading = false.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;
  String? testTypeName;

  @override
  void onInit() {
    super.onInit();
  }

   
  Future<void> loadQuestionsForTestType(int testTypeId) async {
    isLoading.value = true;
    hasError.value = false;
    errorMessage.value = '';
    
    try {
      final result = await TestService().questionList(testTypeId: testTypeId);
      if (result != null && result.isNotEmpty) {
        questions.value = result;
      } else {
        questions.value = [];
      }
    } catch (e) {
      try {
        final String jsonString = await rootBundle.loadString(
          'assets/question.json',
        );
        final List<dynamic> jsonData = json.decode(jsonString);
        questions.value = jsonData.map((e) => Question.fromJson(e)).toList();
      } catch (jsonError) {
        hasError.value = true;
        errorMessage.value = 'Failed to load questions: $e';
        questions.value = [];
      }
    } finally {
      isLoading.value = false;
    }
  }

  void selectOption(int questionIndex, String optionKey) {
    selectedAnswers[questionIndex] = optionKey;
  }

  void goToNextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
    }
  }

  void goToPreviousQuestion() {
    if (currentQuestionIndex.value > 0) {
      currentQuestionIndex.value--;
    }
  }

  int getCorrectAnswers() {
    int correct = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers.containsKey(i)) {
        if (selectedAnswers[i] == questions[i].correctAnswer) {
          correct++;
        }
      }
    }
    return correct;
  }

  int getWrongAnswers() {
    int wrong = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers.containsKey(i)) {
        if (selectedAnswers[i] != questions[i].correctAnswer) {
          wrong++;
        }
      }
    }
    return wrong;
  }

  int getUnansweredQuestions() {
    return questions.length - selectedAnswers.length;
  }

  double getPercentage() {
    if (questions.isEmpty) return 0.0;
    return (getCorrectAnswers() / questions.length) * 100;
  }

  bool hasPassed() {
    return getPercentage() >= 70.0;  
  }
}
