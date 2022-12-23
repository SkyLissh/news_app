import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:email_validator/email_validator.dart";

import "package:news_app/providers/providers.dart";

class EmailField extends StatelessWidget {
  final void Function(String?)? onSaved;

  const EmailField({Key? key, this.onSaved}) : super(key: key);

  String? _validator(String? value, AuthState auth) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    } else if (!EmailValidator.validate(value)) {
      return "Email is invalid";
    } else if (auth.invalidEmailOrPassword) {
      return "Invalid email or password";
    } else if (auth.emailInUse) {
      return "Email is already in use";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthState>();

    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) => _validator(value, auth),
      onSaved: onSaved,
      decoration: const InputDecoration(
        labelText: "Email",
        prefixIcon: Icon(Icons.email),
      ),
    );
  }
}
