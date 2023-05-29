import 'package:family_clone/keypad.dart';
import 'package:flutter/material.dart';
import 'package:family_clone/send_money.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KeyPad(726),
    );
  }
}

