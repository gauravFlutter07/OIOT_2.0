import 'package:flutter/material.dart';
import 'package:oiot/widgets/custom_textwidget.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback callBack;
  final Color textColor;
  final double border;
  final Color borderColor;
  final double fontSize;
  const CustomTextButton({
    super.key,
    required this.text,
    required this.color,
    required this.callBack,
    required this.textColor,
    required this.border,
    required this.fontSize,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callBack,
      child: Container(
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: borderColor, width: border),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          //Please don't modify this widget :) If required  make another
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: fontSize,
              color: textColor,
            ),
          )),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color bgcolor;
  final double size;

  const CustomElevatedButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.color,
      required this.bgcolor,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgcolor,
          elevation: 0.0,
        ),
        onPressed: onPressed,
        child: customTextWidget(
          text: text,
          size: size,
          color: color,
          weight: FontWeight.w500,
        ),
      ),
    );
  }
}
