import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.type,
    this.prefixText,
    this.labelText,
    this.maxLength,
    this.validator,
    this.obscureText,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? type;
  final String? Function(String?)? validator;
  final String? prefixText;
  final int? maxLength;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        obscureText: obscureText ?? false,
        maxLength: maxLength,
        validator: validator,
        keyboardType: type,
        controller: controller,
        decoration: InputDecoration(
          counterText: '',
          prefixText: prefixText,
          labelText: labelText,
          hintText: hintText,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
