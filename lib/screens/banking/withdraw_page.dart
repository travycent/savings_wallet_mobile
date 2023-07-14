import 'package:flutter/material.dart';
class WithdrawPage extends StatefulWidget {
  const WithdrawPage({ Key? key }) : super(key: key);

  @override
  State<WithdrawPage> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  final String? title="Withdaw";
  final TextEditingController _amountTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _amountTextFieldController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Enter Amount",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2.0),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: const Text("Withdraw"),
              style: ElevatedButton.styleFrom(
                // Use percentages to set the minimum size
                minimumSize:const Size(100.0, 10.0) / 100.0 * MediaQuery.of(context).size.width,
              ),
              onPressed: (){
              // Todo
              },
            ),
          ),
        ],
      ),

    );
  }
}