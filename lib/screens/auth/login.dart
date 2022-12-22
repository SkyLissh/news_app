import "package:flutter/material.dart";

import "package:news_app/constants/constants.dart";
import "package:news_app/widgets/widgets.dart";

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: WelcomeLayout(
          imageHeight: 300.0,
          showBackButton: true,
          imageUrl:
              "https://images.unsplash.com/photo-1504465188792-96c4e8752e8e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDh8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
          child: Form(
            key: _formKey,
            child: Column(children: [
              Text("Welcome Back!", style: kTextHeader),
              const SizedBox(height: 10.0),
              Container(
                width: 50.0,
                height: 5.0,
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              const SizedBox(height: 30.0),
              const EmailField(),
              const SizedBox(height: 20.0),
              const PasswordField(),
              const SizedBox(height: 20.0),
              ElevatedButton(onPressed: _onSubmit, child: const Text("Log In")),
            ]),
          ),
        ),
      ),
    );
  }
}
