import '../../../../imports.dart';

class OptionTileNetwork extends StatelessWidget {
  final String image;
  final String text;
  final bool isTransparent;
  final bool isActive;
  final VoidCallback? callback;

  const OptionTileNetwork({
    super.key,
    required this.image,
    required this.text,
    required this.isTransparent,
    required this.isActive,
    this.callback,
  });

  void _showMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!
            .thisServiceTypeIsNotAvailableInYourArea),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isActive
          ? callback
          : () {
              _showMessage(context);
            },
      child: Opacity(
        opacity: isActive ? 1.0 : 0.5,
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
                Image.network(
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
      ),
    );
  }
}
