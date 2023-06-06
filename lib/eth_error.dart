import 'package:flutter/material.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';

class EthError extends StatelessWidget {
  const EthError({super.key});

  @override
  Widget build(BuildContext context) {
    return   const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CryptoFontIcons.ETH, color: Colors.white),
                      SizedBox(width: 5),
                      Text(
                        "0.00",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.swap_vert, color: Colors.white),
                    ],
                  );
  }

}

class MaximumError extends StatelessWidget {
  const MaximumError({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Not Enough ETH", style: TextStyle(color: Colors.red, fontSize: 15),);
  }

}