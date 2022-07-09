// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class TodoListField extends StatelessWidget {
  final String label;
  final IconButton? suffixIconButton;
  final bool obscureText;
  final ValueNotifier<bool> obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  TodoListField(
      {Key? key,
      required this.label,
      this.suffixIconButton,
      this.obscureText = false,
      this.controller,
      this.focusNode,
      this.validator})
      : assert(obscureText == true ? suffixIconButton == null : true,
            'ObscureText não pode ser enviado em conjunto com suffixIconButton'),
        obscureTextVN = ValueNotifier(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: obscureTextVN,
        builder: (_, obscureTextValue, __) {
          return TextFormField(
            focusNode: focusNode,
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.red),
              ),
              isDense: true,
              suffixIcon: suffixIconButton ??
                  (obscureText == true ? IconButton(
                          onPressed: () {
                            obscureTextVN.value = !obscureTextValue;
                          },
                          icon: Icon(!obscureTextValue ? Icons.visibility_off : Icons.visibility,
                            size: 18,
                          ),
                        )
                      : null),
            ),
            obscureText: obscureTextValue,
          );
        });
  }
}
