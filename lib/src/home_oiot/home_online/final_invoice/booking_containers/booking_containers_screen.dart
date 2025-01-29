// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:oiot/elements/const_height_width.dart';
import 'package:oiot/elements/images.dart';

import 'package:oiot/src/home_oiot/home_online/final_invoice/booking_invoice_controller.dart';
import 'package:oiot/src/home_oiot/home_online/final_invoice/model/final_invoice_model.dart';
import 'package:provider/provider.dart';

class Container1 extends StatelessWidget {
  final bool expanded;

  const Container1({
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
                          'Business - Jain Travel - 0505',
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
                        title: Text(
                          bookingInvoiceData?.driverName ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          '⭐ ${bookingInvoiceData?.driverRating ?? ''}',
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
                            bookingInvoiceData?.profileId ?? '',
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
                          Text(
                            bookingInvoiceData?.vehicleRegNo ?? '',
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
                          Text(
                            bookingInvoiceData?.vehicleType ?? '',
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
                          Text(
                            bookingInvoiceData?.seatingCapacity ?? '',
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
                          Text(
                            bookingInvoiceData?.vehicleColor ?? '',
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
                          Text(
                            bookingInvoiceData?.panNo ?? '',
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
                          Text(
                            bookingInvoiceData?.gstNo ?? '',
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
class Container2 extends StatelessWidget {
  late bool expanded;
  Container2({
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
                          Text(
                            bookingInvoiceData?.modeofBooking ?? '',
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
                            'From',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Text(
                            bookingInvoiceData?.pickUpLocation ?? '',
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
                            'To',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Text(
                            bookingInvoiceData?.dropLocation ?? '',
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
                            'Service type',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Text(
                            bookingInvoiceData?.serviceType ?? '',
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
                          Text(
                            bookingInvoiceData?.package ?? '',
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
                          Text(
                            bookingInvoiceData?.basePrice ?? '',
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
                          Text(
                            bookingInvoiceData?.extraKm ?? '',
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
                          Text(
                            bookingInvoiceData?.extraTime ?? '',
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
                          Text(
                            bookingInvoiceData?.totalDistance ?? '',
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
                          Text(
                            bookingInvoiceData?.totalRidingTime ?? '',
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
                          Text(
                            bookingInvoiceData?.dayBata ?? '',
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
                          Text(
                            bookingInvoiceData?.nightBata ?? '',
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
class Container3 extends StatelessWidget {
  late bool expanded;
  Container3({
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
                          Text(
                            bookingInvoiceData?.customerId ?? '',
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
                              child: Text(
                                bookingInvoiceData?.customerPan ?? '',
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
                              child: Text(
                                bookingInvoiceData?.customerGst ?? '',
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
                          Text(
                            'Customer Address',
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
                              child: Text(
                                bookingInvoiceData?.customerAdress ?? '',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFFa8a8a8),
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
