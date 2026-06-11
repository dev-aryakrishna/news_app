import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.validator,
    this.obscureText = false,
  }) ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
       obscureText: obscureText,
       validator: validator,
      decoration: InputDecoration(
        
        hintText: hintText,
      ),
    );
  }
}