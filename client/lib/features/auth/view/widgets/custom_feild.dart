import 'package:flutter/material.dart';

class CustomFeild extends StatefulWidget {
  final String hintText;
  const CustomFeild({super.key, required this.hintText});

  @override
  State<CustomFeild> createState() => _CustomFeildState();
}

class _CustomFeildState extends State<CustomFeild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText:  widget.hintText, 
      ),
    );
  }
}