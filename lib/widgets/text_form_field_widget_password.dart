import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormFieldPassword extends StatefulWidget {
  CustomTextFormFieldPassword({
    super.key,
    required this.hintText,
    required this.onChanged,
  });

  final String hintText;
  Function(String) onChanged;

  @override
  State<CustomTextFormFieldPassword> createState() =>
      _CustomTextFormFieldPasswordState();
}

class _CustomTextFormFieldPasswordState
    extends State<CustomTextFormFieldPassword> {
  late bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Password");
        }
        return null;
      },
      onChanged: widget.onChanged,
      obscureText: obsecureText,
      style: TextStyle(color: Colors.white),
      cursorErrorColor: Colors.red,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        suffixIconColor: Colors.white,
        suffixIcon: IconButton(
          onPressed: () {
            obsecureText = !obsecureText;

            setState(() {});
          },
          icon: obsecureText
              ? Icon(Icons.visibility)
              : Icon(Icons.visibility_off),
        ),
        hintText: widget.hintText,
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
