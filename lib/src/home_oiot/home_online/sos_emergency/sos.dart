import '../../../../imports.dart';

class SosPage extends StatefulWidget {
  const SosPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SosPageState createState() => _SosPageState();
}

class _SosPageState extends State<SosPage> {
  bool isActivated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: padding10,
              child: CustomHeader(title: AppLocalizations.of(context)!.sos),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    AppLocalizations.of(context)!.activate,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  width30,
                  Row(
                    children: [
                      Text(isActivated ? 'on' : 'off'),
                      Switch(
                        value: isActivated,
                        onChanged: (newValue) {
                          setState(() {
                            isActivated = newValue;
                          });
                        },
                        activeColor: blueMain,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 180,
              height: 180,
              child: Image.asset(
                sos,
                fit: BoxFit.cover,
              ),
            ),
            height15,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.useWhenYouAreIn,
                  style: tsLargeBold,
                ),
                Text(
                  AppLocalizations.of(context)!.emergencyText,
                  style: tsLargeBold,
                ),
                height15,
                Text(
                  AppLocalizations.of(context)!.sosWillSentAnImmediateAlert,
                  style: tsMediumGrey,
                ),
                Text(
                  AppLocalizations.of(context)!.messageToTheFamily,
                  style: tsMediumGrey,
                ),
                Text(
                  AppLocalizations.of(context)!.membersOrThePeopleTrusted,
                  style: tsMediumGrey,
                ),
                height30,
                Padding(
                  padding: padding15,
                  child: CustomButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EmergencyContactPage(),
                          ),
                        );
                      },
                      title: AppLocalizations.of(context)!.addEmergencyContact,
                      border: true),
                ),
                height10,
                Padding(
                  padding: padding15,
                  child: CustomButtonOnlyBorder(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteClass.businessContactPage);
                    },
                    title: AppLocalizations.of(context)!.addBusinessContact,
                    border: true,
                    optionalTextColor: blackColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
