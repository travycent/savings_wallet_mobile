class UsersModel {
  String? token;
  UserData? userData;

  UsersModel({this.token, this.userData});

  UsersModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    return data;
  }
}

class UserData {
  int? id;
  String? email;
  String? phoneNumber;
  String? firstName;
  String? lastName;
  String? userImage;
  String? dateJoined;

  UserData(
      {this.id,
      this.email,
      this.phoneNumber,
      this.firstName,
      this.lastName,
      this.userImage,
      this.dateJoined});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userImage = json['user_image'];
    dateJoined = json['date_joined'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_image'] = this.userImage;
    data['date_joined'] = this.dateJoined;
    return data;
  }
}
