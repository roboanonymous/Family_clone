part of 'send_money_bloc.dart';

class SendMoneyState extends Equatable {
  const SendMoneyState( {
    this.username = 'Barner',
    this.dollarAmount = '',
    this.ethAmount = '0.0',
    this.conversionCurrency = 'dollar',
    this.balance = '0.2419',
    this.decimalEntered = false,
    this.maxerror = false,
  });

  final String username;
  final String dollarAmount;
  final String ethAmount;
  final String conversionCurrency;
  final String balance;
  final bool decimalEntered;
  final bool maxerror;

  SendMoneyState copyWith({
    String? username,
    String? dollarAmount,
    String? ethAmount,
    String? conversionCurrency,
    String? balance,
    bool? decimalEntered,
    bool? maxerror,
  }) {
    return SendMoneyState(
      username: username ?? this.username,
      dollarAmount: dollarAmount ?? this.dollarAmount,
      ethAmount: ethAmount ?? this.ethAmount,
      conversionCurrency: conversionCurrency ?? this.conversionCurrency,
      balance: balance ?? this.balance,
      decimalEntered: decimalEntered ?? this.decimalEntered,
      maxerror: maxerror ?? this.maxerror,
    );
  }

  @override
  List<Object> get props => [
        username,
        dollarAmount,
        ethAmount,
        conversionCurrency,
        balance,
        maxerror,
      ];
}
