import 'package:flutter/material.dart';
import 'package:nssf_e_wallet/providers/api_client.dart';
import 'package:nssf_e_wallet/models/transactions_model.dart';
import 'package:nssf_e_wallet/partials/bottom_navigation_handler.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class TransactionsPage extends StatefulWidget {
  const TransactionsPage({ Key? key }) : super(key: key);

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}
class _TransactionsPageState extends State<TransactionsPage> {
  final String? title = "Transactions";
  int _currentIndex = 0;
  List<SingleCustomerTransactionData> cardData =[];
   Future<void> getCustomerTransactions() async {
    try {
      String data = await fetchData("customer-transactions/centtravy@gmail.com/");
      print('API Response: $data'); // Print the API response to the console
      CustomerTransactions customerTransactions = CustomerTransactions.fromJson(jsonDecode(data));
      print('Parsed CustomerTransactions: $customerTransactions'); // Print the parsed object

      setState(() {
        cardData = customerTransactions.data ?? []; // Update the list with parsed data
      });
      // // print(customerTransactionsData);
      // print('Printing customerTransactionsData:');
      // for (SingleCustomerTransactionData transaction in customerTransactionsData) {
      //   print('Transaction ID: ${transaction.transactionId}');
      //   print('Transaction Amount: ${transaction.transactionAmount}');
      //   print('User Email: ${transaction.userEmail}');
      //   // Print other properties as needed
      // }
    } catch (e) {
      print('Error fetching or parsing data: $e');
    }
  }
  @override
  void initState() {
    super.initState();
    getCustomerTransactions();
  }

  // Sample data for dynamic text
  // List<Map<String, String>> cardData = [
  //       {
  //     "avatarText": "A",
  //     "title": "Transaction Title 1",
  //     "date": "Transaction Date 1",
  //   },
  //   {
  //     "avatarText": "B",
  //     "title": "Transaction Title 2",
  //     "date": "Transaction Date 2",
  //   },
  //   {
  //     "avatarText": "C",
  //     "title": "Transaction Title 3",
  //     "date": "Transaction Date 3",
  //   },
  //   {
  //     "avatarText": "C",
  //     "title": "Transaction Title 4",
  //     "date": "Transaction Date 4",
  //   },

  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: ListView.builder(
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
            symbol: 'UGX',   // Set the currency symbol to UGX
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
                            // Handle the click on the chevron icon
                            print("Chevron Icon Clicked for Card $index");
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

