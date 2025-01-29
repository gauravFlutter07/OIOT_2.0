import '../../imports.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: padding16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height30,
              Text(
                '${AppLocalizations.of(context)!.helloWelcome},',
                style: tsExtraLargeBoldBlack,
              ),
              height30,
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppLocalizations.of(context)!.welcomeToA,
                      style: tsExtraLargeBlack,
                    ),
                    TextSpan(
                      text: AppLocalizations.of(context)!.safeWelcome,
                      style: tsExtraLargeBoldBlack,
                    ),
                  ],
                ),
              ),
              height10,
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppLocalizations.of(context)!.wayOfWelcome,
                      style: tsExtraLargeBlack,
                    ),
                    TextSpan(
                      text: AppLocalizations.of(context)!.findingARide,
                      style: tsExtraLargeBoldBlack,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    '                        ',
                    style: TextStyle(fontSize: 18, color: transperentColor),
                  ),
                  Container(
                    width: 205,
                    height: 4,
                    decoration: BoxDecoration(
                      color: blueMain,
                    ),
                  )
                ],
              ),
              const Spacer(),
              CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, RouteClass.loginScreen);
                },
                title: AppLocalizations.of(context)!.signin,
                border: true,
              ),
              height25,
              CustomButton(
                onTap: () {
                  Navigator.pushNamed(
                      context, RouteClass.accountCreateIndividual);
                },
                title: AppLocalizations.of(context)!.createAccountNow,
                optionalColor: textBlack,
                border: true,
              ),
              height50,
            ],
          ),
        ),
      ),
    );
  }
}
