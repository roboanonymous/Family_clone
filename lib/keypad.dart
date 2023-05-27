import 'package:flutter/material.dart';

class KeyPad extends StatelessWidget {
 KeyPad(this.num, {super.key});
  var num;
  var amount;
  //num = num*10; 

  // String stringnum = num.toString();
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      body: Center(
        child: Column(
          children: [
             Text("Keypad", style: TextStyle(fontSize: 25),),
            Text(num.toString(), style: TextStyle(fontSize: 25),),
             Text("Ammount", style: TextStyle(fontSize: 25),),
              Text(num.toString(), style: TextStyle(fontSize: 25),),
          ],
        ),
      ),
    );
  }
}