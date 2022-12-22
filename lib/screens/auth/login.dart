import "package:flutter/material.dart";

import "package:news_app/constants/constants.dart";
import "package:news_app/widgets/widgets.dart";

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: WelcomeLayout(
          showBackButton: true,
          imageUrl:
              "https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
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
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(onPressed: () {}, child: const Text("Log In")),
          ]),
        ),
      ),
    );
  }
}
