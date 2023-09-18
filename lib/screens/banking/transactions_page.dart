import 'package:flutter/material.dart';
import 'package:nssf_e_wallet/providers/api_client.dart';
import 'package:nssf_e_wallet/models/transactions_model.dart';
import 'package:nssf_e_wallet/partials/bottom_navigation_handler.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:nssf_e_wallet/core/functions.dart';
import 'package:nssf_e_wallet/screens/banking/transaction_detail_page.dart';
class TransactionsPage extends StatefulWidget {
  const TransactionsPage({ Key? key }) : super(key: key);

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}
class _TransactionsPageState extends State<TransactionsPage> {
  final String? title = "Transactions";
  int _currentIndex = 0;
  List<SingleCustomerTransactionData> cardData =[];
  //final SingleCustomerTransactionData transactionData;
  bool _loading = false;
  // Callback function to update the loading state
  void setLoading(bool loading) {
    setState(() {
      _loading = loading;
    });
  } 
  Future<void> getCustomerTransactions() async {
    try {
      //display loading
      setLoading(true);
      String data = await fetchData("customer-transactions/centtravy@gmail.com/");
      // print('API Response: $data'); // Print the API response to the console
      
      CustomerTransactions customerTransactions = CustomerTransactions.fromJson(jsonDecode(data));
      // print('Parsed CustomerTransactions: $customerTransactions'); // Print the parsed object

      setState(() {
        cardData = customerTransactions.data ?? []; // Update the list with parsed data
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
  @override
  void initState() {
    super.initState();
    getCustomerTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        automaticallyImplyLeading: false,// Remove the back button icon
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: cardData.isNotEmpty ? cardData.length : 1,
            itemBuilder: (context, index) {
              if (cardData.isEmpty) {
                return const Center(
                  child: Text("No data found"),
                );
              } else {
                // Convert the input datetime string to a DateTime object
                DateTime dateTime = DateTime.parse(cardData[index].transactionDate!);
                // Format the DateTime object using DateFormat from intl package
                String formattedDatetime = DateFormat('yyyy/MM/dd, hh:mm a').format(dateTime);
                //Extract the First Letter for the Avatar
                String avatarText = cardData[index].transactionType?.substring(0, 1) ?? "";
                
                // Format the transactionAmount as UGX currency string
              String formattedAmount = NumberFormat.currency(
                locale: 'en_UG', // Use the appropriate locale for UGX
                symbol: 'UGX ',   // Set the currency symbol to UGX
              ).format(cardData[index].transactionAmount);
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
                                // cardData[index].transactionType?? "Unknown",
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
                                formattedAmount,
                                //cardData[index].transactionAmount.toString(),
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                // cardData[index].transactionDate!,
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
                                  MaterialPageRoute(builder: (context) =>  TransactionsDetailPage(singleCustomerTransactionData: cardData[index])),
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
          if (_loading)
            const Center(
              child: CircularProgressIndicator(), // Show circular progress indicator when loading
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationHandler(
        currentIndex: _currentIndex,
        onTabSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

