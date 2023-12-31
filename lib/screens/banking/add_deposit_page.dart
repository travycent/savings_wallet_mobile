import 'package:flutter/material.dart';
import 'package:nssf_e_wallet/providers/api_client.dart';
import 'package:nssf_e_wallet/models/transactions_model.dart';
import 'dart:convert';
import 'package:nssf_e_wallet/core/functions.dart';
class DepositPage extends StatefulWidget {
  const DepositPage({ Key? key }) : super(key: key);

  @override
  State<DepositPage> createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  final String? title="Deposit";
  List<TransactionTypesData> transactionTypesData =[];
  int? transactionTypeId;
  final TextEditingController _amountTextFieldController = TextEditingController();
  bool _loading = false;
     // Callback function to update the loading state
  void setLoading(bool loading) {
    setState(() {
      _loading = loading;
    });
  }
  @override
  void initState() {
    super.initState();
    geTransactionsTypes();
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
                    if (_loading)
                      const Center(
                        child: CircularProgressIndicator(), // Center the circular progress indicator
                      ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: const Text("Deposit"),
              style: ElevatedButton.styleFrom(
                // Use percentages to set the minimum size
                minimumSize:const Size(100.0, 10.0) / 100.0 * MediaQuery.of(context).size.width,
              ),
              onPressed: () async{
                //display loading
                setLoading(true);
                // Todo
                double? amount = double.tryParse(_amountTextFieldController.text.toString());
                amount = amount ?? 0.0;
                String payee = "";

                bool result=await addTransaction(amount, transactionTypeId!,payee);
                //display loading
                setLoading(false);
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
  
  Future<void> geTransactionsTypes() async {
    try {
      String data = await fetchData("transaction-types/");
      // print('API Response: $data'); // Print the API response to the console
      TransactionTypes transactionTypes = TransactionTypes.fromJson(jsonDecode(data));
      // print('Parsed Transactions Types: $transactionTypes'); // Print the parsed object

      setState(() {
        transactionTypesData = transactionTypes.data ?? []; // Update the list with parsed data
      });
      int returnId=getTransactionTypeId("Deposit",transactionTypesData);
      setState(() {
        transactionTypeId = returnId; // Update the list with parsed data
      });

    } catch (e) {
      // print('Error fetching or parsing data: $e');
      showToast('$e');
    }
  }
}