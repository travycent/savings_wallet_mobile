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
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final String? title = "Home";
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Center(
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
                        children:  <Widget>[
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text('Active Wallet'),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text('Investment Wallet'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      ),
                      child: Column(
                        children:  <Widget>[
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text('Active Wallet'),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text('Investment Wallet'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  <Widget>[
                    Container(
                      // decoration: const BoxDecoration(
                      //   border: Border(right: BorderSide(color: Colors.black)),
                      // ),
                      child: const Text('Target Balance'),
                    ),
                    Container(
                      
                      child: const Text('1,000,000'),
                    ),
                    
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 150,
                    margin: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Center(
                        child:TextButton(
                          child: const Text(
                              'Deposit',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize:12.0,
                              ),
                            ),
                          onPressed: (){
                            //Move to the withdraw screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder:(context) => const DepositPage()),
                            );
                          },
                        ),
                        
                      ),
                  ),
                  Container(
                    height: 100,
                    width: 150,
                    margin: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Center(
                        child:TextButton(
                          child: const Text(
                              'Send',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize:12.0,
                              ),
                            ),
                          onPressed: (){
                            //Move to the withdraw screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder:(context) => const SendPage()),
                            );
                          },
                        ),
                        
                      ),
                  ),
                  Container(
                    height: 100,
                    width: 150,
                    margin: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Center(
                        child:TextButton(
                          child: const Text(
                              'Pay Bill',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize:12.0,
                              ),
                            ),
                          onPressed: (){
                            //Move to the withdraw screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder:(context) => const AddSavingsPreferencePage()),
                            );
                          },
                        ),
                        
                      ),
                  ),
                  Container(
                    height: 100,
                    width: 150,
                    margin: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Center(
                        child:TextButton(
                          child: const Text(
                              'Withdraw',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize:12.0,
                              ),
                            ),
                          onPressed: (){
                            //Move to the withdraw screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder:(context) => const WithdrawPage()),
                            );
                          },
                        ),
                        
                      ),
                  ),
                ],
              ),
            ],
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
}
// class _HomePageState extends State<HomePage> {
//   final String? title="Home";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title!)
//       ),
//       body: Center(
//           child: Padding(
//             padding:  const EdgeInsets.only(top:16.0, bottom : 16.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: const<Widget>[
//                       Text('Active Wallet'),
//                       Text('Savings Wallet'),

//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: const<Widget>[
//                       Text('Investment Wallet'),
//                       Text('Emergency Fund'),
//                     ],
//                   ),
//                 ],   
//               ),
//             ),

            
//           ),
        
//       ),
//     );
//   }
// }

