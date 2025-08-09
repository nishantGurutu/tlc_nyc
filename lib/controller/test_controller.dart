import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/model/question_model.dart';

// class TestController extends GetxController {
//   final RxInt currentQuestionIndex = 0.obs;
//   final RxList<Question> questions = <Question>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     loadQuestions();
//   }

//   Future<void> loadQuestions() async {
//     final String jsonString = await rootBundle.loadString(
//       'assets/question.json',
//     );
//     final List<dynamic> jsonData = json.decode(jsonString);
//     questions.value = jsonData.map((e) => Question.fromJson(e)).toList();
//   }

//   void goToNextQuestion() {
//     if (currentQuestionIndex.value < questions.length - 1) {
//       currentQuestionIndex.value++;
//     }
//   }

//   void goToPreviousQuestion() {
//     if (currentQuestionIndex.value > 0) {
//       currentQuestionIndex.value--;
//     }
//   }
// }
class TestController extends GetxController {
  final RxInt currentQuestionIndex = 0.obs;
  final RxList<Question> questions = <Question>[].obs;

  // Store selected option for each question
  final RxMap<int, String> selectedAnswers = <int, String>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    final String jsonString = await rootBundle.loadString(
      'assets/question.json',
    );
    final List<dynamic> jsonData = json.decode(jsonString);
    questions.value = jsonData.map((e) => Question.fromJson(e)).toList();
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
}
