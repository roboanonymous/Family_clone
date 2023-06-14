import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'send_money_event.dart';
part 'send_money_state.dart';

class SendMoneyBloc extends Bloc<SendMoneyEvent, SendMoneyState> {
  SendMoneyBloc() : super(const SendMoneyState()) {
    on<SendMoneyInitializeEvent>(onSendMoneyInitializeEventHandler);
    on<SendMoneyCurrencySwapEvent>(onSendMoneyCurrencySwapEventHandler);
    on<SendMoneyUseMaxAmountEvent>(onSendMoneyUseMaxAmountEventHandler);
    on<SendMoneyKeyPressEvent>(onSendMoneyKeyPressEventHandler);
    on<SendMoneySubmitEvent>(onSendMoneySubmitEventHandler);
  }

  onSendMoneyInitializeEventHandler(
    SendMoneyInitializeEvent event,
    Emitter<SendMoneyState> emit,
  ) {}

  onSendMoneyCurrencySwapEventHandler(
    SendMoneyCurrencySwapEvent event,
    Emitter<SendMoneyState> emit,
  ) {
    if (state.conversionCurrency == 'eth') {
      emit(state.copyWith(conversionCurrency: 'dollar'));
    } else {
      emit(state.copyWith(conversionCurrency: 'eth'));
    }
  }

  onSendMoneyUseMaxAmountEventHandler(
    SendMoneyUseMaxAmountEvent event,
    Emitter<SendMoneyState> emit,
  ) {
    emit(state.copyWith(dollarAmount: state.balance));
  }

  onSendMoneyKeyPressEventHandler(
    SendMoneyKeyPressEvent event,
    Emitter<SendMoneyState> emit,
  ) {
    final keyValue = event.keyValue;

    if (keyValue == '.') {
    } else if (keyValue == '<') {
    } else {}
  }

  onSendMoneySubmitEventHandler(
    SendMoneySubmitEvent event,
    Emitter<SendMoneyState> emit,
  ) {}
}
