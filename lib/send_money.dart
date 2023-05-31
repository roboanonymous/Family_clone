import 'dart:math';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({super.key});

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> with TickerProviderStateMixin{

    String amount = "0";
  int num = 0;
  bool decimalEntered = false;
    int decimalPlaces = 0;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  void updateText(int a) {
      num = num * 10 + a;
    String newAmount = num.toString();

      // Animate the transition
    _animationController.reset();
    _animationController.forward();
    
    setState(() {
      amount = newAmount;
    });
  }

  void backspace() {
     
    num = (num ~/ 10);
    String backAmount = num.toString();
    setState(() {
      amount = backAmount;
    });
  
  }

  void updateDecimal() {
    if (!decimalEntered) {
      decimalEntered = true;
      setState(() {
        amount += ".";
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Send",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.close),
                  iconSize: 30,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(121, 61, 61, 61),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "To",
                    style: TextStyle(
                        color: Color.fromARGB(255, 210, 210, 210),
                        fontSize: 15),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 98, 98, 98),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Burner",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),

            // Ammount
            Container(
              height: 230,
              width: double.infinity,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 80,
                        child: Text(
                          "\$ ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Text(
                          amount,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.w900),
                        ),

            
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CryptoFontIcons.ETH, color: Colors.white),
                      SizedBox(
                        width: 5,
                      ),
                      Text("0.00",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.swap_vert,
                        color: Colors.white,
                      )
                    ],
                  )
                ],
              ),
            ),
            // Ethereum Max Value
            Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(121, 61, 61, 61),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage("assets/images/ethereum.png"),
                          fit: BoxFit.fill,
                        ),
                        color: Color.fromARGB(255, 98, 98, 98),
                        shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Ethereum",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      Text("0.2419 ETH",
                          style: TextStyle(color: Colors.white, fontSize: 15))
                    ],
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 98, 98, 98),
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 2.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      onPressed: () {},
                      child: Text("Use Max",
                          style: TextStyle(color: Colors.white, fontSize: 15))),
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),
          //  Number Keyboard
            Container(
              height: 250,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: TextButton(
                            onPressed: () => updateText(1),
                            child: Text("1",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30))),
                      ),
                      Spacer(),
                      Container(
                        child: TextButton(
                              onPressed: () => updateText(2),
                            child: Text("2",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30))),
                      ),
                      Spacer(),
                      Container(
                        child: TextButton(
                             onPressed: () => updateText(3),

                            child: Text("3",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30))),
                      )
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: TextButton(
                             onPressed: () => updateText(4),
                            child: Text("4",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30))),
                      ),
                      Spacer(),
                      Container(
                        child: TextButton(
                          onPressed: () => updateText(5),
                            child: Text("5",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30))),
                      ),
                      Spacer(),
                      Container(
                        child: TextButton(
                              onPressed: () => updateText(6),
                            child: Text("6",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30))),
                      )
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: TextButton(
                          onPressed: () => updateText(7),
                            child: Text("7",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30))),
                      ),
                      Spacer(),
                      Container(
                        child: TextButton(
                          onPressed: () => updateText(8),
                            child: Text("8",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30))),
                      ),
                      Spacer(),
                      Container(
                        child: TextButton(
                          onPressed: () => updateText(9),
                            child: Text("9",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30))),
                      )
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: TextButton(
                            onPressed: updateDecimal,
                            child: Text(".",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30))),
                      ),
                      Spacer(),
                      Container(
                        child: TextButton(
                          onPressed: () => updateText(0),
                            child: Text("0",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30))),
                      ),
                      Spacer(),
                      Container(
                        child: TextButton(
                            onPressed: backspace,
                            child: Text("<",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30))),
                      )
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),
            // Submit Button
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Continue",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding:
                    EdgeInsets.symmetric(horizontal: 120.0, vertical: 10.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
