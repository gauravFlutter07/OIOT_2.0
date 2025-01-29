import '../imports.dart';

class CustomRadioPair extends StatefulWidget {
  final VoidCallback firstOptionFunction;
  final VoidCallback secondOptionFunction;
  final String firstText;
  final String secondText;
  final int value;

  const CustomRadioPair({
    super.key,
    required this.firstOptionFunction,
    required this.secondOptionFunction,
    required this.firstText,
    required this.secondText,
    required this.value,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomRadioPairState createState() => _CustomRadioPairState();
}

class _CustomRadioPairState extends State<CustomRadioPair> {
  late int groupValue;

  @override
  void initState() {
    super.initState();
    groupValue = widget.value;
  }

  void _handleRadioValueChanged(int? newValue) {
    if (newValue != null) {
      setState(() {
        groupValue = newValue;
      });
      if (newValue == 0) {
        widget.firstOptionFunction();
      } else if (newValue == 1) {
        widget.secondOptionFunction();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio<int>(
          activeColor: textGrey,
          value: 0,
          groupValue: groupValue,
          onChanged: _handleRadioValueChanged,
        ),
        Text(
          widget.firstText,
          style: tsRegularBoldGrey,
        ),
        width20,
        Radio<int>(
          activeColor: textGrey,
          value: 1,
          groupValue: groupValue,
          onChanged: _handleRadioValueChanged,
        ),
        Text(
          widget.secondText,
          style: tsRegularBold,
        ),
      ],
    );
  }
}
