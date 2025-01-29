import '../../../../../imports.dart';

// ignore: must_be_immutable
class QrDriverContainer extends StatelessWidget {
  final Widget leadWidget;
  final Widget subWidget;
  final String title;
  final bool isBorder;
  final VoidCallback callBack;

  const QrDriverContainer({
    super.key,
    required this.leadWidget,
    required this.subWidget,
    required this.title,
    required this.isBorder,
    required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 7),
      child: InkWell(
        onTap: callBack,
        child: Container(
          decoration: BoxDecoration(
            border: isBorder
                ? Border.all(
                    color: borderGrey,
                  )
                : null,
            borderRadius: BorderRadius.circular(7),
          ),
          child: ListTile(
            leading: leadWidget,
            subtitle: subWidget,
            title: Text(
              title,
              style: tsRegularBold,
            ),
          ),
        ),
      ),
    );
  }
}
