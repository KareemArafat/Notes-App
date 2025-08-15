import 'package:flutter/material.dart';
import 'package:notes_app/consts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hint,
    this.maxLines = 1,
    this.saved,
    this.change,
    this.controller,
  });

  final String? hint;
  final int maxLines;
  final void Function(String?)? saved;
  final Function(String)? change;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: change,
      onSaved: saved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is empty';
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: kPrimaryColor),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
