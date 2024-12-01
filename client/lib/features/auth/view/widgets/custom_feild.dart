import 'package:flutter/material.dart';

class CustomFeild extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscrureText;
  const CustomFeild(
      {super.key,
      required this.hintText,
      required this.controller,
      this.isObscrureText = false});

  @override
  State<CustomFeild> createState() => _CustomFeildState();
}

class _CustomFeildState extends State<CustomFeild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
      ),
      validator: (val) {
        if (val!.trim().isEmpty) {
          return "${widget.hintText} is missing!";
        }
        return null;
      },
      obscureText: widget.isObscrureText,
    );
  }
}
