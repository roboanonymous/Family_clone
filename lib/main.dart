import 'package:family_clone/blocs/send_money/send_money_bloc.dart';
import 'package:flutter/material.dart';
import 'package:family_clone/send_money.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendMoneyBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SendMoney(),
      ),
    );
  }
}
