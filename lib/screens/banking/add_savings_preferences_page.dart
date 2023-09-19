import 'package:flutter/material.dart';
import 'package:nssf_e_wallet/models/transactions_model.dart';
import 'package:nssf_e_wallet/core/functions.dart';
class AddSavingsPreferencePage extends StatefulWidget {
  const AddSavingsPreferencePage({ Key? key }) : super(key: key);

  @override
  State<AddSavingsPreferencePage> createState() => _AddSavingsPreferencePageState();
}
class _AddSavingsPreferencePageState extends State<AddSavingsPreferencePage> {
  final String? title="Add Savings Preference";
  String? _selectedTransaction;
  String? _selectedFrequency;
  String? _selectedPercentage;
  List<TransactionTypesData>? _transactionTypesItems = [];
  List<FrequencyData>? _selectedFrequenciesItems = [];
  List<PercentageLimitsData>? _selectedPercentagesItems = [];
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
                                  value: item.transactionTypeId!.toString(),
                                  child: Text(item.transactionTypeName!.toString()),
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
                        // Frequency Type DropDown
                        InputDecorator(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedFrequency,
                              hint: const Text('Frequency'),
                              onChanged: (selectedValue) {
                                setState(() {
                                  _selectedFrequency = selectedValue;
                                });
                              },
                              items: _selectedFrequenciesItems!.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item.frequencyId!.toString(),
                                  child: Text(item.frequency!.toString()),
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
                        // Percentage DropDown
                        InputDecorator(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedPercentage,
                              hint: const Text('Percentage'),
                              onChanged: (selectedValue) {
                                setState(() {
                                  _selectedPercentage = selectedValue;
                                });
                              },
                              items: _selectedPercentagesItems!.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item.percentageId!.toString(),
                                  child: Text(item.percentage!.toString()),
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
        ],
      )
    );
  }
   // Function Used to Intialize any data needed on the Screen
  Future<void> initializeData() async {
    try
    {
      TransactionTypes transactionTypes= await geTransactionsTypes();
      setState(() {
          _transactionTypesItems = transactionTypes.data ?? []; // Update the list with parsed data
      });
      Frequency frequencies= await getFrequencies();
      setState(() {
          _selectedFrequenciesItems = frequencies.data ?? []; // Update the list with parsed data
      });
      PercentageLimits percentageLimits= await getPercentageLimits();
      setState(() {
          _selectedPercentagesItems = percentageLimits.data ?? []; // Update the list with parsed data
      });

    }
    catch (e) {
      showToast('$e');
    }
  }
}
