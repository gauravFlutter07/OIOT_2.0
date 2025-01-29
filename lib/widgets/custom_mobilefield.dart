// ignore_for_file: prefer_typing_uninitialized_variables

import '../imports.dart';

class CustomMobileField extends StatelessWidget {
  final TextEditingController controller;
  final maxlength;
  const CustomMobileField({
    super.key,
    required this.controller,
    this.maxlength,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextfield(
      maxlength: maxlength,
      textEditingController: controller,
      isPass: false,
      hint: '0000000000',
      prefixIcon: SizedBox(
        width: 50,
        child: Row(
          children: [
            width10,
            Text(
              '+91',
              style: tsRegular,
            ),
            width5,
            Container(
              color: whiteColor,
              height: 30,
              width: 1,
            )
          ],
        ),
      ),
      suffixIcon: null,
    );
  }
}
