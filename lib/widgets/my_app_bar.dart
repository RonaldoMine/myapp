import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final Widget title;

  const MyAppBar({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      decoration: BoxDecoration(color: Colors.blue[900]),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.menu),
            tooltip: "Navigation menu",
          ),
          Expanded(child: title),
          const IconButton(
              onPressed: null, icon: Icon(Icons.search), tooltip: 'Find')
        ],
      ),
    );
  }
}
