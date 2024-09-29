import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class MainButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const MainButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: clrYellow,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(color: clrWhite, fontSize: 16),
        ),
      ),
    );
  }
}
