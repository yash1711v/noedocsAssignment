

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'range_event.dart';
part 'range_state.dart';

class RangeBloc extends Bloc<RangeEvent, RangeState> {
  RangeBloc() : super(RangeInitial()) {
    on<RangeEvent>((event, emit) {
      if(event is RangeChange) {
        emit(RangeChangeState(range: event.value));
      }
    });
  }
}
