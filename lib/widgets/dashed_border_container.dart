import '../imports.dart';

class DashedBorderContainer extends StatelessWidget {
  final VoidCallback onTap;
  final String? topText;
  final String? bottomText;
  const DashedBorderContainer({
    super.key,
    required this.onTap,
    this.topText,
    this.bottomText,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: const [5, 5],
      strokeWidth: 1,
      color: textDarkGrey,
      padding: EdgeInsets.zero,
      borderType: BorderType.RRect,
      radius: const Radius.circular(8),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.file_upload_outlined,
                      size: 48,
                      color: textDarkGrey,
                    ),
                    Text(
                      (topText == null) ? 'Upload if any attachment' : topText!,
                      style: TextStyle(
                        color: textDarkGrey,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  (bottomText == null)
                      ? 'Upload the scan copy of the issue'
                      : bottomText!,
                  style: TextStyle(
                    color: textDarkGrey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
