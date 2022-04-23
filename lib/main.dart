import 'package:flutter/material.dart';
import 'package:myapp/widgets/my_scaffold.dart';

void main() {
  runApp(MaterialApp(
    home: SafeArea(
      child: MyScaffold(),
    ),
  ));
}