class CustomerWallet{
  String? success;
  int? statusCode;
  List<CustomerWalletData>? data;

  CustomerWallet({this.success, this.statusCode, this.data});

  CustomerWallet.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = <CustomerWalletData>[];
      json['data'].forEach((v) {
        data!.add(new CustomerWalletData.fromJson(v));
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

class CustomerWalletData {
  int? walletId;
  int? user;
  double? activeWalletBalance;
  double? savingWalletBalance;
  String? walletUpdateDate;

  CustomerWalletData(
      {this.walletId,
      this.user,
      this.activeWalletBalance,
      this.savingWalletBalance,
      this.walletUpdateDate});

  CustomerWalletData.fromJson(Map<String, dynamic> json) {
    walletId = json['wallet_id'];
    user = json['user'];
    activeWalletBalance = json['active_wallet_balance'];
    savingWalletBalance = json['saving_wallet_balance'];
    walletUpdateDate = json['wallet_update_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wallet_id'] = this.walletId;
    data['user'] = this.user;
    data['active_wallet_balance'] = this.activeWalletBalance;
    data['saving_wallet_balance'] = this.savingWalletBalance;
    data['wallet_update_date'] = this.walletUpdateDate;
    return data;
  }
}
