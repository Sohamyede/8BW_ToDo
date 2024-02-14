// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:to_do_app/Pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Color(0xFF2c3e50)), // Text Color (Dark Gray)
        ),
      ),
    );
  }
}
