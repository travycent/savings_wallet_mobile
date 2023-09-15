
import 'package:nssf_e_wallet/providers/api_client.dart';
import 'package:nssf_e_wallet/core/functions.dart';
import 'dart:convert';
Future<bool> login(String login_type,String username , String password) async{
  try{
    if (login_type == "email")
    {
        Map<String, dynamic> postDataPayload = {
          "username": username,
          "password": password
        };
      String data = await authUser("login/",postDataPayload);
    }
    else if(login_type == "phone")
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
