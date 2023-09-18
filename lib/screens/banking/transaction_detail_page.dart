import 'package:flutter/material.dart';
import 'package:nssf_e_wallet/models/transactions_model.dart';

class TransactionsDetailPage extends StatelessWidget {
  //Get the detail Data
  final SingleCustomerTransactionData singleCustomerTransactionData;
  //Create a constructor that passes the data
  const TransactionsDetailPage({Key? key, required this.singleCustomerTransactionData}) : super(key: key);
  final String? title = "Transactions Detail";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: const Padding(
        padding:  EdgeInsets.all(16),
        child: Text('singleCustomerTransactionData.transactionDate!'),
      ),
    );
  }
}