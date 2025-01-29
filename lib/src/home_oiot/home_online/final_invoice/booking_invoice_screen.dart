import '../../../../imports.dart';

class BookingInvoiceOnline extends StatelessWidget {
  const BookingInvoiceOnline({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BookingProvider(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: SingleChildScrollView(
              child: Consumer<BookingProvider>(
                builder: (BuildContext context, provider, Widget? child) {
                  BookingInvoiceModel? bookingInvoiceData =
                      provider.bookingInvoiceModel;
                  return Column(
                    children: [
                      CustomHeader(
                          title:
                              '${AppLocalizations.of(context)!.bookingId} - ${bookingInvoiceData?.bookingId ?? ''}'),
                      height20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.startDateTime,
                            style: tsMediumBold,
                          ),
                          Text(
                            '${bookingInvoiceData?.startDate ?? ''} | ${bookingInvoiceData?.startTime ?? ''}',
                            style: tsRegularBoldGrey,
                          ),
                        ],
                      ),
                      height10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.endDateTime,
                            style: tsMediumBold,
                          ),
                          Text(
                            '${bookingInvoiceData?.endDate ?? ''} | ${bookingInvoiceData?.endTime ?? ''}',
                            style: tsRegularBoldGrey,
                          ),
                        ],
                      ),
                      height20,
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: horizontalPadding10,
                              child: Consumer<BookingProvider>(
                                builder: (context, provider, child) {
                                  return CustomButton(
                                    onTap: () => provider.toggleBillingDetail(),
                                    title: AppLocalizations.of(context)!
                                        .billingDetails,
                                    optionalColor: provider.isBillingDetail
                                        ? null
                                        : blackColor,
                                    optionalTextColor: provider.isBillingDetail
                                        ? null
                                        : whiteColor,
                                    border: true,
                                  );
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: horizontalPadding10,
                              child: CustomButton(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RouteDetails(),
                                    ),
                                  );
                                },
                                title:
                                    AppLocalizations.of(context)!.routeDetails,
                                optionalColor: blackColor,
                                optionalTextColor: whiteColor,
                                border: true,
                              ),
                            ),
                          )
                        ],
                      ),
                      height20,
                      Container(
                        color: greyShade200,
                        child: Padding(
                          padding: padding10,
                          child: Column(
                            children: [
                              const SizedBox(width: double.infinity),
                              Text(
                                AppLocalizations.of(context)!.amountToBePaid,
                                style: tsMediumBold,
                              ),
                              height05,
                              Text(
                                bookingInvoiceData?.amountTobePaid ?? '',
                                style: tsExtraLargeBold,
                              ),
                              height05,
                              Text(
                                '${AppLocalizations.of(context)!.bookingId} - ${bookingInvoiceData?.bookingId ?? ''}',
                                style: tsSmallGrey,
                              ),
                            ],
                          ),
                        ),
                      ),
                      height20,
                      Consumer<BookingProvider>(
                        builder: (context, provider, child) {
                          return Column(
                            children: [
                              Container1(
                                  expanded: provider.isContainer1Expanded),
                              height15,
                              Container3(
                                  expanded: provider.isContainer3Expanded),
                              height15,
                              Container2(
                                  expanded: provider.isContainer2Expanded),
                            ],
                          );
                        },
                      ),
                      height20,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.totalCharges,
                                    style: tsMediumBold,
                                  ),
                                  Text(
                                    bookingInvoiceData?.totalCharges ?? '',
                                    style: tsRegularBoldGrey,
                                  ),
                                ],
                              ),
                              height20,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'GST(6%)',
                                    style: tsRegularBold,
                                  ),
                                  Text(
                                    bookingInvoiceData?.gst ?? '',
                                    style: tsSmallBoldGrey,
                                  ),
                                ],
                              ),
                              height10,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'SGST(6%)',
                                    style: tsRegularBold,
                                  ),
                                  Text(
                                    bookingInvoiceData?.sgst ?? '',
                                    style: tsSmallBoldGrey,
                                  ),
                                ],
                              ),
                              height10,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .driverDiscount,
                                    style: tsRegularBold,
                                  ),
                                  Text(
                                    bookingInvoiceData?.driverDiscount ?? '',
                                    style: tsSmallBoldGrey,
                                  ),
                                ],
                              ),
                              height10,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.convCharges,
                                    style: tsRegularBold,
                                  ),
                                  Text(
                                    bookingInvoiceData?.convCharges ?? '',
                                    style: tsSmallBoldGrey,
                                  ),
                                ],
                              ),
                              height20,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.payableAmount,
                                    style: tsRegularBold,
                                  ),
                                  Text(
                                    bookingInvoiceData?.payableAmount ?? '',
                                    style: tsMediumBoldGreen700,
                                  ),
                                ],
                              ),
                              height10,
                            ],
                          ),
                        ),
                      ),
                      height15,
                      Text(
                        '${AppLocalizations.of(context)!.promotionalDiscountForNextRide} ${bookingInvoiceData?.promotionalDiscound ?? ''}',
                        style: const TextStyle(fontSize: 17),
                      ),
                      height10,
                      Consumer<BookingProvider>(
                        builder: (context, provider, child) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: RadioListTile<int>(
                                  title: Text(
                                    AppLocalizations.of(context)!.payOnline,
                                    style: tsRegularBold,
                                  ),
                                  value: 0,
                                  activeColor: blackColor,
                                  groupValue: provider.selectedOption,
                                  onChanged: (value) {
                                    provider.setSelectedOption(value!);
                                  },
                                ),
                              ),
                              Expanded(
                                child: RadioListTile<int>(
                                  title: Text(
                                    AppLocalizations.of(context)!.payCash,
                                    style: tsRegularBold,
                                  ),
                                  value: 1,
                                  activeColor: blackColor,
                                  groupValue: provider.selectedOption,
                                  onChanged: (value) {
                                    provider.setSelectedOption(value!);
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      Consumer<BookingProvider>(
                        builder: (context, provider, child) {
                          return CustomButton(
                            onTap: () {
                              if (provider.selectedOption == 0) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const OnlinePaymentMethod()),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CashPaymentMethod()),
                                );
                              }
                            },
                            title: AppLocalizations.of(context)!.approveProceed,
                            border: true,
                          );
                        },
                      ),
                      height40,
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
