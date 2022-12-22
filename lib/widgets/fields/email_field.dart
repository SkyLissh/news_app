import "package:flutter/material.dart";
import "package:email_validator/email_validator.dart";

class EmailField extends StatelessWidget {
  final VoidCallback? onSubmitted;

  const EmailField({Key? key, this.onSubmitted}) : super(key: key);

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    } else if (!EmailValidator.validate(value)) {
      return "Email is invalid";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: _validator,
      decoration: const InputDecoration(
        labelText: "Email",
        prefixIcon: Icon(Icons.email),
      ),
    );
  }
}
