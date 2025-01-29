import '../imports.dart';

// ignore: must_be_immutable
class NavbarContainer extends StatelessWidget {
  final Widget leadWidget;
  final Widget subWidget;
  final String title;
  Color? backgroundColor;
  final bool isBorder;
  final VoidCallback callBack;

  NavbarContainer({
    super.key,
    required this.leadWidget,
    required this.subWidget,
    required this.title,
    this.backgroundColor,
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
            color: backgroundColor ?? Colors.transparent,
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
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: darkBlack,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
