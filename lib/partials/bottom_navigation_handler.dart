import 'package:flutter/material.dart';

class BottomNavigationHandler extends StatefulWidget {
  final ValueChanged<int> onTabSelected;
  final List<BottomNavigationBarItem> items;

  const BottomNavigationHandler({
    Key? key,
    required this.onTabSelected,
    required this.items,
  }) : super(key: key);

  @override
  _BottomNavigationHandlerState createState() => _BottomNavigationHandlerState();
}

class _BottomNavigationHandlerState extends State<BottomNavigationHandler> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      // Apply custom theme to the bottom navigation bar
      data: Theme.of(context).copyWith(
        canvasColor: Colors.blue, // Set the background color of the bottom navigation bar
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            widget.onTabSelected(index);
          });
        },
        items: widget.items,
        backgroundColor: Colors.blue, // Set the background color of each item in the bottom navigation bar
      ),
    );
  }
}
