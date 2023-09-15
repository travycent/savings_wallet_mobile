import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
// Get authentication token
const String authToken = 'YOUR_AUTH_TOKEN';
//Base URL
String baseUrl=dotenv.get('BASE_URL', fallback: 'API_URL not found');
// Used to Load the environment variables based on Release Mode
Future <void> loadEnvFile() async{
  if (kReleaseMode) {
    await dotenv.load(fileName: ".env.production");
  } else {
    await dotenv.load(fileName: ".env.development");
  }
  // print(dotenv.get('BASE_URL', fallback: 'API_URL not found'));
}
//Custom API Exception Class
class ApiException implements Exception{
  final String message;
  ApiException(this.message);
  @override
  String toString() => 'ApiException: $message';
}
// Fetch Data API Function
Future<String> fetchData(String apiUrl) async{
  final client = http.Client();
  try {
    final response = await client.get(
      Uri.parse(baseUrl+apiUrl),
      // headers: {
      //   'Authorization': 'Bearer $authToken', // Add the token to the header
      // },
    ).timeout(const Duration(seconds: 20));
    if (response.statusCode >= 200 && response.statusCode < 300){
      // Successful response, handle the data
      return response.body;
    }
    else{
      // Error response from the server
      throw ApiException('Server responded with ${response.statusCode}: ${response.reasonPhrase}');
    }

  } catch (e) {
    if (e is TimeoutException) {
      // Request timeout
      throw ApiException('Request timed out');
    } else if (e is http.ClientException) {
      // Network error or request cancellation
      throw ApiException('$e');
    } else {
      // Other unhandled exceptions
      throw ApiException('$e');
    }
  } finally {
    client.close();
  }
}
// Post Data API Function
Future<String> postData(String apiUrl,Map<String, dynamic> data) async{
  final client = http.Client();
  try {
    final response = await client.post(
      Uri.parse(baseUrl+apiUrl),
       headers: {
        'Content-Type': 'application/json',
      //   'Authorization': 'Bearer $authToken', // Add the token to the header
      },
      body: jsonEncode(data),
    ).timeout(const Duration(seconds: 30));
    if (response.statusCode >= 200 && response.statusCode < 300){
      // Successful response, handle the data
      // print('Response: ${response.body}');
      return response.body;
    }
    else{
      // Error response from the server
      // final errorMessage = response.body;
      throw ApiException('Server responded with ${response.statusCode}: ${response.reasonPhrase}');
    }

  } catch (e) {
    if (e is TimeoutException) {
      // Request timeout
      throw ApiException('Request timed out');
    } else if (e is http.ClientException) {
      // Network error or request cancellation
      throw ApiException('$e');
    } else {
      // Other unhandled exceptions
      throw ApiException('$e');
    }
  } finally {
    client.close();
  }

}
// Delete Data API Function
Future<void> deleteData(String apiUrl) async{
  final client = http.Client();
  try {
    final response = await client.delete(
      Uri.parse(baseUrl+apiUrl),
      // headers: {
      //   'Authorization': 'Bearer $authToken', // Add the token to the header
      // },
      
    ).timeout(const Duration(seconds: 30));
    if (response.statusCode >= 200 && response.statusCode < 300){
      // Successful response, handle the data
      print('Response: ${response.body}');
    }
    else{
      // Error response from the server
      throw ApiException('Server responded with ${response.statusCode}: ${response.reasonPhrase}');
    }

  } catch (e) {
    if (e is TimeoutException) {
      // Request timeout
      throw ApiException('Request timed out');
    } else if (e is http.ClientException) {
      // Network error or request cancellation
      throw ApiException('$e');
    } else {
      // Other unhandled exceptions
      throw ApiException('$e');
    }
  } finally {
    client.close();
  }
  

}
// Post Data API Function
Future<String> authUser(String apiUrl,Map<String, dynamic> data) async{
  final client = http.Client();
  try {
    final response = await client.post(
      Uri.parse(baseUrl+apiUrl),
       headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    ).timeout(const Duration(seconds: 30));
    if (response.statusCode >= 200 && response.statusCode < 300){
      // Successful response, handle the data
      // print('Response: ${response.body}');
      return response.body;
    }
    else{
      // Error response from the server
      final errorMessage = json.decode(response.body)['message'];
      throw Exception('Server responded with ${response.statusCode}: $errorMessage');
    }

  } catch (e) {
    if (e is TimeoutException) {
      // Request timeout
      throw ApiException('Request timed out');
    } else if (e is http.ClientException) {
      // Network error or request cancellation
      throw ApiException('$e');
    } else {
      // Other unhandled exceptions
      throw ApiException('$e');
    }
  } finally {
    client.close();
  }

}