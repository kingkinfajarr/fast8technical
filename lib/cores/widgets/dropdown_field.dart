import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class CustomDropdownField extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final bool? required;
  final ValueChanged<String?>? onChanged;

  const CustomDropdownField({
    super.key,
    required this.label,
    this.value,
    required this.items,
    this.required = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (required == true)
              Text('* ', style: TextStyle(color: clrRed, fontSize: 12)),
            Text(label, style: TextStyle(color: clrBlack, fontSize: 14)),
          ],
        ),
        const SizedBox(height: 4),
        DropdownButtonFormField<String>(
          value: (value ?? '').isEmpty ? null : value,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: clrLightGray),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
