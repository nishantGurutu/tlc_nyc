class TestTypeModel {
  int? grPCODE;
  String? grPNAME;
  bool? isactive;

  TestTypeModel({this.grPCODE, this.grPNAME, this.isactive});

  TestTypeModel.fromJson(Map<String, dynamic> json) {
    grPCODE = json['grP_CODE'];
    grPNAME = json['grP_NAME'];
    isactive = json['isactive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grP_CODE'] = this.grPCODE;
    data['grP_NAME'] = this.grPNAME;
    data['isactive'] = this.isactive;
    return data;
  }
}
