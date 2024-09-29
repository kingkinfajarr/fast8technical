import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class CustomDatePickerField extends StatelessWidget {
  final String label;
  final DateTime initialDate;
  final ValueChanged<DateTime>? onChanged;

  const CustomDatePickerField({
    super.key,
    required this.label,
    required this.initialDate,
    this.onChanged,
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
        TextFormField(
          readOnly: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: clrLightGray),
              borderRadius: BorderRadius.circular(5),
            ),
            hintText: initialDate.toLocal().toString().split(' ')[0],
          ),
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: initialDate,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );
            if (pickedDate != null) {
              // Update state with the new date if needed
              onChanged?.call(pickedDate);
            }
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
