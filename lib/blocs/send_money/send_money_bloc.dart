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
  ) {
    
  }

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
    emit(state.copyWith(ethAmount: state.balance));
  }

  onSendMoneyKeyPressEventHandler(
    SendMoneyKeyPressEvent event,
    Emitter<SendMoneyState> emit,
  ) {
    final keyValue = event.keyValue;
    if (keyValue == '.') {
      if (state.decimalEntered == false) {
        state.copyWith(dollarAmount: state.dollarAmount + keyValue);
        state.copyWith(decimalEntered: true);
      }
    } 
    else if (keyValue == '<') {
      if (state.dollarAmount[state.dollarAmount.length - 1] == ".") {
       
        state.copyWith(decimalEntered: false);
      }
      state.copyWith(dollarAmount: state.dollarAmount.substring(0, state.dollarAmount.length - 1));
    }
    
     else {
      state.copyWith(dollarAmount: state.dollarAmount + keyValue);
    }

    if (int.parse(state.ethAmount) > int.parse(state.balance))
    {
       emit(state.copyWith(maxerror: true));
    }
    else{
      emit(state.copyWith(maxerror: false));
    }
  }

  onSendMoneySubmitEventHandler(
    SendMoneySubmitEvent event,
    Emitter<SendMoneyState> emit,
  ) {

  }
}
