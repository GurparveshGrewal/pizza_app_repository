part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpProcessEvent extends SignUpEvent {
  final MyUser myUser;
  final String password;

  const SignUpProcessEvent({
    required this.myUser,
    required this.password,
  });
}

class SignUpSuccessEvent extends SignUpEvent {}

class SignUpFailedEvent extends SignUpEvent {}
