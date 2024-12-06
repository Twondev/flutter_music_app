import 'package:flutter/material.dart';

class CustomField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscrureText;
  const CustomField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.isObscrureText = false});

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
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
