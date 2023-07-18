import 'package:flutter/material.dart';
class SavingsPreferencesPage extends StatefulWidget {
  const SavingsPreferencesPage({ Key? key }) : super(key: key);

  @override
  State<SavingsPreferencesPage> createState() => _SavingsPreferencesPageState();
}
class _SavingsPreferencesPageState extends State<SavingsPreferencesPage> {
  final String? title = "Saving Preferences";

  // Sample data for dynamic text
  List<Map<String, String>> cardData = [
        {
      "avatarText": "A",
      "title": "Frequency 1",
      "date": "Transaction Date 1",
    },
    {
      "avatarText": "B",
      "title": "Frequency 2",
      "date": "Transaction Date 2",
    },
    {
      "avatarText": "C",
      "title": "Transaction Title 3",
      "date": "Transaction Date 3",
    },
    {
      "avatarText": "C",
      "title": "Transaction Title 4",
      "date": "Transaction Date 4",
    },
    {
      "avatarText": "C",
      "title": "Transaction Title 4",
      "date": "Transaction Date 4",
    },
    {
      "avatarText": "C",
      "title": "Transaction Title 4",
      "date": "Transaction Date 4",
    },
    {
      "avatarText": "C",
      "title": "Transaction Title 4",
      "date": "Transaction Date 4",
    },
    {
      "avatarText": "C",
      "title": "Transaction Title 4",
      "date": "Transaction Date 4",
    },
    {
      "avatarText": "C",
      "title": "Transaction Title 4",
      "date": "Transaction Date 4",
    },
    {
      "avatarText": "C",
      "title": "Transaction Title 4",
      "date": "Transaction Date 4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: ListView.builder(
        itemCount: cardData.isNotEmpty ? cardData.length : 1,
        itemBuilder: (context, index) {
          if (cardData.isEmpty) {
            return const Center(
              child: Text("No data found"),
            );
          } else {
            return Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              height: 100,
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.amber,
                          child: Text(
                            cardData[index]["avatarText"]!,
                            style: const TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            cardData[index]["title"]!,
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            cardData[index]["date"]!,
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Handle the click on the chevron icon
                            print("Chevron Icon Clicked for Card $index");
                          },
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.chevron_right,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

