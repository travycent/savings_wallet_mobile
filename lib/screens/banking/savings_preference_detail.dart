import 'package:flutter/material.dart';
import 'package:nssf_e_wallet/models/savings_preferences_model.dart';
import 'package:intl/intl.dart';

class SavingsPreferenceDetailPage extends StatelessWidget {
  //Get the detail Data
  final SavingsPreferencesData savingsPreferencesData;
  //Create a constructor that passes the data
  const SavingsPreferenceDetailPage({Key? key, required this.savingsPreferencesData}) : super(key: key);
  final String? title = "Preferences Detail";
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
                //Extract dates
                DateTime startDate = DateTime.parse(savingsPreferencesData.savingsPreferenceStartDate!);
                String formattedStartDate= DateFormat('yyyy/MM/dd').format(startDate);
                DateTime endDate = DateTime.parse(savingsPreferencesData.savingsPreferenceEndDate!);
                String formattedEndDate= DateFormat('yyyy/MM/dd').format(endDate);
                //Extract the type
                String transactionType = savingsPreferencesData.transactionType! ?? "";
                //Extract the percentage
                String percentageValue = savingsPreferencesData.percentageValue!.toString();
                //Extract the frequency
                String frequencyValue = savingsPreferencesData.frequencyValue!.toString();
                //Extract Status
                String activeStatus = "Active";
                return Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  height: 250,
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
                                "Type",
                                //cardData[index].transactionAmount.toString(),
                                style:  TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              SizedBox(height: 15),
                               Text(
                                // cardData[index].transactionDate!,
                                "Frequency",
                                style:  TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              SizedBox(height: 15),
                               Text(
                                // cardData[index].transactionDate!,
                                "Percentage (%)",
                                style:  TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              SizedBox(height: 15),
                               Text(
                                // cardData[index].transactionDate!,
                                "Start Date",
                                style:  TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              SizedBox(height: 15),
                               Text(
                                // cardData[index].transactionDate!,
                                "End Date",
                                style:  TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              SizedBox(height: 15),
                               Text(
                                // cardData[index].transactionDate!,
                                "Status",
                                style:  TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                transactionType,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                frequencyValue,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                percentageValue,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                formattedStartDate,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                formattedEndDate,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                activeStatus,
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