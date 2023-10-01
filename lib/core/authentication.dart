
import 'package:nssf_e_wallet/providers/api_client.dart';
import 'package:nssf_e_wallet/core/functions.dart';
import 'package:nssf_e_wallet/core/shared_preferences.dart';
import 'dart:convert';
import 'package:nssf_e_wallet/models/users_model.dart';
Future<bool> login(String loginType,String username , String password) async{
  try{
    if (loginType == "email")
    {
        Map<String, dynamic> postDataPayload = {
          "username": username,
          "password": password
        };
      String data = await authUser("login/",postDataPayload);
      if (data.isNotEmpty)
      {
        // Store user data in SharedPreferences
        UsersModel user = UsersModel.fromJson(jsonDecode(data));
        await SharedPreferencesManager.setString("email", user.userData!.email.toString());
        print(SharedPreferencesManager.getString("email"));
      }
    }
    else if(loginType == "phone")
    {
        Map<String, dynamic> postDataPayload = {
          "username": username,
          "password": password
        };
        String data = await authUser("login/",postDataPayload);
    }
    return true;
  }
  catch (e) {
      rethrow;
  }
}
