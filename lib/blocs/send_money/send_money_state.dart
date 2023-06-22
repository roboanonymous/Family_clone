part of 'send_money_bloc.dart';

class SendMoneyState extends Equatable {
  const SendMoneyState({
    this.username = 'Barner',
    this.dollarAmount = '',
    this.dollarAmountInitial = '',
    this.dollarAmountAnimated = '',
    this.ethAmount = '0.0',
    this.conversionCurrency = 'dollar',
    this.balance = '0.2419',
    this.decimalEntered = false,
    this.maxerror = false,
    this.buttondisabled =true,
  });

  final String username;
  final String dollarAmount;
  final String dollarAmountInitial;
  final String dollarAmountAnimated;
  final String ethAmount;
  final String conversionCurrency;
  final String balance;
  final bool decimalEntered;
  final bool maxerror;
  final bool buttondisabled;

  SendMoneyState copyWith({
    String? username,
    String? dollarAmount,
    String? dollarAmountInitial,
    String? dollarAmountAnimated,
    String? ethAmount,
    String? conversionCurrency,
    String? balance,
    bool? decimalEntered,
    bool? maxerror,
    bool? buttondisabled,
  }) {
    return SendMoneyState(
      username: username ?? this.username,
      dollarAmount: dollarAmount ?? this.dollarAmount,
      dollarAmountInitial: dollarAmountInitial ?? this.dollarAmountInitial,
      dollarAmountAnimated: dollarAmountAnimated ?? this.dollarAmountAnimated,
      ethAmount: ethAmount ?? this.ethAmount,
      conversionCurrency: conversionCurrency ?? this.conversionCurrency,
      balance: balance ?? this.balance,
      decimalEntered: decimalEntered ?? this.decimalEntered,
      maxerror: maxerror ?? this.maxerror,
      buttondisabled: buttondisabled ?? this.buttondisabled,
    );
  }

  @override
  List<Object> get props => [
        username,
        dollarAmount,
        dollarAmountInitial,
        dollarAmountAnimated,
        ethAmount,
        conversionCurrency,
        balance,
        maxerror,
        buttondisabled,
      ];
}
