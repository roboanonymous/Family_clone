import 'package:flutter/material.dart';

class Keypad extends StatefulWidget {


  const Keypad({super.key, required this.keys});
  final String keys;

  @override
  State<Keypad> createState() => _KeypadState();
}

class _KeypadState extends State<Keypad> {
   String amountnew = "";


   void updateText(String a) {

    
    setState(() {
      amountnew = amountnew + a;
      print(amountnew);
    });
  }


  @override
  Widget build(BuildContext context) {
    
    return  Container(
                        child: TextButton(
                            onPressed: () => updateText(widget.keys),
                            child: Text(widget.keys,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30))),
                      );
  }
}