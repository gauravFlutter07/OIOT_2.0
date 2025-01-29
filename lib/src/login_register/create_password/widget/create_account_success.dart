import '../../../../imports.dart';

class CreatedAccountSuccess extends StatefulWidget {
  const CreatedAccountSuccess({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreatedAccountSuccessState createState() => _CreatedAccountSuccessState();
}

class _CreatedAccountSuccessState extends State<CreatedAccountSuccess> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, RouteClass.loginScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: padding16,
          child: Column(
            children: [
              height70,
              Image.asset(successPng),
              height50,
              Text(
                AppLocalizations.of(context)!.congratulations,
                style: tsExtraLargeBold,
              ),
              height50,
              Text(
                AppLocalizations.of(context)!.oiotCreatedSuccesfully,
                style: tsMediumBoldGrey,
                textAlign: TextAlign.center,
              ),
              // height40,
              // CustomButton(
              //     onTap: () {
              //       Navigator.pushNamed(context, RouteClass.loginScreen);
              //     },
              //     title: AppLocalizations.of(context)!.loginNow,
              //     border: true),
            ],
          ),
        ),
      ),
    );
  }
}
