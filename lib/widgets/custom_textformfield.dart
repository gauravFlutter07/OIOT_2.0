import '../imports.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hint;
  final Widget? prefixIcon;
  final IconButton? suffixIcon;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final int? maxLength;

  const CustomTextFormField({
    required this.textEditingController,
    required this.isPass,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType,
    this.validator,
    this.maxLength,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      validator: validator,
      keyboardType: textInputType,
      controller: textEditingController,
      obscureText: isPass,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: blackColor,
        ),
        filled: true,
        fillColor: greyColor,
        hintText: hint,
        hintStyle: TextStyle(
          color: black26,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: whiteColor),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: whiteColor),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: whiteColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
      ),
      style: TextStyle(
        color: blackColor,
      ),
    );
  }
}
