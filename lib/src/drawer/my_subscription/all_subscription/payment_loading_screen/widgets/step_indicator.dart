import 'package:flutter/material.dart';
import 'package:oiot/elements/color_pallet_fonts.dart';
import 'package:oiot/widgets/custom_text_widget.dart';
// Add any other necessary imports

class StepIndicator extends StatefulWidget {
  const StepIndicator({super.key});

  @override
  State<StepIndicator> createState() => _StepIndicatorState();
}

class _StepIndicatorState extends State<StepIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 30),
          duration: const Duration(seconds: 3),
          builder: (BuildContext context, double value, Widget? qChild) {
            return Stack(
              children: [
                SizedBox(
                  width: 210,
                  height: 210,
                  child: CircularProgressIndicator(
                    value: value / 30,
                    backgroundColor: greyShade200,
                    valueColor: AlwaysStoppedAnimation<Color>(greenColor),
                    strokeWidth: 20,
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: customTextWidget(
                      text: '${(value / 30 * 100).toStringAsFixed(0)}%',
                      size: 30.0,
                      color: blackColor,
                      weight: bold,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
