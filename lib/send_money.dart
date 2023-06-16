import 'package:family_clone/blocs/send_money/send_money_bloc.dart';
import 'package:family_clone/eth_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:family_clone/keypad.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({super.key});

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney>
    with SingleTickerProviderStateMixin {
  String amount = "";
  bool decimalEntered = false;
  int maxeth = 1000;
  // late MaxErrorBloc _maxErrorBloc;

  //late AnimationController _animationController;
  // late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // _animationController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 300),
    // );
    // _animation =
    //     Tween<double>(begin: 1.0, end: 0.0).animate(_animationController);
  }

  @override
  void dispose() {
    // _maxErrorBloc.close();
    // _animationController.dispose();
    super.dispose();
  }

  // void updateText(String a) {
  //   // Animate the transition
  //   // _animationController.reset();
  //   // _animationController.forward();

  //   setState(() {
  //     amount = amount + a;
  //   });
  // }

  // void backspace() {
  //   if (amount[amount.length - 1] == ".") {
  //     decimalEntered = false;
  //   }
  //   setState(() {
  //     amount = amount.substring(0, amount.length - 1);
  //   });
  // }

  // void updateDecimal() {
  //   setState(() {
  //     if (decimalEntered == false) {
  //       amount += ".";
  //       decimalEntered = true;
  //     } else {
  //       amount = amount;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
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
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(121, 61, 61, 61),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    "To",
                    style: TextStyle(
                        color: Color.fromARGB(255, 210, 210, 210),
                        fontSize: 15),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  BlocBuilder<SendMoneyBloc, SendMoneyState>(
                    builder: (context, state) {
                      return Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 98, 98, 98),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          state.username,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),

            // Ammount
            BlocBuilder<SendMoneyBloc, SendMoneyState>(
              builder: (context, state) {
                return Container(
                  height: 230,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 80,
                            child: Text(
                              "\$ ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          Text(
                            state.dollarAmount,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      const EthError(),
                    ],
                  ),
                );
              },
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
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/ethereum.png"),
                          fit: BoxFit.fill,
                        ),
                        color: Color.fromARGB(255, 98, 98, 98),
                        shape: BoxShape.circle),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Ethereum",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      Text("0.2419 ETH",
                          style: TextStyle(color: Colors.white, fontSize: 15))
                    ],
                  ),
                  const SizedBox(
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
                      onPressed: () {
                        context
                            .read<SendMoneyBloc>()
                            .add(SendMoneyUseMaxAmountEvent());
                      },
                      child: const Text("Use Max",
                          style: TextStyle(color: Colors.white, fontSize: 15))),
                ],
              ),
            ),

            const SizedBox(
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
                      Keypad(
                        keys: "1",
                        onPressed: () {
                          //updateText("1");
                          context
                              .read<SendMoneyBloc>()
                              .add(SendMoneyKeyPressEvent(keyValue: "1"));
                        },
                      ),
                      Spacer(),
                      Keypad(
                        keys: "2",
                        onPressed: () {
                          // updateText("2");
                          context
                              .read<SendMoneyBloc>()
                              .add(SendMoneyKeyPressEvent(keyValue: "2"));
                        },
                      ),
                      Spacer(),
                      Keypad(
                        keys: "3",
                        onPressed: () {
                          // updateText("3");
                          context
                              .read<SendMoneyBloc>()
                              .add(SendMoneyKeyPressEvent(keyValue: "3"));
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Keypad(
                        keys: "4",
                        onPressed: () {
                          // updateText("4");
                          context
                              .read<SendMoneyBloc>()
                              .add(SendMoneyKeyPressEvent(keyValue: "4"));
                        },
                      ),
                      Spacer(),
                      Keypad(
                        keys: "5",
                        onPressed: () {
                          // updateText("5");
                          context
                              .read<SendMoneyBloc>()
                              .add(SendMoneyKeyPressEvent(keyValue: "5"));
                        },
                      ),
                      Spacer(),
                      Keypad(
                        keys: "6",
                        onPressed: () {
                          // updateText("6");
                          context
                              .read<SendMoneyBloc>()
                              .add(SendMoneyKeyPressEvent(keyValue: "6"));
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Keypad(
                        keys: "7",
                        onPressed: () {
                          // updateText("7");
                          context
                              .read<SendMoneyBloc>()
                              .add(SendMoneyKeyPressEvent(keyValue: "1"));
                        },
                      ),
                      Spacer(),
                      Keypad(
                        keys: "8",
                        onPressed: () {
                          // updateText("8");
                          context
                              .read<SendMoneyBloc>()
                              .add(SendMoneyKeyPressEvent(keyValue: "1"));
                        },
                      ),
                      Spacer(),
                      Keypad(
                        keys: "9",
                        onPressed: () {
                          // updateText("9");
                          context
                              .read<SendMoneyBloc>()
                              .add(SendMoneyKeyPressEvent(keyValue: "1"));
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Keypad(
                        keys: ".",
                        onPressed: () {
                          // updateDecimal();
                          context
                              .read<SendMoneyBloc>()
                              .add(SendMoneyKeyPressEvent(keyValue: "."));
                        },
                      ),
                      Spacer(),
                      Keypad(
                        keys: "0",
                        onPressed: () {
                          // updateText("0");
                          context
                              .read<SendMoneyBloc>()
                              .add(SendMoneyKeyPressEvent(keyValue: "0"));
                        },
                      ),
                      Spacer(),
                      Keypad(
                        keys: "<",
                        onPressed: () {
                          // backspace();
                          context
                              .read<SendMoneyBloc>()
                              .add(SendMoneyKeyPressEvent(keyValue: "<"));
                        },
                      ),
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
              onPressed: () {
                context.read<SendMoneyBloc>().add(SendMoneySubmitEvent());
              },
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
