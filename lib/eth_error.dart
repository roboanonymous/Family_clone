import 'package:family_clone/blocs/send_money/send_money_bloc.dart';
import 'package:flutter/material.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EthError extends StatelessWidget {
  const EthError({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(CryptoFontIcons.ETH, color: Colors.white),
        SizedBox(width: 5),
        Text(
          // if(state.conversionCurrency == "dollar")
          // {
          // state.ethAmount,
          // }
          // else{
          //    state.dollarAmount,
          // },
          '',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        SizedBox(width: 5),
        IconButton(
            onPressed: () {
              context.read<SendMoneyBloc>().add(SendMoneyCurrencySwapEvent());
            },
            icon: Icon(
              Icons.swap_vert,
              color: Colors.white,
            ))
      ],
    );
  }
}

class MaximumError extends StatelessWidget {
  const MaximumError({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Not Enough ETH",
      style: TextStyle(color: Colors.red, fontSize: 15),
    );
  }
}
