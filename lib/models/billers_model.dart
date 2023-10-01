class BillersModel {
  String? success;
  int? statusCode;
  List<BillersData>? data;

  BillersModel({this.success, this.statusCode, this.data});

  BillersModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = <BillersData>[];
      json['data'].forEach((v) {
        data!.add(new BillersData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BillersData {
  int? billerId;
  String? biller;
  String? createdOn;

  BillersData({this.billerId, this.biller, this.createdOn});

  BillersData.fromJson(Map<String, dynamic> json) {
    billerId = json['biller_id'];
    biller = json['biller'];
    createdOn = json['created_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['biller_id'] = this.billerId;
    data['biller'] = this.biller;
    data['created_on'] = this.createdOn;
    return data;
  }
}
