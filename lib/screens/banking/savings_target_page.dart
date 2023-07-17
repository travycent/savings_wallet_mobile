import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class SavingsTargetPage extends StatefulWidget {
  const SavingsTargetPage({ Key? key }) : super(key: key);

  @override
  State<SavingsTargetPage> createState() => _SavingsTargetPageState();
}

class _SavingsTargetPageState extends State<SavingsTargetPage> {
  final String? title="Set Target";
  final TextEditingController _amountTextFieldController = TextEditingController();
  final TextEditingController _startDateTextFieldController = TextEditingController();
  final TextEditingController _endDateTextFieldController = TextEditingController();
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
                        icon: Icon(Icons.money),
                        hintText: "Enter Target Amount",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 7.0),
                    TextField(
                      controller: _startDateTextFieldController,
                      
                      decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        hintText: "Start Date",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      readOnly: true,
                      onTap: () async{
                        //implement the show date picker
                        DateTime? _selectedDate = await showDatePicker(context: context, 
                          initialDate: DateTime.now(), 
                          firstDate: DateTime.now(), 
                          lastDate: DateTime(2101)
                        );
                        if(_selectedDate !=null)
                        {
                          String _formattedDate = DateFormat("yyyy-MM-dd").format(_selectedDate);

                          setState(() {
                            _startDateTextFieldController.text=_formattedDate.toString();
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 7.0),
                    TextField(
                      controller: _endDateTextFieldController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        hintText: "End Date",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      readOnly: true,
                      onTap: () async{
                        //implement the show date picker
                        DateTime? _selectedDate = await showDatePicker(context: context, 
                          initialDate: DateTime.now(), 
                          firstDate: DateTime.now(), 
                          lastDate: DateTime(2101)
                        );
                        if(_selectedDate !=null)
                        {
                          String _formattedDate = DateFormat("yyyy-MM-dd").format(_selectedDate);

                          setState(() {
                            _endDateTextFieldController.text=_formattedDate.toString();
                          });
                        }
                      },
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
              child: const Text("Save"),
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
