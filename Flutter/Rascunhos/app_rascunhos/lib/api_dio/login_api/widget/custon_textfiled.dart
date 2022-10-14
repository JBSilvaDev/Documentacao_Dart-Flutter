import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controllerField;
  final String label;
  final bool? obscureTex;
  const CustomTextField({
    Key? key,
    required this.controllerField,
    required this.label,
    this.obscureTex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerField,
      decoration: InputDecoration(label: Text(label)),
      obscureText: obscureTex ?? false,
    );
  }
}
