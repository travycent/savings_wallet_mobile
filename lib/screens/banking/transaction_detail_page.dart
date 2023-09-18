import 'package:flutter/material.dart';
import 'package:nssf_e_wallet/models/transactions_model.dart';
import 'package:intl/intl.dart';

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
      body : Stack(
        children: [
          ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index){
                // Convert the input datetime string to a DateTime object
                DateTime dateTime = DateTime.parse(singleCustomerTransactionData.transactionDate!);
                // Format the DateTime object using DateFormat from intl package
                String formattedDatetime = DateFormat('yyyy/MM/dd, hh:mm a').format(dateTime);
                //Extract the First Letter for the Avatar
                String avatarText = singleCustomerTransactionData.transactionType?.substring(0, 1) ?? "";
                // Format the transactionAmount as UGX currency string
                String formattedAmount = NumberFormat.currency(
                  locale: 'en_UG', // Use the appropriate locale for UGX
                  symbol: '',   // Set the currency symbol to UGX
                ).format(singleCustomerTransactionData.transactionAmount);
                String currencySymbol = 'UGX';
                return Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  height: 150,
                  width: double.maxFinite,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
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
                          //  Expanded(
                          //   child: Align(
                          //     alignment: Alignment.centerRight, // Align the Text to center-right
                          //     child: Text(
                          //       currencySymbol,
                          //       style: const TextStyle(fontSize: 18),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                );
                
            },
          ),
        ],
      ),
      // body: const Padding(
      //   padding:  EdgeInsets.all(16),
        
      //   child: Text(singleCustomerTransactionData.transactionDate!),
      // ),
    );
  }
}