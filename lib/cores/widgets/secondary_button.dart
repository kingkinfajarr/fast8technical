import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const SecondaryButton({
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
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              color: clrYellow,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(color: clrYellow, fontSize: 16),
        ),
      ),
    );
  }
}
