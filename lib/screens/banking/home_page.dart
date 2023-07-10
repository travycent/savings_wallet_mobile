//This is the home screen of the application
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String? title="Home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!)
      ),
      body: Center(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              children: [
                Text('Active Wallet'),
                Text('Savings Wallet'),
              ],
            ),
            
          ),
        ),
      ),
    );
  }
}