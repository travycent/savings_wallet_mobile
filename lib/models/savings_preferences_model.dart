class SavingsPreferencesModel {
  String? success;
  int? statusCode;
  List<SavingsPreferencesData>? data;

  SavingsPreferencesModel({this.success, this.statusCode, this.data});

  SavingsPreferencesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = <SavingsPreferencesData>[];
      json['data'].forEach((v) {
        data!.add(new SavingsPreferencesData.fromJson(v));
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

class SavingsPreferencesData {
  int? savingPreferenceId;
  String? userEmail;
  String? transactionType;
  double? percentageValue;
  double? frequencyValue;
  String? savingsPreferenceStartDate;
  String? savingsPreferenceEndDate;
  String? preferenceUpdateDate;
  int? user;
  int? transactionTypeName;
  int? percentage;
  int? frequency;

  SavingsPreferencesData(
      {this.savingPreferenceId,
      this.userEmail,
      this.transactionType,
      this.percentageValue,
      this.frequencyValue,
      this.savingsPreferenceStartDate,
      this.savingsPreferenceEndDate,
      this.preferenceUpdateDate,
      this.user,
      this.transactionTypeName,
      this.percentage,
      this.frequency});

  SavingsPreferencesData.fromJson(Map<String, dynamic> json) {
    savingPreferenceId = json['saving_preference_id'];
    userEmail = json['user_email'];
    transactionType = json['transaction_type'];
    percentageValue = json['percentage_value'];
    frequencyValue = json['frequency_value'];
    savingsPreferenceStartDate = json['savings_preference_start_date'];
    savingsPreferenceEndDate = json['savings_preference_end_date'];
    preferenceUpdateDate = json['preference_update_date'];
    user = json['user'];
    transactionTypeName = json['transaction_type_name'];
    percentage = json['percentage'];
    frequency = json['frequency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['saving_preference_id'] = this.savingPreferenceId;
    data['user_email'] = this.userEmail;
    data['transaction_type'] = this.transactionType;
    data['percentage_value'] = this.percentageValue;
    data['frequency_value'] = this.frequencyValue;
    data['savings_preference_start_date'] = this.savingsPreferenceStartDate;
    data['savings_preference_end_date'] = this.savingsPreferenceEndDate;
    data['preference_update_date'] = this.preferenceUpdateDate;
    data['user'] = this.user;
    data['transaction_type_name'] = this.transactionTypeName;
    data['percentage'] = this.percentage;
    data['frequency'] = this.frequency;
    return data;
  }
}
