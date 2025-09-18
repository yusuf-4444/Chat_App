import 'package:chat_app/contants.dart';
import 'package:flutter/material.dart';

class ChatTextFormField extends StatelessWidget {
  const ChatTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        cursorErrorColor: Colors.red,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Type a message",
          suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.send)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: kPrimaryColor),
          ),
        ),
      ),
    );
  }
}
