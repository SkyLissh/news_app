import "package:flutter/material.dart";

class PasswordField extends StatefulWidget {
  final VoidCallback? onSubmitted;

  const PasswordField({Key? key, this.onSubmitted}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  String? _validator(String? value) {
    final regExp = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");

    if (value == null || value.isEmpty) {
      return "Password is required";
    } else if (value.length < 8) {
      return "Password must be at least 8 characters";
    } else if (!regExp.hasMatch(value)) {
      return "Must contain at least one letter and one number";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscureText,
      obscuringCharacter: "●",
      validator: _validator,
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
