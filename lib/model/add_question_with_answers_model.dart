class QuestionMast {
  int questioNCODE;
  String questioNNAME;
  int grPCODE;
  int qtypECODE;
  bool isactive;

  QuestionMast({
    required this.questioNCODE,
    required this.questioNNAME,
    required this.grPCODE,
    required this.qtypECODE,
    required this.isactive,
  });

  Map<String, dynamic> toJson() {
    return {
      'questioN_CODE': questioNCODE,
      'questioN_NAME': questioNNAME,
      'grP_CODE': grPCODE,
      'qtypE_CODE': qtypECODE,
      'isactive': isactive,
    };
  }

  factory QuestionMast.fromJson(Map<String, dynamic> json) {
    return QuestionMast(
      questioNCODE: json['questioN_CODE'] ?? 0,
      questioNNAME: json['questioN_NAME'] ?? '',
      grPCODE: json['grP_CODE'] ?? 0,
      qtypECODE: json['qtypE_CODE'] ?? 0,
      isactive: json['isactive'] ?? true,
    );
  }
}

class Answer {
  int answerCode;
  String answerName;
  bool isCorrect;

  Answer({
    required this.answerCode,
    required this.answerName,
    required this.isCorrect,
  });

  Map<String, dynamic> toJson() {
    return {
      'answer_Code': answerCode,
      'answer_Name': answerName,
      'isCorrect': isCorrect,
    };
  }

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      answerCode: json['answer_Code'] ?? 0,
      answerName: json['answer_Name'] ?? '',
      isCorrect: json['isCorrect'] ?? false,
    );
  }
}

class AddQuestionWithAnswersModel {
  QuestionMast questionMast;
  List<Answer> answers;

  AddQuestionWithAnswersModel({
    required this.questionMast,
    required this.answers,
  });

  Map<String, dynamic> toJson() {
    return {
      'questionMast': questionMast.toJson(),
      'answers': answers.map((answer) => answer.toJson()).toList(),
    };
  }

  factory AddQuestionWithAnswersModel.fromJson(Map<String, dynamic> json) {
    return AddQuestionWithAnswersModel(
      questionMast: QuestionMast.fromJson(json['questionMast'] ?? {}),
      answers: (json['answers'] as List<dynamic>?)
          ?.map((answer) => Answer.fromJson(answer))
          .toList() ?? [],
    );
  }
}
