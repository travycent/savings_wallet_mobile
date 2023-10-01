//This is the home screen of the application
import 'package:flutter/material.dart';
import 'package:nssf_e_wallet/models/wallet_model.dart';
import 'package:nssf_e_wallet/providers/api_client.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:nssf_e_wallet/partials/bottom_navigation_handler.dart';
import 'package:nssf_e_wallet/screens/banking/withdraw_page.dart';
import 'package:nssf_e_wallet/screens/banking/add_deposit_page.dart';
import 'package:nssf_e_wallet/screens/banking/send_page.dart';
import 'package:nssf_e_wallet/screens/banking/paybill_page.dart';
import 'package:nssf_e_wallet/screens/banking/savings_target_page.dart';
import 'package:nssf_e_wallet/screens/banking/savings_preferences_page.dart';
import 'package:nssf_e_wallet/core/functions.dart';
import 'package:nssf_e_wallet/core/shared_preferences.dart';
//logged email
String loggedEmail = SharedPreferencesManager.getString("email");
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String title = "Home";
  final double gridHeightValue = 60;
  final double gridWidthValue = 150;
  int _currentIndex = 1;
  String? activeWalletBalance = "0";
  String? savingWalletBalance = "0";
  List<CustomerWalletData> customerWalletData =[];
  @override
  void initState() {
    super.initState();
    // Initialize the Customer Wallet balance
    getCustomerWallets();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        automaticallyImplyLeading: false,// Remove the back button icon
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: Column(
              children: [
                Container(
                  height: 60,
                  margin: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(right: BorderSide(color: Colors.black)),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: const Text(
                                'Active Wallet',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                activeWalletBalance!.toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.black)),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: const Text(
                                'Saving Wallet',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                savingWalletBalance!.toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const <Widget>[
                      Text(
                        'Target Amount',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '1,000,000',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    _buildGridItem('Preferences', const SavingsPreferencesPage(), Colors.green),
                    _buildGridItem('Target', const SavingsTargetPage(), Colors.teal),
                    _buildGridItem('Send', const SendPage(), Colors.red),
                    _buildGridItem('Pay Bill', const PayBillPage(), Colors.purple),
                    _buildGridItem('Withdraw', const WithdrawPage(), Colors.blue),
                    _buildGridItem('Deposit', const DepositPage(), Colors.orange),
                  ],
                ),
              ],
            ),
          ),
        ),
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

  Widget _buildGridItem(String title, Widget page, Color color) {
    return Container(
      height: gridHeightValue,
      width: gridWidthValue,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
        color: color,
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        },
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
  // Function used to return wallet balance
  Future<void> getCustomerWallets() async {
  try {
    String data = await fetchData("customer-wallet/$loggedEmail/");
    // print('API Response: $data'); // Print the API response to the console
    CustomerWallet customerWallet = CustomerWallet.fromJson(jsonDecode(data));

    setState(() {
      customerWalletData = customerWallet.data ?? []; // Update the list with parsed data
    });
    if (customerWalletData != null && customerWalletData.isNotEmpty) {
      setState(() {

        activeWalletBalance = NumberFormat.currency(
            locale: 'en_UG', // Use the appropriate locale for UGX
            symbol: 'UGX ',   // Set the currency symbol to UGX
          ).format(customerWalletData[0].activeWalletBalance ?? 0.0);
        savingWalletBalance = NumberFormat.currency(
            locale: 'en_UG', // Use the appropriate locale for UGX
            symbol: 'UGX ',   // Set the currency symbol to UGX
          ).format(customerWalletData[0].savingWalletBalance ?? 0.0);
      });
    }


  } catch (e) {
    // print('Error fetching or parsing data: $e');
    showToast('$e');
  }
  }
}

