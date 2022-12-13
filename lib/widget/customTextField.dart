import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? text;
  final TextEditingController? controller;
  final Function onSave;
  final Function validator;

  const CustomTextField({
    super.key,
    this.text,
    this.controller,
    required this.onSave,
    required this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: (value) => onSave(value),
      validator: (value) => validator(value),
      decoration: InputDecoration(labelText: text),
    );
  }
}
