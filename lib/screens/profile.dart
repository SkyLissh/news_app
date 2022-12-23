import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:intl/intl.dart";
import "package:go_router/go_router.dart";

import "package:news_app/constants/constants.dart";
import "package:news_app/providers/providers.dart";

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthState state) => state.user);

    if (user == null) {
      return const Scaffold(body: Center(child: Text("No user")));
    }

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 50),
              ),
            ),
            ProfileData(fieldName: "Id", fieldValue: user.id),
            ProfileData(fieldName: "Name", fieldValue: user.name),
            ProfileData(fieldName: "Email", fieldValue: user.email),
            ProfileData(
              fieldName: "Created At",
              fieldValue: DateFormat.yMMMMd().format(user.createdAt),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                context.read<AuthNotifier>().logOut();
                context.go("/welcome");
              },
              child: const Text("Log Out"),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileData extends StatelessWidget {
  final String fieldName;
  final String fieldValue;

  const ProfileData({
    Key? key,
    required this.fieldName,
    required this.fieldValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(fieldName, style: kTextNormal.copyWith(color: Colors.blue[800])),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
            borderRadius: kBorderRadius,
            border: Border.all(color: Colors.blueGrey[100]!),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(fieldValue),
          ),
        ),
      ]),
    );
  }
}
