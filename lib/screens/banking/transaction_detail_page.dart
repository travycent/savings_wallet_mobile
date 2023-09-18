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
                //Extract the type
                String transactionType = singleCustomerTransactionData.transactionType!;
                //Extract the Payee
                String payee = singleCustomerTransactionData.payee ?? '';
                //(payee ? payee : "-");
                //Extract the First Letter for the Avatar
                String avatarText = singleCustomerTransactionData.transactionType?.substring(0, 1) ?? "";
                // Format the transactionAmount as UGX currency string
                String formattedAmount = NumberFormat.currency(
                  locale: 'en_UG', // Use the appropriate locale for UGX
                  symbol: 'UGX ',   // Set the currency symbol to UGX
                ).format(singleCustomerTransactionData.transactionAmount);
                // String currencySymbol = 'UGX';
                return Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  height: 170,
                  width: double.maxFinite,
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                               Text(
                                "Amount",
                                //cardData[index].transactionAmount.toString(),
                                style:  TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              SizedBox(height: 15),
                               Text(
                                // cardData[index].transactionDate!,
                                "Type",
                                style:  TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              SizedBox(height: 15),
                               Text(
                                // cardData[index].transactionDate!,
                                "Payee",
                                style:  TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              SizedBox(height: 15),
                               Text(
                                // cardData[index].transactionDate!,
                                "Date",
                                style:  TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                formattedAmount,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                transactionType,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                payee,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                formattedDatetime,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
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