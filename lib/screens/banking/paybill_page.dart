import 'package:flutter/material.dart';
import 'package:nssf_e_wallet/models/billers_model.dart';
import 'package:nssf_e_wallet/core/functions.dart';
import 'package:nssf_e_wallet/models/transactions_model.dart';
class PayBillPage extends StatefulWidget {
  const PayBillPage({ Key? key }) : super(key: key);

  @override
  State<PayBillPage> createState() => _PayBillPagePageState();
}
class _PayBillPagePageState extends State<PayBillPage> {
  final String? title="Pay Bill";
  List<TransactionTypesData> transactionTypesData =[];
  int? transactionTypeId;
  final TextEditingController _amountTextFieldController = TextEditingController();
  String? _selectedBiller;
  List<BillersData>? _billersItems = [];
  bool _loading = false;
  // Callback function to update the loading state
  void setLoading(bool loading) {
    setState(() {
      _loading = loading;
    });
  }
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
      body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Biller Type DropDown
                          InputDecorator(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _selectedBiller,
                                hint: const Text('Billers'),
                                onChanged: (selectedValue) {
                                  setState(() {
                                    _selectedBiller = selectedValue;
                                  });
                                },
                                items: _billersItems!.map((item) {
                                  return DropdownMenuItem<String>(
                                    value: item.billerId!.toString(),
                                    child: Text(item.biller!.toString()),
                                  );
                                }).toList(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                icon: const Icon(Icons.arrow_drop_down),
                                isExpanded: true,
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
                          
                          const SizedBox(height: 10.0),
                          
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    child: const Text("Pay Bill"),
                    style: ElevatedButton.styleFrom(
                      // Use percentages to set the minimum size
                      minimumSize: const Size(100.0, 10.0) /
                          100.0 *
                          MediaQuery.of(context).size.width,
                    ),
                    onPressed: () async{
                      //display loading
                      setLoading(true);
                      double? amount = double.tryParse(_amountTextFieldController.text.toString());
                      amount = amount ?? 0.0;
                      String? payee = _selectedBiller;
                      
                      bool result=await addTransaction(amount, transactionTypeId!,payee!);
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
            if (_loading)
            const Center(
              child: CircularProgressIndicator(), // Show circular progress indicator when loading
            ),
          ],
        )
    );
  }
     // Function Used to Intialize any data needed on the Screen
  Future<void> initializeData() async {
    try
    {
      //display loading
      setLoading(true);
      TransactionTypes transactionTypes= await geTransactionsTypes();
      setState(() {
          transactionTypesData = transactionTypes.data ?? []; // Update the list with parsed data
      });
      int returnId=getTransactionTypeId("Pay Bill",transactionTypesData);
        setState(() {
          transactionTypeId = returnId; // Update the list with parsed data
        });
      BillersModel billers= await getBillers();
      setState(() {
          _billersItems = billers.data ?? []; // Update the list with parsed data
      });
      //disable loading
      setLoading(false);

    }
    catch (e) {
      //disable loading
      setLoading(false);
      showToast('$e');
    }
  }
}

