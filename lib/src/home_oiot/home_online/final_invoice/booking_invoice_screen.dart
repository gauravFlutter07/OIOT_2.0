import 'package:firebase_database/firebase_database.dart';
import 'package:oiot/main.dart';

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
                  BookingInvoiceModel? bookingInvoiceData = provider.bookingInvoiceModel;
                  final databaseRef = FirebaseDatabase.instance.ref().child('trips_data').child(localStorageService.tripId.toString());

                  return StreamBuilder(
                      stream: databaseRef.onValue,
                      builder: (context, snapshot) {

                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if (!snapshot.hasData || snapshot.data?.snapshot.value == null) {
                          return const Center(child: Text('No data available'));
                        }

                        Map data = snapshot.data!.snapshot.value! as Map;
                        // final databaseRef1 = FirebaseDatabase.instance.ref().child('drivers_data').child('675bc17adc204501cd6fb2e3');

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
                                ' NA',
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
                                'NA',
                                style: tsRegularBoldGrey,
                              ),
                            ],
                          ),
                          height20,
                          /*Row(
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
                          ),*/
                          // height20,
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
                                  Text("₹${data['total_fare']?? 'NA'}",
                                    style: tsExtraLargeBold,
                                  ),
                                  height05,
                                  Text(
                                    '${AppLocalizations.of(context)!.bookingId} - NA}',
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
                                  BusinessContainer(
                                      expanded: provider.isContainer1Expanded, data),
                                  height15,
                                  TripContainer(
                                      expanded: provider.isContainer3Expanded, data),
                                  height15,
                                  RiderContainer(
                                      expanded: provider.isContainer2Expanded, data),
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
                                      Text("₹${data['basefare']?? 'NA'}",
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
                                      Text("₹${data['taxcgst']?? 'NA'}",
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

                                      Text("₹${data['taxsgst']?? 'NA'}",
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
                                      Text("₹${data['taxsgst']?? 'NA'}",
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
                                      Text("₹${data['convance_fare']?? 'NA'}",
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
                                      Text("₹${data['total_fare']?? 'NA'}",
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
                                              CashPaymentMethod(data: data,)),
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
                    }
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


class BusinessContainer extends StatelessWidget {
  final bool expanded;
  final Map data;

  const BusinessContainer( this.data, {
    required this.expanded,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        BookingInvoiceModel? bookingInvoiceData = provider.bookingInvoiceModel;
        return Container(
          decoration: BoxDecoration(
            color: Color(0xfff3f3f3),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: (provider.isContainer1Expanded)
                      ? Color(0xFF242a38)
                      : Color(0xfff3f3f3),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    topLeft: Radius.circular(5),
                  ),
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Business - ${data!['driverbussinessname']??'NA'}',
                          style: TextStyle(
                            color: (provider.isContainer1Expanded)
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: provider.isContainer1Expanded
                            ? Icon(
                          Icons.keyboard_arrow_up,
                          size: 35,
                          color: (provider.isContainer1Expanded)
                              ? Colors.white
                              : Colors.black,
                        )
                            : Icon(
                          Icons.keyboard_arrow_down,
                          size: 35,
                          color: (provider.isContainer1Expanded)
                              ? Colors.white
                              : Colors.black,
                        ),
                        onPressed: () {
                          provider.toggleContainer1State();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              if (provider.isContainer1Expanded)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      ListTile(
                        leading: Image.asset(manDp),
                        title:
                        Text("${data['drivername']?? 'NA'}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          '⭐ ${data['driver_rating'] ?? ''}',
                          style: TextStyle(
                            color: Color(0xFF676767),
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Profile Id',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Text(
                            "NA",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFa8a8a8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Vehicle Reg. No.',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Text("${data['drivervehicleNumber']?? 'NA'}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFa8a8a8),
                            ),
                          ),
                        ],
                      ),
                      height10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Vehicle Type',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Text("${data['drivervehicletype']?? 'NA'}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFa8a8a8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Seating Capacity',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Text("${data['seating']?? 'NA'}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFa8a8a8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Vehicle color',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Text("${data['color']?? 'NA'}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFa8a8a8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'PAN No.',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Text("${data['driverpancardNo']?? 'NA'}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFa8a8a8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'GST No.',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Text("${data['drivergstNo']?? 'NA'}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFa8a8a8),
                            ),
                          ),
                        ],
                      ),
                      height10,
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class TripContainer extends StatelessWidget {
  late bool expanded;
  final Map data;
  TripContainer(this.data,{
    super.key,
    required this.expanded,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookingProvider>(context);
    BookingInvoiceModel? bookingInvoiceData = provider.bookingInvoiceModel;
    return Consumer<BookingProvider>(
      builder: (BuildContext context, BookingProvider value, Widget? child) {
        return Container(
          decoration: BoxDecoration(
            color: Color(0xfff3f3f3),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: provider.isContainer2Expanded
                      ? Color(0xFF242a38)
                      : Color(0xfff3f3f3),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    topLeft: Radius.circular(5),
                  ),
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Trip Details',
                          style: TextStyle(
                            color: provider.isContainer2Expanded
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: provider.isContainer2Expanded
                            ? Icon(
                          Icons.keyboard_arrow_up,
                          size: 35,
                          color: provider.isContainer2Expanded
                              ? Colors.white
                              : Colors.black,
                        )
                            : Icon(
                          Icons.keyboard_arrow_down,
                          size: 35,
                          color: provider.isContainer2Expanded
                              ? Colors.white
                              : Colors.black,
                        ),
                        onPressed: () {
                          provider.toggleContainer2State();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              if (provider.isContainer2Expanded)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mode of Booking',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Text("${data['modeOfBook']?? 'NA'}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFa8a8a8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'From',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                          ),
                          Expanded(
                            child: Text("${data['pickup_address']?? 'NA'}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFa8a8a8),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'To',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                          ),
                          Expanded(
                            child: Text("${data['Drop_address']?? 'NA'}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFa8a8a8),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Service type',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Text("${data['triptype']?? 'NA'}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFa8a8a8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Package:',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),

        Text("${data['package']?? 'NA'}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFa8a8a8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Base price(min):',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
        Text("${data['basefare']?? 'NA'}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFa8a8a8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Extra Km(for daily)',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
        Text("${data['extraKM']?? 'NA'}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFa8a8a8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Extra time(min hrs per day)',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Text("${data['extraTime']?? 'NA'}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFa8a8a8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total distance',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Text("${data['distance']?? 'NA'}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFa8a8a8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total riding time',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Text("${data['totalTime']?? 'NA'}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFa8a8a8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total bata count',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Text(
                            bookingInvoiceData?.totalBataCount ?? '',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFa8a8a8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Day bata 6am to 9pm',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Text("${data['dayFare']?? 'NA'}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFa8a8a8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Night bata 9pm to 6am',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Text("${data['nightFare']?? 'NA'}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFa8a8a8),
                            ),
                          ),
                        ],
                      ),
                      height10,
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class RiderContainer extends StatelessWidget {
  late bool expanded;
  final Map data;
  RiderContainer(this.data,{
    super.key,
    required this.expanded,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookingProvider>(context);

    return Consumer<BookingProvider>(
      builder: (BuildContext context, BookingProvider value, Widget? child) {
        BookingInvoiceModel? bookingInvoiceData = provider.bookingInvoiceModel;
        return Container(
          decoration: BoxDecoration(
            color: Color(0xfff3f3f3),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: provider.container3state
                      ? Color(0xFF242a38)
                      : Color(0xfff3f3f3),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    topLeft: Radius.circular(5),
                  ),
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Rider Profile',
                          style: TextStyle(
                            color: provider.container3state
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: provider.container3state
                            ? Icon(
                          Icons.keyboard_arrow_up,
                          size: 35,
                          color: provider.container3state
                              ? Colors.white
                              : Colors.black,
                        )
                            : Icon(
                          Icons.keyboard_arrow_down,
                          size: 35,
                          color: provider.container3state
                              ? Colors.white
                              : Colors.black,
                        ),
                        onPressed: () {
                          provider.toggleContainer3State();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              if (provider.container3state)
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Customer name/ID',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Text("${data['custName']?? 'NA'}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFa8a8a8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Customer PAN',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 8),
                              child: Text("${data['custPan']?? 'NA'}",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFFa8a8a8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Customer GST',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 8),
                              child: Text("${data['custPan']?? 'NA'}",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFFa8a8a8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      height10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Customer Address',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 8),
                                child: Text("${data['Drop_address']?? 'NA'}",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFFa8a8a8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
