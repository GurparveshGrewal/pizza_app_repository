import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository userRepository;
  SignInBloc({required this.userRepository}) : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
