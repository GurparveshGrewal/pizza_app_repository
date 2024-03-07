import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String? enteredEmail;
  String? enteredPassword;

  void _onSignInClick() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
              ElevatedButton(
                  onPressed: _onSignInClick, child: const Text("Sign In"))
            ],
          ),
        ));
  }
}
