part of 'send_money_bloc.dart';

@immutable
 class SendMoneyState {
  final String username;
  final String dollarAmount;
  final String EthAmount;
  final String conversionCurreny;
  final String balance;

  SendMoneyState(this.username, this.dollarAmount, this.EthAmount, this.conversionCurreny, this.balance);
}

