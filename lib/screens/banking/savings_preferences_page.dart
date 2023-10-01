import 'package:flutter/material.dart';
import 'package:nssf_e_wallet/providers/api_client.dart';
import 'package:nssf_e_wallet/models/savings_preferences_model.dart';
import 'package:nssf_e_wallet/screens/banking/add_savings_preferences_page.dart';
import 'dart:convert';
import 'package:nssf_e_wallet/core/functions.dart';
import 'package:intl/intl.dart';
import 'package:nssf_e_wallet/screens/banking/savings_preference_detail.dart';

class SavingsPreferencesPage extends StatefulWidget {
  const SavingsPreferencesPage({ Key? key }) : super(key: key);

  @override
  State<SavingsPreferencesPage> createState() => _SavingsPreferencesPageState();
}
class _SavingsPreferencesPageState extends State<SavingsPreferencesPage> {
  final String? title = "Saving Preferences";
  List<SavingsPreferencesData> cardData =[];
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
    getCustomerSavingPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body : Stack(
        children: [
          Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0), // Adjust the radius as needed
                    color: Theme.of(context).primaryColor, // Use the primary color of the theme
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white, // Set the icon color to white
                    ),
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => const AddSavingsPreferencePage())
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: cardData.isNotEmpty ? cardData.length : 1,
                  itemBuilder: (context, index) {
                    if (cardData.isEmpty) {
                      return const Center(
                        child: Text("No data found"),
                      );
                    } else {
                      //Extract the First Letter for the Avatar
                      String avatarText = cardData[index].transactionType?.substring(0, 1) ?? "";
                      String transactionType=cardData[index].transactionType ?? "";
                      // Convert the input datetime string to a DateTime object
                      DateTime dateTime = DateTime.parse(cardData[index].savingsPreferenceEndDate!);
                      String formattedDatetime = DateFormat('yyyy/MM/dd').format(dateTime);
                      //String freq = cardData[index].frequencyValue.toString() ?? "0";
                      //String percentage = cardData[index].percentageValue.toString() ?? "0";
                      
                      return Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        height: 100,
                        width: double.maxFinite,
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 2.0),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.amber,
                                    child: Text(
                                      avatarText,
                                      style: const TextStyle(fontSize: 24, color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      transactionType,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      formattedDatetime,
                                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>  SavingsPreferenceDetailPage(savingsPreferencesData: cardData[index])),
                                          );
                                    },
                                    child: const Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(
                                        Icons.chevron_right,
                                        size: 50,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
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
      ),
      
    );
  }
  // Get customer savings preferences
  Future<void> getCustomerSavingPreferences() async {
  try {
    //display loading
    setLoading(true);
    String data = await fetchData("get-customer-saving-preferences/$loggedEmail/");
    // print('API Response: $data'); // Print the API response to the console
    SavingsPreferencesModel savingsPreferencesModel = SavingsPreferencesModel.fromJson(jsonDecode(data));
    // print('Parsed CustomerTransactions: $customerTransactions'); // Print the parsed object

    setState(() {
      cardData = savingsPreferencesModel.data ?? []; // Update the list with parsed data
    });
    //disable loading
    setLoading(false);

  } catch (e) {
    // print('Error fetching or parsing data: $e');
    //disable loading
    setLoading(false);
    showToast('$e');
  }
}
}

