class CustomerTransactions {
  String? success;
  int? statusCode;
  List<SingleCustomerTransactionData>? data;

  CustomerTransactions({this.success, this.statusCode, this.data});

  CustomerTransactions.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = <SingleCustomerTransactionData>[];
      json['data'].forEach((v) {
        data!.add(new SingleCustomerTransactionData.fromJson(v));
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

class SingleCustomerTransactionData {
  int? transactionId;
  double? transactionAmount;
  String? userEmail;
  String? transactionType;
  String? transactionRef;
  String? payee;
  String? transactionDesc;
  String? transactionDate;
  int? user;
  int? transactionTypeName;

  SingleCustomerTransactionData(
      {this.transactionId,
      this.transactionAmount,
      this.userEmail,
      this.transactionType,
      this.transactionRef,
      this.payee,
      this.transactionDesc,
      this.transactionDate,
      this.user,
      this.transactionTypeName});

  SingleCustomerTransactionData.fromJson(Map<String, dynamic> json) {
    transactionId = json['transaction_id'];
    transactionAmount = json['transaction_amount'];
    userEmail = json['user_email'];
    transactionType = json['transaction_type'];
    transactionRef = json['transaction_ref'];
    payee = json['payee'];
    transactionDesc = json['transaction_desc'];
    transactionDate = json['transaction_date'];
    user = json['user'];
    transactionTypeName = json['transaction_type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transaction_id'] = this.transactionId;
    data['transaction_amount'] = this.transactionAmount;
    data['user_email'] = this.userEmail;
    data['transaction_type'] = this.transactionType;
    data['transaction_ref'] = this.transactionRef;
    data['payee'] = this.payee;
    data['transaction_desc'] = this.transactionDesc;
    data['transaction_date'] = this.transactionDate;
    data['user'] = this.user;
    data['transaction_type_name'] = this.transactionTypeName;
    return data;
  }
}
