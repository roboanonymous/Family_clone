part of 'send_money_bloc.dart';

@immutable
abstract class SendMoneyEvent {}

// Show Max Balance in Amount Field
class MaxBalanceEvent extends SendMoneyEvent {}

//Swapping Currency between dollar and Ethereum
class CurrencySwapEvent extends SendMoneyEvent{}