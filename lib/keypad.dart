import 'package:flutter/material.dart';

class KeyPad extends StatefulWidget {
  KeyPad(this.num, {super.key});
  var num;

  @override
  State<KeyPad> createState() => _KeyPadState();
}

class _KeyPadState extends State<KeyPad> {
  var amount;

  //num = num*10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              "Keypad",
              style: TextStyle(fontSize: 25),
            ),
            Text(
              widget.num.toString(),
              style: TextStyle(fontSize: 25),
            ),
            Text(
              "Ammount",
              style: TextStyle(fontSize: 25),
            ),
            Text(
              widget.num.toString(),
              style: TextStyle(fontSize: 25),
            ),
            const TextField(
            //  obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                // controller: _controller,
              ),
             

              style: TextStyle(fontSize: 24),
            ),
            
          ],
        ),
      ),
    );
  }
  
}
