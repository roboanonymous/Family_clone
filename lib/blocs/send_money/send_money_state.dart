part of 'send_money_bloc.dart';

class SendMoneyState extends Equatable {
  const SendMoneyState({
    this.username = '',
    this.dollarAmount = '',
    this.ethAmount = '',
    this.conversionCurrency = '',
    this.balance = '',
  });

  final String username;
  final String dollarAmount;
  final String ethAmount;
  final String conversionCurrency;
  final String balance;

  SendMoneyState copyWith({
    String? username,
    String? dollarAmount,
    String? ethAmount,
    String? conversionCurrency,
    String? balance,
  }) {
    return SendMoneyState(
      username: username ?? this.username,
      dollarAmount: dollarAmount ?? this.dollarAmount,
      ethAmount: ethAmount ?? this.ethAmount,
      conversionCurrency: conversionCurrency ?? this.conversionCurrency,
      balance: balance ?? this.balance,
    );
  }

  @override
  List<Object> get props => [
        username,
        dollarAmount,
        ethAmount,
        conversionCurrency,
        balance,
      ];
}
