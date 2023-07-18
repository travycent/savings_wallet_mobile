import 'package:flutter/material.dart';
class PayBillPage extends StatefulWidget {
  const PayBillPage({ Key? key }) : super(key: key);

  @override
  State<PayBillPage> createState() => _PayBillPagePageState();
}
class _PayBillPagePageState extends State<PayBillPage> {
  final String? title="Pay Bill";
  final TextEditingController _amountTextFieldController = TextEditingController();

  String? _selectedTransaction;
  String? _selectedFrequency;

    // Sample data for dynamic text
  List<String>? _transactionTypesItems = ["Option 1", "Option 2", "Option 3"];
  List<String>? _selectedFrequeciesItems = ["Choice A", "Choice B", "Choice C"];


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
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Transaction Type DropDown
                    InputDecorator(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedTransaction,
                          hint: const Text('Transaction Type'),
                          onChanged: (selectedValue) {
                            setState(() {
                              _selectedTransaction = selectedValue;
                            });
                          },
                          items: _transactionTypesItems!.map((item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
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
              child: const Text("Save"),
              style: ElevatedButton.styleFrom(
                // Use percentages to set the minimum size
                minimumSize: const Size(100.0, 10.0) /
                    100.0 *
                    MediaQuery.of(context).size.width,
              ),
              onPressed: () {
                // Todo
              },
            ),
          ),
        ],
      ),
    );
  }
}

