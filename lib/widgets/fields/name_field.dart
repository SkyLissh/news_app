import "package:flutter/material.dart";

class NameField extends StatelessWidget {
  final void Function(String?)? onSaved;

  const NameField({Key? key, this.onSaved}) : super(key: key);

  String? _validator(String? value) {
    final regExp = RegExp(r"^[A-Za-z ]+$");

    if (value == null || value.isEmpty) {
      return "Name is required";
    } else if (value.length < 3) {
      return "Name must be at least 3 characters";
    } else if (!regExp.hasMatch(value)) {
      return "Must contain only letters and spaces";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      validator: _validator,
      onSaved: onSaved,
      decoration: const InputDecoration(
        labelText: "Name",
        prefixIcon: Icon(Icons.person),
      ),
    );
  }
}
