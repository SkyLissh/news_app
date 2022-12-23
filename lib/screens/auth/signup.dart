import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:provider/provider.dart";

import "package:news_app/constants/constants.dart";
import "package:news_app/providers/providers.dart";
import "package:news_app/widgets/widgets.dart";

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  // Field values
  String? _name;
  String? _email;
  String? _password;

  void _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final success = await context.read<AuthNotifier>().signUp(
            name: _name!,
            email: _email!,
            password: _password!,
          );

      if (!success) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _formKey.currentState!.validate();
        });

        return;
      }

      if (!mounted) return;
      context.read<AuthNotifier>().resetInvalid();
      context.go("/");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: WelcomeLayout(
          showBackButton: true,
          imageHeight: 300.0,
          imageUrl:
              "https://images.unsplash.com/photo-1504465039710-0f49c0a47eb7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fG5ld3N8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
          child: Form(
            key: _formKey,
            child: Column(children: [
              Text("Welcome To News App!", style: kTextHeader),
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
              NameField(onSaved: (value) => _name = value),
              const SizedBox(height: 20.0),
              EmailField(onSaved: (value) => _email = value),
              const SizedBox(height: 20.0),
              PasswordField(onSaved: (value) => _password = value),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _onSubmit,
                child: const Text("Sign Up"),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
