import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "package:news_app/constants/constants.dart";
import "package:news_app/widgets/widgets.dart";

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeLayout(
        imageUrl:
            "https://images.unsplash.com/photo-1611159063981-b8c8c4301869?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzh8fG5ld3N8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
        child: Column(children: [
          Text(
            "Keep Up With The Latest News",
            style: kTextHeader,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 10.0,
            ),
            child: Text(
              "Get the latest news from around the world in one place",
              style: kTextNormal.copyWith(color: Colors.blueGrey[400]),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 50.0,
            height: 5.0,
            decoration: BoxDecoration(
              color: Colors.blue[800],
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          const SizedBox(height: 30.0),
          ElevatedButton(
            onPressed: () => context.go("/welcome/signup"),
            child: const Text("Sign Up With Email"),
          ),
          const SizedBox(height: 10.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Already have an account?", style: kTextNormal),
            TextButton(
              onPressed: () => context.go("/welcome/login"),
              child: const Text("Log In"),
            ),
          ])
        ]),
      ),
    );
  }
}
