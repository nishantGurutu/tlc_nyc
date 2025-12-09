class QuestionAnswerModel {
  List<QuestionAnswerList>? questionAnswerlist;

  QuestionAnswerModel({this.questionAnswerlist});

  QuestionAnswerModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      questionAnswerlist = <QuestionAnswerList>[];
      json['list'].forEach((v) {
        questionAnswerlist!.add(new QuestionAnswerList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.questionAnswerlist != null) {
      data['list'] = this.questionAnswerlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuestionAnswerList {
  String? sId;
  String? questionTypeId;
  String? questionText;
  String? optionA;
  String? optionB;
  String? optionC;
  String? optionD;
  String? correctOption;
  String? createdAt;
  String? updatedAt;
  int? iV;

  QuestionAnswerList({
    this.sId,
    this.questionTypeId,
    this.questionText,
    this.optionA,
    this.optionB,
    this.optionC,
    this.optionD,
    this.correctOption,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  QuestionAnswerList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    questionTypeId = json['questionTypeId'];
    questionText = json['questionText'];
    optionA = json['optionA'];
    optionB = json['optionB'];
    optionC = json['optionC'];
    optionD = json['optionD'];
    correctOption = json['correctOption'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['questionTypeId'] = this.questionTypeId;
    data['questionText'] = this.questionText;
    data['optionA'] = this.optionA;
    data['optionB'] = this.optionB;
    data['optionC'] = this.optionC;
    data['optionD'] = this.optionD;
    data['correctOption'] = this.correctOption;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
