import 'package:flutter/material.dart';
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.all(16.0),
            child: CircleAvatar(
              radius: 60,
              //backgroundImage: AssetImage('assets/profile_image.jpg'),
            ),
          ),
          SizedBox(height: 16.0), // Add some space between profile image and buttons
          buildListTile(Icons.account_circle, 'Account Details', () {
            // Navigate to account details page or perform an action
          }),
          buildListTile(Icons.exit_to_app, 'Logout', () {
            // Perform logout action
          }),
        ],
      ),
    );
  }

Widget buildListTile(IconData icon, String text, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
    child: Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(fontSize: 25.0),
          ),
          SizedBox(width: 20.0), // Add space between text and icon
          Icon(icon),
        ],
      ),
    ),
  );
}


}
