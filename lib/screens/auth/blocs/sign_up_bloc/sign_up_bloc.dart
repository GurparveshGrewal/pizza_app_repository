import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository userRepository;
  SignUpBloc({
    required this.userRepository,
  }) : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) {});
    on<SignUpSuccessEvent>(signUpSuccessEvent);
    on<SignUpFailedEvent>(signUpFailedEvent);
    on<SignUpProcessEvent>(signUpProcessEvent);
  }

  FutureOr<void> signUpProcessEvent(
      SignUpProcessEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpLoadingState());
    try {
      final myUser = await userRepository.signup(
        event.myUser,
        event.password,
      );

      await userRepository.setUSerData(myUser);

      print(myUser);
      emit(SignUpSuccessState());
    } catch (e) {
      print(e);
      emit(SignUpFailedState());
    }
  }

  FutureOr<void> signUpSuccessEvent(
      SignUpSuccessEvent event, Emitter<SignUpState> emit) {}

  FutureOr<void> signUpFailedEvent(
      SignUpFailedEvent event, Emitter<SignUpState> emit) {}
}
