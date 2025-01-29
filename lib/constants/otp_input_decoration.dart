import '../imports.dart';

const InputDecoration otpInputDecoration = InputDecoration(
  labelStyle: TextStyle(
    color: Color(0xFFA8A8A8),
  ),
  filled: true,
  fillColor: Color(0xFFEEEEEE),
  hintText: '0',
  hintStyle: TextStyle(
    color: Color(0xFFA8A8A8),
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFEEEEEE)),
    borderRadius: BorderRadius.all(Radius.circular(5)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFEEEEEE)),
    borderRadius: BorderRadius.all(Radius.circular(5)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFFEEEEEE),
    ),
    borderRadius: BorderRadius.all(Radius.circular(5)),
  ),
);
