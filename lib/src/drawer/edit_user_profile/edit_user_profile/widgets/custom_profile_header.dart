import '../../../../../imports.dart';

class CustomMyProfileHeader extends StatelessWidget {
  const CustomMyProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          margin: padding5,
          decoration: BoxDecoration(
            shape: circleBoxShape,
            color: whiteColor,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: blackColor,
            ),
          ),
        ),
        Text(
          AppLocalizations.of(context)!.myProfile,
          style: tsRegularBold,
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfile(),
                  ),
                );
              },
              child: Container(
                width: 40,
                height: 40,
                margin: padding5,
                decoration: BoxDecoration(
                  shape: circleBoxShape,
                  color: whiteColor,
                ),
                padding: padding10,
                child: const Icon(Icons.edit),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
