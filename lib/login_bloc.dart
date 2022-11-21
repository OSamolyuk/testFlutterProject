import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>(_loginEventHandler);

    on<LoginButtonTappedEvent>(_loginButtonTapped);
    on<ShowSnackBarButtonTappedEvent>(_showSnackBarTapped);

  }

  Future<void> _loginEventHandler(LoginEvent e, Emitter emit) async {
    emit(LoginInitial());
  }

  Future<void> _loginButtonTapped(LoginButtonTappedEvent e, Emitter emit) async {
    emit(UpdateTextState(text: "You've tapped the button"));
  }

  Future<void> _showSnackBarTapped(ShowSnackBarButtonTappedEvent e, Emitter emit) async {
    emit(ShowSnackbarState());
  }
}

abstract class LoginEvent {
  const LoginEvent();
}

class LoginButtonTappedEvent extends LoginEvent {}
class ShowSnackBarButtonTappedEvent extends LoginEvent {}
abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class UpdateTextState extends LoginState {
  final String text;
  UpdateTextState({required this.text});
}

class ShowSnackbarState extends LoginState {}