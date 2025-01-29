import '../../../../imports.dart';

class OptionTileAsset extends StatelessWidget {
  final String image;
  final String text;
  final bool isTransparent;
  final VoidCallback callback;
  const OptionTileAsset({
    super.key,
    required this.image,
    required this.text,
    required this.isTransparent,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(
          color: (isTransparent) ? transperentColor : grey100,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: Column(
            children: [
              Image.asset(
                image,
                height: 50,
                width: 90,
              ),
              height05,
              Text(
                text,
                style: tsSmallGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
