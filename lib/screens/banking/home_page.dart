//This is the home screen of the application
import 'package:flutter/material.dart';
import 'package:nssf_e_wallet/partials/bottom_navigation_handler.dart';
import 'package:nssf_e_wallet/screens/banking/withdraw_page.dart';
import 'package:nssf_e_wallet/screens/banking/add_deposit_page.dart';
import 'package:nssf_e_wallet/screens/banking/send_page.dart';
import 'package:nssf_e_wallet/screens/banking/paybill_page.dart';
import 'package:nssf_e_wallet/screens/banking/savings_target_page.dart';
import 'package:nssf_e_wallet/screens/banking/transactions_page.dart';
import 'package:nssf_e_wallet/screens/banking/add_savings_preferences_page.dart';
import 'package:nssf_e_wallet/screens/banking/savings_preferences_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final String? title = "Home";
  final double gridHeightValue=60;
  final double gridWidthValue=150;
  double? activeWalletBalance = 1000000;
  double? savingWalletBalance = 1000000;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body:SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: Column(
              children: [
                Container(
                  height: 60,
                  margin: const EdgeInsets.all(2.0),
                  decoration:  BoxDecoration(
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
                              child: const Text(
                                'Active Wallet',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child:  Text(
                                activeWalletBalance!.toString(),
                                style: const TextStyle(fontSize: 12),
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
                              child: const Text(
                                'Saving Wallet',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child:  Text(
                                savingWalletBalance!.toString(),
                                style: const TextStyle(fontSize: 12),
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
                        'Target Balance',
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
                    _buildGridItem('Deposit', const DepositPage()),
                    _buildGridItem('Send', const SendPage()),
                    _buildGridItem('Pay Bill', const PayBillPage()),
                    _buildGridItem('Withdraw', const WithdrawPage()),
                    _buildGridItem('Preferences', const SavingsPreferencesPage()),
                    _buildGridItem('Target', const SavingsTargetPage()),
                    
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationHandler(
        onTabSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.screen_share),
            label: 'Screen 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Screen 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Screen 4',
          ),
        ],
        
      ),
    );
  }
  Widget _buildGridItem(String title, Widget page) {
    return Container(
      height: gridHeightValue,
      width: gridWidthValue,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        },
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

