part of 'send_money_bloc.dart';

abstract class SendMoneyEvent extends Equatable {
  const SendMoneyEvent();

  @override
  List<Object> get props => [];
}

class SendMoneyInitializeEvent extends SendMoneyEvent {
  const SendMoneyInitializeEvent();
}

//Swapping Currency between dollar and Ethereum
class SendMoneyCurrencySwapEvent extends SendMoneyEvent {
  const SendMoneyCurrencySwapEvent();
}

class SendMoneyUseMaxAmountEvent extends SendMoneyEvent {
  const SendMoneyUseMaxAmountEvent();
}

class SendMoneyKeyPressEvent extends SendMoneyEvent {
  const SendMoneyKeyPressEvent({
    required this.keyValue,
  });

  final String keyValue;

  @override
  List<Object> get props => [keyValue];
}

class SendMoneySubmitEvent extends SendMoneyEvent {
  const SendMoneySubmitEvent();
}
