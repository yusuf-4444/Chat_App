import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormFieldUsername extends StatelessWidget {
  CustomTextFormFieldUsername({
    super.key,
    required this.hintText,
    required this.onChanged,
  });

  final String hintText;

  Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty || !value.contains(".com")) {
          return ("Please Enter Email");
        }
        return null;
      },
      onChanged: onChanged,
      style: TextStyle(color: Colors.white),
      cursorErrorColor: Colors.red,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        suffixIconColor: Colors.white,

        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 219, 220, 221),
          ),
        ),
      ),
    );
  }
}
