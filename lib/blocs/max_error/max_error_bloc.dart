import 'package:family_clone/blocs/max_error/max_error_event.dart';
import 'package:family_clone/blocs/max_error/max_error_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaxErrorBloc extends Bloc<MaxErrorEvent, MaxErroringState> {
  MaxErrorBloc() : super(MaxErrorState()) {
    on<MaxErrorEvent>((event, emit) => emit(MaxErrorState()));

  //   @override
  // Stream<MaxError> mapEventToState(MaxErrorEvent event) async* {
  //   if (event.givenAmount > event.maxAmount) {
  //     yield MaxErrorState();
  //   } else {
  //     yield MaxErrorInitialState();
  //   }

    //  if(event.givenAmount > event.maxAmount)
    //   {
    //     add(MaxEvent(givenAmount, maxAmoun));
    //   }
    //   else{
    //     add(LessEvent(givenAmount, maxAmount));
    //   }
 // }

   

  
  }

  
}
