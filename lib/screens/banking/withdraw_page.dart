import 'package:flutter/material.dart';
import 'package:nssf_e_wallet/providers/api_client.dart';
import 'package:nssf_e_wallet/models/transactions_model.dart';
import 'dart:convert';
import 'package:nssf_e_wallet/core/functions.dart';
class WithdrawPage extends StatefulWidget {
  const WithdrawPage({ Key? key }) : super(key: key);

  @override
  State<WithdrawPage> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  final String? title="Withdaw";
  List<TransactionTypesData> transactionTypesData =[];
  int? transactionTypeId;
  final TextEditingController _amountTextFieldController = TextEditingController();
  @override
  void initState(){
    super.initState();
    initializeData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _amountTextFieldController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Enter Amount",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2.0),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: const Text("Withdraw"),
              style: ElevatedButton.styleFrom(
                // Use percentages to set the minimum size
                minimumSize:const Size(100.0, 10.0) / 100.0 * MediaQuery.of(context).size.width,
              ),
              onPressed: () async{
                // Todo
                double? amount = double.tryParse(_amountTextFieldController.text.toString());
                amount = amount ?? 0.0;

                bool result=await addTransaction(amount, transactionTypeId!);
                if(result)
                {
                  _amountTextFieldController.clear();
                  showToast('Transaction Completed Successfully');
                }
              },
            ),
          ),
        ],
      ),

    );
  }
  // Function Used to Intialize any data needed on the Screen
  Future<void> initializeData() async {
    TransactionTypes transactionTypes= await geTransactionsTypes();
    setState(() {
        transactionTypesData = transactionTypes.data ?? []; // Update the list with parsed data
    });
    int returnId=getTransactionTypeId("Withdraw",transactionTypesData);
      setState(() {
        transactionTypeId = returnId; // Update the list with parsed data
      });
  }
}