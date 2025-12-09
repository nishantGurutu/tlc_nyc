import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/controller/home_controller.dart';
import 'package:tlc_nyc/model/question_answer_model.dart';
import 'package:tlc_nyc/service/add_question_service.dart';
import 'package:tlc_nyc/utils/custom_snakbar.dart';

class AddQuestionController extends GetxController {
  final AddQuestionService _addQuestionService = AddQuestionService();
  final HomeController homeController = Get.find<HomeController>();
  var isLoading = false.obs;
  var questionTypes = <String>[].obs;
  var selectedQuestionType = ''.obs;
  var selectedGroupCode = 0.obs;
  Rx<File> pickedFile = File('').obs;

  Future<void> addQuestionType(String questionTypeName, File value) async {
    isLoading.value = true;
    try {
      final response = await _addQuestionService.addQuestionType(
        questionTypeName,
        value,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Navigator.pop(Get.context!);
        await homeController.questionTypeListApi();
        CustomSnackBar.success("Success", response.data["message"]);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Error adding question type: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addQuestionAnswer({
    required String questionTypeId,
    required String questionText,
    required String optionA,
    required String optionB,
    required String optionC,
    required String optionD,
    required String correctOption,
  }) async {
    isLoading.value = true;

    final body = {
      "questionTypeId": questionTypeId,
      "questionText": questionText,
      "optionA": optionA,
      "optionB": optionB,
      "optionC": optionC,
      "optionD": optionD,
      "correctOption": correctOption,
    };

    try {
      final response = await _addQuestionService.addQuestionAnswer(body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Navigator.pop(Get.context!);
        CustomSnackBar.success("Success", response.data["message"]);
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Error adding question: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  var isLoadingQuestion = false.obs;
  RxList<QuestionAnswerList> questionAnswerList = <QuestionAnswerList>[].obs;

  var currentQuestionIndex = 0.obs;
  var selectedAnswers = <int, int>{}.obs;
  var revealedAnswers = <int, bool>{}.obs;

  Future<void> questionAnswerListApi({required String typeId}) async {
    isLoadingQuestion.value = true;
    try {
      final response = await _addQuestionService.questionTypeList(typeId);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> list = response.data["list"] ?? [];
        questionAnswerList.assignAll(
          list.map((e) => QuestionAnswerList.fromJson(e)).toList(),
        );
        print('Total items: ${questionAnswerList.length}');
      }
    } catch (e) {
      print('exception data $e');
    } finally {
      isLoadingQuestion.value = false;
    }
  }

  void selectOption(int questionIndex, int answerIndex) {
    selectedAnswers[questionIndex] = answerIndex;
  }

  void revealAnswer(int questionIndex) {
    revealedAnswers[questionIndex] = true;
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

  int getCorrectAnswers() {
    int correct = 0;

    for (int i = 0; i < questionAnswerList.length; i++) {
      if (selectedAnswers.containsKey(i)) {
        final questionData = questionAnswerList[i];
        final selectedAnswerIndex = selectedAnswers[i]!;
        final selectedAnswer = questionData.correctOption?[selectedAnswerIndex];

        if (selectedAnswer?.isEmpty == true) {
          correct++;
        }
      }
    }
    return correct;
  }

  int getWrongAnswers() {
    int wrong = 0;
    for (int i = 0; i < questionAnswerList.length; i++) {
      if (selectedAnswers.containsKey(i)) {
        final questionData = questionAnswerList[i];
        final selectedAnswerIndex = selectedAnswers[i]!;
        final selectedAnswer = questionData.correctOption?[selectedAnswerIndex];

        if (selectedAnswer?.isEmpty != true) {
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
