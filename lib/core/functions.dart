import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nssf_e_wallet/providers/api_client.dart';
import 'package:nssf_e_wallet/models/transactions_model.dart';
import 'dart:convert';
void showToast(String text)
{
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 8,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

// Function to return one transaction_type Id from an array
int getTransactionTypeId(String value, List<TransactionTypesData> transactionTypesData) {
  // Create a Map to associate transaction type names with their IDs
  Map<String, int> transactionTypeMap = Map.fromIterable(
    transactionTypesData,
    key: (transactionType) => transactionType.transactionTypeName,
    value: (transactionType) => transactionType.transactionTypeId,
  );

  // Look up the transaction type ID using the provided value
  int transactionTypeId = transactionTypeMap[value] ?? -1;

  // Print a message if the value is not found in the list
  if (transactionTypeId == -1) {
    // Throw an Exception of not found
    throw  Exception("There is no valid $value. Please contact the Admin");
    // print("$value not found in the list");
  }

  // Return the transaction type ID
  return transactionTypeId;
}
// Function to handle Transactions
Future<bool> addTransaction(double amount, int transactionTypeId,String payee) async
{
  try {
    Map<String, dynamic> postDataPayload = {
      "transaction_amount": amount,
      "transaction_type_name": transactionTypeId,
      "payee" : payee,
      // Add other data key-value pairs as needed
    };
      await postData("create-customer-transaction/centtravy@gmail.com/",postDataPayload);
      return true;
  } catch (e) {
    showToast('$e');
    return false;
  }
}
// Function to get Transactions
Future<TransactionTypes> geTransactionsTypes() async {
      try {
      String data = await fetchData("transaction-types/");
      // print('API Response: $data'); // Print the API response to the console
      TransactionTypes transactionTypes = TransactionTypes.fromJson(jsonDecode(data));
      return transactionTypes;

    } catch (e) {
      // print('Error fetching or parsing data: $e');
      //showToast('$e');
      rethrow;
    }
}
// Function to get Frequencies
Future<Frequency> getFrequencies() async {
      try {
      String data = await fetchData("frequency/");
      // print('API Response: $data'); // Print the API response to the console
      Frequency frequencies = Frequency.fromJson(jsonDecode(data));
      return frequencies;

    } catch (e) {
      // print('Error fetching or parsing data: $e');
      //showToast('$e');
      rethrow;
    }
}
// Function to get percentage limits
Future<PercentageLimits> getPercentageLimits() async {
      try {
      String data = await fetchData("percentage-limits/");
      //print('API Response: $data'); // Print the API response to the console
      PercentageLimits percentageLimits = PercentageLimits.fromJson(jsonDecode(data));
      return percentageLimits;

    } catch (e) {
      // print('Error fetching or parsing data: $e');
      //showToast('$e');
      rethrow;
    }
}
// Function check existing user
Future<bool> checkUserExists(String email)async{
  if(email == null){
    throw Exception("Recepient cannot be null"); 
  }
  else
  {
    return true;
  }

  

}


