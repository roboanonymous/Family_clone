import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'send_money_event.dart';
part 'send_money_state.dart';

class SendMoneyBloc extends Bloc<SendMoneyEvent, SendMoneyState> {
  SendMoneyBloc() : super(SendMoneyInitial()) {
    on<SendMoneyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
