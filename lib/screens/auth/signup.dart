import "package:flutter/material.dart";

import "package:news_app/constants/constants.dart";
import "package:news_app/widgets/widgets.dart";

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: WelcomeLayout(
          showBackButton: true,
          imageHeight: 300.0,
          imageUrl:
              "https://images.unsplash.com/photo-1504465039710-0f49c0a47eb7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fG5ld3N8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
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
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: "Name",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20.0),
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
            ElevatedButton(onPressed: () {}, child: const Text("Sign Up")),
          ]),
        ),
      ),
    );
  }
}
