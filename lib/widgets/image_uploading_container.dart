import 'package:flutter/material.dart';
import 'package:oiot/elements/color_pallet_fonts.dart';

class ImageUploading extends StatefulWidget {
  final bool isLoading;
  final Color? optionalColor;
  const ImageUploading(
      {super.key, required this.isLoading, this.optionalColor});

  @override
  // ignore: library_private_types_in_public_api
  _ImageUploading createState() => _ImageUploading();
}

class _ImageUploading extends State<ImageUploading>
    with SingleTickerProviderStateMixin {
  double uploadPercentage = 0.0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    if (widget.isLoading) {
      _animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      );
      _animationController.addListener(() {
        setState(() {
          uploadPercentage = _animationController.value;
        });
      });
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    if (widget.isLoading) {
      _animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 1,
      child: Container(
        decoration: BoxDecoration(
          color: (widget.optionalColor != null) ? null : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: ListTile(
            leading: Image.asset(
              'assetst/image_icon.png',
              height: 40,
              width: 40,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'profile.png',
                        style: TextStyle(
                          color: widget.isLoading
                              ? Colors.black
                              : const Color(0xFF707070),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${1.8.toStringAsFixed(1)} MB',
                        style: TextStyle(
                            color: widget.isLoading
                                ? Colors.black
                                : const Color(0xFF707070),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  '${(uploadPercentage * 100).toStringAsFixed(0)}%',
                  style: TextStyle(
                      color: widget.isLoading
                          ? Colors.black
                          : const Color(0xFF707070),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            subtitle: Container(
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), // Rounded border
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: LinearProgressIndicator(
                  value: uploadPercentage,
                  backgroundColor: const Color(0xFFb3b5bb),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    blueMain,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
