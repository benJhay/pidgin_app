class StaffModel {
  bool ok;
  String msg;
  Data data;

  StaffModel({this.ok, this.msg, this.data});

  StaffModel.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int bismark;
  int mike;
  int kwakye;
  int ben;
  int maxwell;
  int kelvin;
  int nana;
  int danny;
  int ambrose;

  Data(
      {this.bismark,
      this.mike,
      this.kwakye,
      this.ben,
      this.maxwell,
      this.kelvin,
      this.nana,
      this.danny,
      this.ambrose});

  Data.fromJson(Map<String, dynamic> json) {
    bismark = json['bismark'];
    mike = json['mike'];
    kwakye = json['kwakye'];
    ben = json['ben'];
    maxwell = json['maxwell'];
    kelvin = json['kelvin'];
    nana = json['nana'];
    danny = json['danny'];
    ambrose = json['ambrose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bismark'] = this.bismark;
    data['mike'] = this.mike;
    data['kwakye'] = this.kwakye;
    data['ben'] = this.ben;
    data['maxwell'] = this.maxwell;
    data['kelvin'] = this.kelvin;
    data['nana'] = this.nana;
    data['danny'] = this.danny;
    data['ambrose'] = this.ambrose;
    return data;
  }
}