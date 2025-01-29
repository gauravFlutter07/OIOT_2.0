import '../../../../../../imports.dart';

// Subscription bottom sheet
Future<Widget?> bottomSheetInvoice(
    {required BuildContext context,
    dynamic provider,
    String? imageName,
    bool? isPdf}) async {
  return await showModalBottomSheet(
    backgroundColor: whiteColor,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Consumer<BottomInvoiceProvider>(
            builder: (context, provider, child) {
              SubscriptionInvoiceModel? subscriptionInvoice =
                  provider.mySubscriptionInvoiceDetails;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height40,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          customTextWidget(
                            text: AppLocalizations.of(context)!.invoice,
                            size: 20.0,
                            color: textGrey,
                            weight: fontWeight700,
                          ),
                          width20,
                          customTextWidget(
                            text: subscriptionInvoice?.invoiceId ?? '',
                            size: 20.0,
                            color: darkBlack,
                            weight: fontWeight600,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.cancel,
                          color: redColor,
                          size: 50,
                        ),
                      )
                    ],
                  ),
                  height20,
                  customTextWidget(
                    text: subscriptionInvoice?.paidAmount ?? '',
                    size: 40.0,
                    color: textGrey,
                    weight: bold,
                  ),
                  Divider(
                    color: lightGrey,
                    height: 5,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 460,
                    child: Padding(
                      padding: vertPadding10,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!
                                  .startDateAndTime),
                              Text(
                                subscriptionInvoice?.startDate ?? '',
                              ),
                            ],
                          ),
                          height05,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  AppLocalizations.of(context)!.endDateAndTime),
                              Text(
                                subscriptionInvoice?.endDate ?? '',
                              ),
                            ],
                          ),
                          height05,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!
                                  .businessNameProfileId),
                              Text(
                                subscriptionInvoice?.businessName ?? '',
                              ),
                            ],
                          ),
                          height10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!.panNo),
                              Text(
                                subscriptionInvoice?.panNumber ?? '',
                              ),
                            ],
                          ),
                          height05,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!.gstNo),
                              Text(
                                subscriptionInvoice?.gstNumber ?? '',
                              ),
                            ],
                          ),
                          height05,
                          Divider(
                            color: lightGrey,
                            height: 5,
                            thickness: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.totalCharges,
                                style: tsRegularBold,
                              ),
                              Text(
                                subscriptionInvoice?.totalCharges ?? '',
                                style: tsRegularBoldGrey,
                              ),
                            ],
                          ),
                          height05,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!.gstAmount),
                              Text(
                                subscriptionInvoice?.gstAmount ?? '',
                              ),
                            ],
                          ),
                          height05,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  AppLocalizations.of(context)!.coupenDiscount),
                              Text(
                                subscriptionInvoice?.couponDiscount ?? '',
                              )
                            ],
                          ),
                          height05,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!.pgCharges),
                              Text(
                                subscriptionInvoice?.pgCharges ?? '',
                              )
                            ],
                          ),
                          height05,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!.bankCharges),
                              Text(
                                subscriptionInvoice?.bankCharges ?? '',
                              )
                            ],
                          ),
                          height05,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!.roundOff),
                              Text(
                                subscriptionInvoice?.roundOff ?? '',
                              )
                            ],
                          ),
                          height05,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!.paymentMode),
                              Text(
                                subscriptionInvoice?.paymentMode ?? '',
                              )
                            ],
                          ),
                          height05,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customTextWidget(
                                text: AppLocalizations.of(context)!.paidAmount,
                                color: darkBlack,
                                size: 16,
                                weight: bold,
                              ),
                              customTextWidget(
                                text: subscriptionInvoice?.paidAmount ?? '',
                                color: darkBlack,
                                size: 16,
                                weight: bold,
                              ),
                            ],
                          ),
                          height40,
                          CustomButton(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteClass.invoicebill);
                            },
                            title: AppLocalizations.of(context)!.share,
                            border: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}
