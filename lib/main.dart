import 'package:flutter/material.dart';
import 'package:family_clone/send_money.dart';
import 'package:family_clone/blocs/max_error/max_error_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MaxErrorBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SendMoney(),
      ),
    );
  }
}
