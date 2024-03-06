import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/screens/auth/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:user_repository/user_repository.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String? enteredEmail;
  String? enteredName;
  String? enteredPassword;
  bool isLoading = false;

  void _onSignUpClick() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final MyUser myUser = MyUser.empty;
      myUser.email = enteredEmail!;
      myUser.name = enteredName!;

      // BlocProvider.of<SignUpBloc>(context).add(SignUpProcessEvent(
      //   myUser: myUser,
      //   password: enteredPassword!,
      // ));

      context.read<SignUpBloc>().add(SignUpProcessEvent(
            myUser: myUser,
            password: enteredPassword!,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoadingState) {
          setState(() {
            isLoading = true;
          });
        } else if (state is SignUpSuccessState) {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Sign Up Success')));
        } else if (state is SignUpFailedState) {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Sign Up Failed')));
        }
      },
      child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    label: Text("Email"),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.trim().contains('@')) {
                      return "invalid email address";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    enteredEmail = value!.trim();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.info),
                    label: Text("Name"),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length < 4) {
                      return "atleast of 4 characters";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    enteredName = value!.trim();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    label: Text("Password"),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  maxLength: 8,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length < 8) {
                      return "atleast of 8 characters";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    enteredPassword = value!.trim();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                !isLoading
                    ? ElevatedButton(
                        onPressed: _onSignUpClick, child: const Text("Sign Up"))
                    : const CircularProgressIndicator(),
              ],
            ),
          )),
    );
  }
}
