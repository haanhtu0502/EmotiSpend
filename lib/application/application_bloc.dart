import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:emoti_spend/application/application_modal_state.dart';
import 'package:flutter/material.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc()
    : super(
        InitApplicationState(
          data: ApplicationModalState(key: GlobalKey<NavigatorState>()),
        ),
      ) {
    on<InitApplicationEvent>(_onInit);
    add(InitApplicationEvent());
  }

  ApplicationModalState get _data => state.data;

  FutureOr<void> _onInit(
    InitApplicationEvent event,
    Emitter<ApplicationState> emit,
  ) async {
    emit(InitApplicationState(data: _data));
  }
}
