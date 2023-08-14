import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nssf_e_wallet/models/transactions_model.dart';
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
