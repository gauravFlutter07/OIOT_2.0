import 'package:oiot/src/home_oiot/home_online/driver_searching_page/model/ride_request_success_modal.dart';

import '../../../../imports.dart';

// ignore: must_be_immutable
class RaiseNewTicket extends StatelessWidget {

  RaiseNewTicket({super.key,  });

  final TextEditingController commentController = TextEditingController();

  late String selectedOption;

  bool appIssue = true;

  bool rideIssue = false;

  bool routeIssue = false;

  bool paymentRelated = false;

  bool other = false;

  @override
  Widget build(BuildContext context) {
    final raiseIssueProvider = Provider.of<RaiseIssueProvider>(context);
    final raiseIssueProviderWatch = context.watch<RaiseIssueProvider>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: padding12,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomHeader(title: AppLocalizations.of(context)!.raiseAnIssue),
                height30,
                Text(
                  AppLocalizations.of(context)!.provideTheDetailBelow,
                  style: tsRegularBold,
                ),
                height30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        raiseIssueProviderWatch.onAppIssueClickedFunction();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: raiseIssueProviderWatch.isAppIssueClicked
                              ? lightBlack
                              : whiteColor,
                          border: raiseIssueProviderWatch.isAppIssueClicked
                              ? null
                              : Border.all(
                                  width: 1,
                                  color: borderGrey,
                                ),
                          borderRadius: circularBorderRadius5,
                        ),
                        child: Padding(
                          padding: padding10,
                          child: Text(
                            AppLocalizations.of(context)!.appIssue,
                            style: TextStyle(
                                color: raiseIssueProviderWatch.isAppIssueClicked
                                    ? whiteColor
                                    : lightBlack,
                                fontSize: 16,
                                fontWeight: fontWeight500),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        raiseIssueProviderWatch.onRideIssueClickedFunction();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: raiseIssueProviderWatch.isRideIssueClicked
                              ? lightBlack
                              : whiteColor,
                          border: raiseIssueProviderWatch.isRideIssueClicked
                              ? null
                              : Border.all(
                                  width: 1,
                                  color: borderGrey,
                                ),
                          borderRadius: circularBorderRadius5,
                        ),
                        child: Padding(
                          padding: padding10,
                          child: Text(
                            AppLocalizations.of(context)!.rideIssue,
                            style: TextStyle(
                                color:
                                    raiseIssueProviderWatch.isRideIssueClicked
                                        ? whiteColor
                                        : lightBlack,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        raiseIssueProviderWatch.onRouteIssueClicked();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: raiseIssueProviderWatch.isRouteIssueClicked
                              ? lightBlack
                              : whiteColor,
                          border: raiseIssueProviderWatch.isRouteIssueClicked
                              ? null
                              : Border.all(
                                  width: 1,
                                  color: borderGrey,
                                ),
                          borderRadius: circularBorderRadius5,
                        ),
                        child: Padding(
                          padding: padding10,
                          child: Text(
                            AppLocalizations.of(context)!.routeIssue,
                            style: TextStyle(
                                color:
                                    raiseIssueProviderWatch.isRouteIssueClicked
                                        ? whiteColor
                                        : lightBlack,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                height15,
                Padding(
                  padding: padding8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          raiseIssueProviderWatch.onPaymentClickedFunction();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: raiseIssueProviderWatch.isPaymentIssueClicked
                                ? lightBlack
                                : whiteColor,
                            border:
                                raiseIssueProviderWatch.isPaymentIssueClicked
                                    ? null
                                    : Border.all(
                                        width: 1,
                                        color: borderGrey,
                                      ),
                            borderRadius: circularBorderRadius5,
                          ),
                          child: Padding(
                            padding: padding10,
                            child: Text(
                              AppLocalizations.of(context)!.paymentRelated,
                              style: TextStyle(
                                  color: raiseIssueProviderWatch
                                          .isPaymentIssueClicked
                                      ? whiteColor
                                      : lightBlack,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      /*InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OtherIssueScreen(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(
                              width: 1,
                              color: borderGrey,
                            ),
                            borderRadius: circularBorderRadius5,
                          ),
                          child: Padding(
                            padding: padding10,
                            child: Text(
                              AppLocalizations.of(context)!.other,
                              style: tsRegular,
                            ),
                          ),
                        ),
                      ),*/
                    ],
                  ),
                ),
                height15,
                Text(
                  AppLocalizations.of(context)!.remark,
                  style: tsRegularBold,
                ),
                height05,
                TextFormField(
                  controller: raiseIssueProvider.remarkController,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.typeTheIssueHere,
                    filled: true,
                    fillColor: whiteColor,
                    border: OutlineInputBorder(
                      borderRadius: circularBorderRadius8,
                      borderSide: BorderSide(color: textDarkGrey),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                    hintStyle: TextStyle(color: textDarkGrey),
                  ),
                  style: TextStyle(color: textDarkGrey),
                  minLines: 4,
                  maxLines: 7,
                ),
                height15,
                Text(
                  AppLocalizations.of(context)!.uploadTheFiles,
                  style: tsRegular,
                ),
                height10,
                const ImageContainerBank(),
                height20,
                Text(
                  AppLocalizations.of(context)!.uploading,
                  style: tsRegular,
                ),
                height10,
                const ImageUploading(isLoading: true),
                height40,
                CustomButton(
                  onTap: () {
                    raiseIssueProvider.sendIssue(context);
                  },
                  title: AppLocalizations.of(context)!.submitNow,
                  border: true,
                ),
                height20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
