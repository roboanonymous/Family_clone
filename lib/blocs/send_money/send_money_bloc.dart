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
    emit(state.copyWith(ethAmount: state.balance));
    emit(state.copyWith(
        dollarAmount: (double.parse(state.ethAmount) * 1666).toString()));
  }

  onSendMoneyKeyPressEventHandler(
    SendMoneyKeyPressEvent event,
    Emitter<SendMoneyState> emit,
  ) {

    final keyValue = event.keyValue;

    if (keyValue == '.') {
      if (state.decimalEntered == false) {
        emit(state.copyWith(dollarAmount: state.dollarAmount + keyValue));
        emit(state.copyWith(
            ethAmount:
                (double.parse(state.dollarAmount) * 0.00060).toString()));
        emit(state.copyWith(decimalEntered: true));
      }
    } else if (keyValue == '<') {
      if (state.dollarAmount[state.dollarAmount.length - 1] == ".") {
        emit(state.copyWith(decimalEntered: false));
      }
      emit(state.copyWith(
          dollarAmount:
              state.dollarAmount.substring(0, state.dollarAmount.length - 1)));
      emit(state.copyWith(
          ethAmount: (double.parse(state.dollarAmount) * 0.00060).toString()));
    } else {
      emit(state.copyWith(dollarAmount: state.dollarAmount + keyValue));
      emit(state.copyWith(
          ethAmount: (double.parse(state.dollarAmount) * 0.00060).toString()));
    }

    if (double.parse(state.ethAmount) > double.parse(state.balance)) {
      emit(state.copyWith(maxerror: true));
      emit(state.copyWith(buttondisabled: true));
    } else {
      emit(state.copyWith(maxerror: false));
      emit(state.copyWith(buttondisabled: false));
    }

    if (int.parse(state.dollarAmount) == 0) {
      emit(state.copyWith(buttondisabled: true));
    }
    
    String initialamount = state.dollarAmount.substring(0, state.dollarAmount.length - 1) ;
    String animatedamount = state.dollarAmount.substring(state.dollarAmount.length - 1) ;


    if(state.dollarAmount.length == 0)
    {
      emit(state.copyWith(dollarAmountInitial: ""));
      emit(state.copyWith(dollarAmountAnimated: state.dollarAmount));
    }
    else if(state.dollarAmount.length == 1){

      emit(state.copyWith(dollarAmountInitial: ""));
      emit(state.copyWith(dollarAmountAnimated: state.dollarAmount));

    }
    else{
       emit(state.copyWith(dollarAmountInitial: initialamount));
       emit(state.copyWith(dollarAmountAnimated: animatedamount));
    }
    
  }

  onSendMoneySubmitEventHandler(
    SendMoneySubmitEvent event,
    Emitter<SendMoneyState> emit,
  ) {}
}
