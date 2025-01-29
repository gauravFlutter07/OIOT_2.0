import 'package:oiot/src/login_register/mpin/mpin_provider.dart';

import '../../../imports.dart';

class Mpin extends StatelessWidget {
  const Mpin({super.key});

  @override
  Widget build(BuildContext context) {
    final mpinProvider = Provider.of<MpinProvider>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: padding15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeader(title: ''),
                height15,
                Text(
                  AppLocalizations.of(context)!.letsLogin,
                  style: tsExtraLargeBold,
                ),
                height25,
                Text(
                  AppLocalizations.of(context)!.mpinLoginWithMpinorId,
                  style: tsRegularBoldGrey,
                ),
                height30,
                Form(
                  child: Padding(
                    padding: passwordColumnPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.typeYourPin,
                          style: tsRegularGrey,
                        ),
                        height10,
                        TextFormField(
                          controller: mpinProvider.mpinTextController,
                          style: tsMedium,
                          textAlign: centreAlign,
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!
                                .enterFourDigitCode,
                            border: const OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .pleaseEnterFourDigitPassword;
                            }
                            if (value.length != 4 ||
                                int.tryParse(value) == null) {
                              return AppLocalizations.of(context)!
                                  .pleaseReEnterFourDigitPassword;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                height50,
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserOfflineHome(),
                      ),
                    );
                  },
                  child: Align(
                    alignment: centreAlignment,
                    child: RippleAnimation(
                      color: blueMain,
                      delay: const Duration(milliseconds: 300),
                      repeat: true,
                      minRadius: 40,
                      ripplesCount: 5,
                      duration: const Duration(milliseconds: 6 * 300),
                      child: SizedBox(
                        height: 90,
                        width: 90,
                        child: Image.asset(
                          fingerPrint,
                        ),
                      ),
                    ),
                  ),
                ),
                height60,
                Align(
                  alignment: centreAlignment,
                  child: Text(
                    AppLocalizations.of(context)!.orYouCanLoginWithYour,
                    style: tsRegularBoldGrey,
                  ),
                ),
                Align(
                  alignment: centreAlignment,
                  child: Text(
                    AppLocalizations.of(context)!.userIdAndPassword,
                    style: tsRegularBoldGrey,
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
