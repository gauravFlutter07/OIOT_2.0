// ignore_for_file: prefer_typing_uninitialized_variables

import '../imports.dart';

class CustomTextfield extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hint;
  final Widget? prefixIcon;
  final IconButton? suffixIcon;
  final maxlength;

  const CustomTextfield(
      {super.key,
      required this.textEditingController,
      required this.isPass,
      required this.hint,
      this.prefixIcon,
      this.suffixIcon,
      this.maxlength});

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextfield createState() => _CustomTextfield();
}

class _CustomTextfield extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: widget.maxlength,
      controller: widget.textEditingController,
      obscureText: widget.isPass,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: greyColor,
        ),
        hintText: widget.hint,
        hintStyle: tsSmallGrey,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: textfieldBorder, width: 1.2),
          borderRadius: circularBorderRadius5,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textfieldBorder, width: 1.2),
          borderRadius: circularBorderRadius5,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textfieldBorder, width: 1.2),
          borderRadius: circularBorderRadius5,
        ),
      ),
      style: tsSmallGrey,
    );
  }
}
