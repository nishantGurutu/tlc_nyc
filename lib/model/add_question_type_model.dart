class AddQuestionTypeModel {
  int qtypECODE;
  String qtypENAME;
  bool isactive;

  AddQuestionTypeModel({
    required this.qtypECODE,
    required this.qtypENAME,
    required this.isactive,
  });

  Map<String, dynamic> toJson() {
    return {
      'qtypE_CODE': qtypECODE,
      'qtypE_NAME': qtypENAME,
      'isactive': isactive,
    };
  }

  factory AddQuestionTypeModel.fromJson(Map<String, dynamic> json) {
    return AddQuestionTypeModel(
      qtypECODE: json['qtypE_CODE'] ?? 0,
      qtypENAME: json['qtypE_NAME'] ?? '',
      isactive: json['isactive'] ?? true,
    );
  }
}

