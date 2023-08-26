import 'package:flutter/material.dart';
import 'package:nssf_e_wallet/providers/api_client.dart';
import 'package:nssf_e_wallet/models/transactions_model.dart';
import 'package:nssf_e_wallet/core/functions.dart';
class SendPage extends StatefulWidget {
  const SendPage({ Key? key }) : super(key: key);

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  final String? title="Send Money";
  List<TransactionTypesData> transactionTypesData =[];
  int? transactionTypeId;
  final TextEditingController _amountTextFieldController = TextEditingController();
  final TextEditingController _recepientTextFieldController = TextEditingController();
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
                      controller: _recepientTextFieldController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "Receiver",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
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
              child: const Text("Send"),
              style: ElevatedButton.styleFrom(
                // Use percentages to set the minimum size
                minimumSize:const Size(100.0, 10.0) / 100.0 * MediaQuery.of(context).size.width,
              ),
              onPressed: () async{
                double? amount = double.tryParse(_amountTextFieldController.text.toString());
                amount = amount ?? 0.0;
                String? payee = _recepientTextFieldController.text.toString();
                
                bool result=await addTransaction(amount, transactionTypeId!,payee);
                if(result)
                {
                  _amountTextFieldController.clear();
                  _recepientTextFieldController.clear();
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
    try
    {
      TransactionTypes transactionTypes= await geTransactionsTypes();
      setState(() {
          transactionTypesData = transactionTypes.data ?? []; // Update the list with parsed data
      });
      int returnId=getTransactionTypeId("Send",transactionTypesData);
        setState(() {
          transactionTypeId = returnId; // Update the list with parsed data
        });
    }
    catch (e) {
      showToast('$e');
    }
  }
}