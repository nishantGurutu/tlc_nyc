import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/model/question_model.dart';
import 'package:tlc_nyc/model/test_type_model.dart';
import 'package:tlc_nyc/service/test_service.dart';

class TestController extends GetxController {
  final RxInt currentQuestionIndex = 0.obs;
  final RxList<Question> questions = <Question>[].obs;
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

  RxList<TestTypeModel> groupListData = <TestTypeModel>[].obs;
  var isQuestionLoading = false.obs;
  Future<void> qusetionAnswerByid() async {
    isQuestionLoading.value = true;

    try {
      final result = await TestService().groupList();
      if (result != null) {
        groupListData.assignAll(result);
        isQuestionLoading.value = false;
        isQuestionLoading.refresh();
      }
      print('API response: ${groupListData.length} items loaded');
    } catch (e) {
      print('Error fetching or caching data: $e');
    } finally {
      isQuestionLoading.value = false;
    }
  }
}
