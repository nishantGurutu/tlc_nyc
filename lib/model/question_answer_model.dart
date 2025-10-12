class QuestionAnswerModel {
  Questions? questionMast;
  List<Answers>? answers;

  QuestionAnswerModel({this.questionMast, this.answers});

  QuestionAnswerModel.fromJson(Map<String, dynamic> json) {
    questionMast = json['questionMast'] != null
        ? new Questions.fromJson(json['questionMast'])
        : null;
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(new Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.questionMast != null) {
      data['questionMast'] = this.questionMast!.toJson();
    }
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  int? questioNCODE;
  String? questioNNAME;
  int? grPCODE;
  int? qtypECODE;
  bool? isactive;

  Questions(
      {this.questioNCODE,
      this.questioNNAME,
      this.grPCODE,
      this.qtypECODE,
      this.isactive});

  Questions.fromJson(Map<String, dynamic> json) {
    questioNCODE = json['questioN_CODE'];
    questioNNAME = json['questioN_NAME'];
    grPCODE = json['grP_CODE'];
    qtypECODE = json['qtypE_CODE'];
    isactive = json['isactive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questioN_CODE'] = this.questioNCODE;
    data['questioN_NAME'] = this.questioNNAME;
    data['grP_CODE'] = this.grPCODE;
    data['qtypE_CODE'] = this.qtypECODE;
    data['isactive'] = this.isactive;
    return data;
  }
}

class Answers {
  int? answerCode;
  String? answerName;
  dynamic isCorrect;

  Answers({this.answerCode, this.answerName, this.isCorrect});

  Answers.fromJson(Map<String, dynamic> json) {
    answerCode = json['answer_Code'];
    answerName = json['answer_Name'];
    isCorrect = json['isCorrect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer_Code'] = this.answerCode;
    data['answer_Name'] = this.answerName;
    data['isCorrect'] = this.isCorrect;
    return data;
  }
}
