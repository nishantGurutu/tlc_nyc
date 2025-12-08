class QuestionTypeListModel {
  bool? status;
  String? message;
  List<QuestionTypeList>? questionTypeData;

  QuestionTypeListModel({this.status, this.message, this.questionTypeData});

  QuestionTypeListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      questionTypeData = <QuestionTypeList>[];
      json['data'].forEach((v) {
        questionTypeData!.add(new QuestionTypeList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.questionTypeData != null) {
      data['data'] = this.questionTypeData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuestionTypeList {
  String? sId;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? iV;

  QuestionTypeList({
    this.sId,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  QuestionTypeList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
