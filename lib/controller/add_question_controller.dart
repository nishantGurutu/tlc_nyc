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

  // Future<bool> addQuestionWithAnswers({
  //   required String questionName,
  //   required int questionTypeCode,
  //   required List<Map<String, dynamic>> answers,
  // }) async {
  //   isLoading.value = true;
  //   try {
  //     final questionMast = QuestionMast(
  //       questioNCODE: 0,
  //       questioNNAME: questionName,
  //       grPCODE: 0,
  //       qtypECODE: questionTypeCode,
  //       isactive: true,
  //     );

  //     final answersList =
  //         answers
  //             .map(
  //               (answer) => Answer(
  //                 answerCode: 0,
  //                 answerName: answer['name'],
  //                 isCorrect: answer["isCorrect"],
  //               ),
  //             )
  //             .toList();

  //     final questionWithAnswers = AddQuestionWithAnswersModel(
  //       questionMast: questionMast,
  //       answers: answersList,
  //     );

  //     // final result = await _addQuestionService.addQuestionWithAnswers(
  //     //   questionWithAnswers,
  //     // );

  //     // if (result) {
  //     //   final questions = await _addQuestionService
  //     //       .getQuestionWithAnswersByTypeCode(questionTypeCode);

  //     //   if (questions != null) {
  //     //     Get.snackbar(
  //     //       'Success',
  //     //       'Question with answers added successfully. Retrieved ${questions.length} questions.',
  //     //       snackPosition: SnackPosition.BOTTOM,
  //     //     );
  //     //   } else {
  //     //     Get.snackbar(
  //     //       'Success',
  //     //       'Question with answers added successfully, but failed to retrieve updated questions.',
  //     //       snackPosition: SnackPosition.BOTTOM,
  //     //     );
  //     //   }
  //     // } else {
  //     //   Get.snackbar(
  //     //     'Error',
  //     //     'Failed to add question with answers',
  //     //     snackPosition: SnackPosition.BOTTOM,
  //     //   );
  //     // }

  //     // return result;
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       'Error adding question with answers: $e',
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //     return false;
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  var isLoadingQuestion = false.obs;
  RxList<QuestionAnswerModel> questionAnswerList = <QuestionAnswerModel>[].obs;

  var currentQuestionIndex = 0.obs;
  var selectedAnswers = <int, int>{}.obs;
  var revealedAnswers = <int, bool>{}.obs;

  Future<void> questionAnswerListApi(int testTypeId) async {
    isLoadingQuestion.value = true;
    try {
      // final result = await AddQuestionService()
      //     .getQuestionWithAnswersByTypeCode(testTypeId);

      // if (result != null) {
      //   questionAnswerList.assignAll(result);
      //   currentQuestionIndex.value = 0;
      //   selectedAnswers.clear();
      //   revealedAnswers.clear();
      // }
    } catch (e) {
      isLoadingQuestion.value = false;
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
        final selectedAnswer = questionData.answers?[selectedAnswerIndex];

        if (selectedAnswer?.isCorrect == true) {
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
