import 'package:flutter/material.dart';

class SmallTextButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  const SmallTextButton({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 7),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
