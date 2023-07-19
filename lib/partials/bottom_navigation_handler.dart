import 'package:flutter/material.dart';
import 'package:nssf_e_wallet/screens/banking/home_page.dart';
import 'package:nssf_e_wallet/screens/banking/transactions_page.dart';

class BottomNavigationHandler extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;
  

  const BottomNavigationHandler({
    Key? key,
    required this.currentIndex,
    required this.onTabSelected,
    
  }) : super(key: key);

  @override
  _BottomNavigationHandlerState createState() => _BottomNavigationHandlerState();
}

class _BottomNavigationHandlerState extends State<BottomNavigationHandler> {
  //int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      //onTap: widget.onTabSelected,
      onTap: (index) {
        // Invoke the onTabSelected callback to update the current index in the parent widget
        widget.onTabSelected(index);

        // Handle navigation based on the selected index
        switch (index) {
          case 0:
            // Navigate to TransactionsPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TransactionsPage()),
            );
            break;
          case 1:
            // Navigate to Home page)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
            break;
          case 2:
            // Navigate to AccountPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TransactionsPage()),
            );
            break;
          // Add more cases if needed for other items
          default:
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.transfer_within_a_station),
          label: 'Transactions',
          backgroundColor: Colors.orange, // Set the background color for the first item
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.red, // Set the background color for the second item
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Account',
          backgroundColor: Colors.purple, // Set the background color for the third item
        ),
      ],
    );

  }

}
