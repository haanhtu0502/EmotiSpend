part of "application_bloc.dart";

sealed class ApplicationState {
  final ApplicationModalState data;

  const ApplicationState({required this.data});
}

class InitApplicationState extends ApplicationState {
  const InitApplicationState({required super.data});
}

class InitApplicationStateSuccess extends ApplicationState {
  const InitApplicationStateSuccess({required super.data});
}
