class QuestionTypeListModel {
  int? qtypECODE;
  String? qtypENAME;
  bool? isactive;

  QuestionTypeListModel({this.qtypECODE, this.qtypENAME, this.isactive});

  QuestionTypeListModel.fromJson(Map<String, dynamic> json) {
    qtypECODE = json['qtypE_CODE'];
    qtypENAME = json['qtypE_NAME'];
    isactive = json['isactive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qtypE_CODE'] = this.qtypECODE;
    data['qtypE_NAME'] = this.qtypENAME;
    data['isactive'] = this.isactive;
    return data;
  }
}
