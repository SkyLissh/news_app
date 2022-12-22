import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "package:news_app/providers/providers.dart";

class PasswordField extends StatefulWidget {
  final void Function(String?)? onSaved;

  const PasswordField({Key? key, this.onSaved}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  String? _validator(String? value, AuthState auth) {
    final regExp = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");

    if (value == null || value.isEmpty) {
      return "Password is required";
    } else if (value.length < 8) {
      return "Password must be at least 8 characters";
    } else if (!regExp.hasMatch(value)) {
      return "Must contain at least one letter and one number";
    } else if (auth.invalidEmailOrPassword) {
      return "Invalid email or password";
    } else if (auth.weakPassword) {
      return "Password is too weak";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthState>();

    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscureText,
      obscuringCharacter: "●",
      validator: (value) => _validator(value, auth),
      onSaved: widget.onSaved,
      decoration: InputDecoration(
        labelText: "Password",
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
            splashRadius: 20.0,
            onPressed: () => setState(() {
                  _obscureText = !_obscureText;
                }),
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off)),
      ),
    );
  }
}
