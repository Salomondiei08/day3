import 'package:day3/ui_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData( fontFamily: 'Roboto'),
      debugShowCheckedModeBanner: false,
      home: const UIApp(),
    );
  }
}
