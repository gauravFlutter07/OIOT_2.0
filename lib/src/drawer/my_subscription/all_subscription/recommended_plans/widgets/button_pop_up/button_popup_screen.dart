import '../../../../../../../imports.dart';

class BottomSlidingDriverPopup extends StatelessWidget {
  const BottomSlidingDriverPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ButtonPopUpProvider>(builder: (context, provider, child) {
      ButtonPopUpDataModel? buttonPopUpData = provider.buttonPopUpData;
      return SizedBox(
        height: 600,
        child: SafeArea(
          child: Scaffold(
            body: Padding(
              padding: buttonPopUpPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '1 ${AppLocalizations.of(context)!.dayPack}',
                            style: tsMediumGrey,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.cancel,
                              color: redColor,
                              size: 40,
                              weight: 90,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          customTextWidget(
                            text: buttonPopUpData?.popUpAmount ?? '',
                            size: 30.0,
                            color: blueMain,
                            weight: bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                  height10,
                  Divider(
                    color: greyColor,
                    height: 5,
                    thickness: 2,
                  ),
                  height10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customTextWidget(
                        text: AppLocalizations.of(context)!.validity,
                        size: 16.0,
                        color: blackColor,
                        weight: fontWeight500,
                      ),
                      customTextWidget(
                        text: buttonPopUpData?.validity ?? '',
                        size: 16.0,
                        color: textGrey,
                        weight: fontWeight400,
                      ),
                    ],
                  ),
                  height10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customTextWidget(
                        text: AppLocalizations.of(context)!.benefitOne,
                        size: 16.0,
                        color: blackColor,
                        weight: fontWeight500,
                      ),
                      customTextWidget(
                        text: buttonPopUpData?.benefit1 ?? '',
                        size: 16.0,
                        color: textGrey,
                        weight: fontWeight400,
                      ),
                    ],
                  ),
                  height10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customTextWidget(
                        text: AppLocalizations.of(context)!.benefitTwo,
                        size: 16.0,
                        color: blackColor,
                        weight: fontWeight500,
                      ),
                      customTextWidget(
                        text: buttonPopUpData?.benefit2 ?? '',
                        size: 16.0,
                        color: textGrey,
                        weight: fontWeight400,
                      ),
                    ],
                  ),
                  height10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customTextWidget(
                        text: AppLocalizations.of(context)!.benefitThree,
                        size: 16.0,
                        color: blackColor,
                        weight: fontWeight500,
                      ),
                      customTextWidget(
                        text: buttonPopUpData?.benefit3 ?? '',
                        size: 16.0,
                        color: textGrey,
                        weight: fontWeight400,
                      ),
                    ],
                  ),
                  height10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customTextWidget(
                        text: AppLocalizations.of(context)!.benefitFour,
                        size: 16.0,
                        color: blackColor,
                        weight: fontWeight500,
                      ),
                      customTextWidget(
                        text: buttonPopUpData?.benefit4 ?? '',
                        size: 16.0,
                        color: textGrey,
                        weight: fontWeight400,
                      ),
                    ],
                  ),
                  height10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customTextWidget(
                        text: AppLocalizations.of(context)!.benefitFive,
                        size: 16.0,
                        color: blackColor,
                        weight: fontWeight500,
                      ),
                      customTextWidget(
                        text: buttonPopUpData?.benefit5 ?? '',
                        size: 16.0,
                        color: textGrey,
                        weight: fontWeight400,
                      ),
                    ],
                  ),
                  height30,
                  Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                      border: Border.all(color: textDarkGrey),
                      borderRadius: circularBorderRadius7,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: leftPadding10,
                            child: Text(
                              AppLocalizations.of(context)!.applyCoupon,
                              style: TextStyle(
                                color: textDarkGrey,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 44,
                          child: TextButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: blueMain,
                            ),
                            child: Padding(
                              padding: applyPadding,
                              child: Text(
                                AppLocalizations.of(context)!.apply,
                                style: tsRegularWhite,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  height40,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextButton(
                          text: '  ${AppLocalizations.of(context)!.changePlan}',
                          color: whiteColor,
                          callBack: () {
                            Navigator.of(context).pop();
                          },
                          textColor: blackColor,
                          border: 0.0,
                          borderColor: textGrey,
                          fontSize: 16.0,
                        ),
                      ),
                      width20,
                      Expanded(
                        child: CustomTextButton(
                          text: '   ${AppLocalizations.of(context)!.subscribe}',
                          color: blueMain,
                          callBack: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PayingSubscriptionScreen(),
                              ),
                            );
                          },
                          textColor: whiteColor,
                          border: 0.0,
                          borderColor: transperentColor,
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
