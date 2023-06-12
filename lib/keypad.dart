import 'package:flutter/material.dart';

class Keypad extends StatelessWidget {
  Keypad({Key? key, required this.keys, required this.onPressed});
  final String keys;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: Text(keys, style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );
  }
}
