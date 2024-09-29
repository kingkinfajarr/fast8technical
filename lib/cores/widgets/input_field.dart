import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_color.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final IconData? suffix;
  final ValueChanged<String?>? onChanged;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? maxLength;

  const CustomInputField({
    super.key,
    required this.label,
    this.suffix,
    this.onChanged,
    required this.controller,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('* ', style: TextStyle(color: clrRed, fontSize: 12)),
            Text(label, style: TextStyle(color: clrBlack, fontSize: 14)),
          ],
        ),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: clrLightGray.withOpacity(0.5),
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            suffixIcon: suffix != null ? Icon(suffix) : null,
          ),
          onChanged: onChanged,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
