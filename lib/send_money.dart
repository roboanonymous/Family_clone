import 'dart:math';

import 'package:family_clone/blocs/send_money/send_money_bloc.dart';
import 'package:family_clone/eth_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:family_clone/keypad.dart';
import 'package:flutter/animation.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({super.key});

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney>
    with SingleTickerProviderStateMixin {
  // late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 500),
    //   );
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

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
                print("Total" + state.dollarAmount);
                print("Initial" + state.dollarAmountInitial);
                print("Animated" + state.dollarAmountAnimated);
                return Container(
                  height: 230,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.conversionCurrency == "dollar"
                                ? "\$ " + state.dollarAmountInitial
                                : state.dollarAmount,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            transitionBuilder: (child, animation) {
                              return SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0.0, 0.5),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: child,
                              );
                             
                            },
                            child: Text(
                              state.dollarAmountAnimated,
                              key: ValueKey<String>(state.dollarAmountAnimated),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),

                          // AnimatedTextKit(
                          //   animatedTexts: [
                          //     FlickerAnimatedText(
                          //       state.conversionCurrency == "dollar"
                          //           ? state.dollarAmountAnimated
                          //           : "",
                          //       textStyle: const TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 50,
                          //         fontWeight: FontWeight.w900,
                          //       ),
                          //       speed: const Duration(milliseconds: 200),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                      state.maxerror ? MaximumError() : EthError(),
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
            BlocBuilder<SendMoneyBloc, SendMoneyState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: state.buttondisabled
                      ? () {}
                      : () {
                          context
                              .read<SendMoneyBloc>()
                              .add(SendMoneySubmitEvent());
                        },
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        state.buttondisabled ? Colors.grey : Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 120.0, vertical: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
