import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'send_money_event.dart';
part 'send_money_state.dart';

class SendMoneyBloc extends Bloc<SendMoneyEvent, SendMoneyState> {
  SendMoneyBloc() : super(SendMoneyState("a","b","c","d","e")) {
    on<SendMoneyEvent>((event, emit) {
      // TODO: implement event handler

      
    });
  }
}
