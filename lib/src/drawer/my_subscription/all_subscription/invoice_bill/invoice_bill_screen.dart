import 'package:oiot/widgets/app_text_widget.dart';

import '../../../../../imports.dart';

// ignore: non_constant_identifier_names
final List<String> invoicetopic = <String>[
  'Start date',
  'End date',
  'GST',
  'Profile Id',
  'PAN no.',
  'GST no.',
  'Total Charges',
  'GST (6%)',
  'SGST (6%)',
  'Driver Discount',
  'Conv. Charges',
  'Paid Amount',
  'Promotional discount'
];
// ignore: non_constant_identifier_names
final List<String> invoicedes = <String>[
  '10 Sep, 2022 | 10:30 AM',
  '10 Sep, 2022 | 11:30 AM',
  'AAJCR1234C1ZY',
  'OIOT021',
  'APBV8025C',
  'AVBA1234656',
  '₹ 500.00',
  '+ ₹ 10.00',
  '+ ₹ 10.00',
  '- ₹ 100.00',
  '+ ₹ 200.00',
  '₹ 710.00',
  '₹ 100.00'
];

List<String> options = ['option1', 'option2'];
String currentOption = options[0];

class InvoiceBill extends StatefulWidget {
  const InvoiceBill({super.key});

  @override
  State<InvoiceBill> createState() => _InvoiceBillState();
}

class _InvoiceBillState extends State<InvoiceBill> {
  Future<void> shareFunction() async {
    await FlutterShare.share(
      title: 'Share via',
      text: 'Sharing oiot invoice',
      chooserTitle: 'Share via',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assetst/logo.png',
                        scale: 10,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const CustomHeader(title: ''),
                          textWidget('INVOICE', darkMediumGrey, FontWeight.w500,
                              20.0, false, null, 0.0, 0.0, 0.0, 0.0),
                          textWidget('ID OIOT 00011', textGrey, FontWeight.w500,
                              18.0, false, null, 10.0, 0.0, 0.0, 0.0),
                        ],
                      ),
                      customRow(
                        invoicetopic[0],
                        invoicedes[0],
                        textGrey,
                        textGrey,
                        FontWeight.w500,
                        FontWeight.w300,
                        16.0,
                        15.0,
                      ),
                      customRow(
                        invoicetopic[1],
                        invoicedes[1],
                        textGrey,
                        textGrey,
                        FontWeight.w500,
                        FontWeight.w300,
                        16.0,
                        15.0,
                      ),
                      customRow(
                        invoicetopic[2],
                        invoicedes[2],
                        textGrey,
                        textGrey,
                        FontWeight.w500,
                        FontWeight.w300,
                        16.0,
                        15.0,
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 20.0),
                        color: lightGrey,
                        child: Column(
                          children: [
                            textWidget(
                                'Amount Paid',
                                pureBlack,
                                FontWeight.w600,
                                18.0,
                                false,
                                null,
                                0.0,
                                10.0,
                                0.0,
                                0.0),
                            textWidget(
                                '₹ 710.00',
                                Colors.green,
                                FontWeight.w600,
                                30.0,
                                false,
                                null,
                                0.0,
                                10.0,
                                0.0,
                                0.0),
                            textWidget(
                              'Monthly Package 007',
                              textBlack,
                              FontWeight.w300,
                              14.0,
                              false,
                              null,
                              0.0,
                              10.0,
                              0.0,
                              10.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          color: lightGrey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Image(
                                image: AssetImage('assetst/girl_dp.png'),
                                height: 50.0,
                                width: 50.0,
                              ),
                              textWidget(
                                'Sruthy Agarval',
                                pureBlack,
                                FontWeight.bold,
                                16.0,
                                false,
                                null,
                                20.0,
                                0.0,
                                0.0,
                                0.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      customRow(
                        invoicetopic[3],
                        invoicedes[3],
                        textGrey,
                        deepMediumGrey,
                        FontWeight.w500,
                        FontWeight.w500,
                        16.0,
                        15.0,
                      ),
                      customRow(
                        invoicetopic[4],
                        invoicedes[4],
                        textGrey,
                        deepMediumGrey,
                        FontWeight.w500,
                        FontWeight.w500,
                        16.0,
                        15.0,
                      ),
                      customRow(
                        invoicetopic[5],
                        invoicedes[5],
                        textGrey,
                        deepMediumGrey,
                        FontWeight.w500,
                        FontWeight.w500,
                        16.0,
                        15.0,
                      ),
                      customRow(
                        invoicetopic[6],
                        invoicedes[6],
                        textGrey,
                        deepMediumGrey,
                        FontWeight.w500,
                        FontWeight.w500,
                        16.0,
                        15.0,
                      ),
                      customRow(
                        invoicetopic[7],
                        invoicedes[7],
                        textGrey,
                        deepMediumGrey,
                        FontWeight.w500,
                        FontWeight.w500,
                        16.0,
                        15.0,
                      ),
                      customRow(
                        invoicetopic[8],
                        invoicedes[8],
                        Colors.black,
                        deepMediumGrey,
                        FontWeight.w500,
                        FontWeight.w500,
                        16.0,
                        15.0,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: lightGrey,
                        width: double.infinity,
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            customRow(
                              invoicetopic[9],
                              invoicedes[9],
                              textGrey,
                              deepMediumGrey,
                              FontWeight.w700,
                              FontWeight.w500,
                              16.0,
                              15.0,
                            ),
                            customRow(
                              invoicetopic[10],
                              invoicedes[10],
                              textGrey,
                              deepMediumGrey,
                              FontWeight.w500,
                              FontWeight.w500,
                              16.0,
                              15.0,
                            ),
                            customRow(
                              invoicetopic[11],
                              invoicedes[11],
                              textGrey,
                              deepMediumGrey,
                              FontWeight.w500,
                              FontWeight.w500,
                              16.0,
                              15.0,
                            ),
                            customRow(
                              invoicetopic[12],
                              invoicedes[12],
                              textGrey,
                              deepMediumGrey,
                              FontWeight.w500,
                              FontWeight.w500,
                              16.0,
                              15.0,
                            ),
                          ],
                        ),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Expanded(
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Radio(
                      //             value: options[0],
                      //             groupValue: currentOption,
                      //             activeColor: Colors.black,
                      //             onChanged: (value) {
                      //               setState(() {
                      //                 currentOption = value.toString();
                      //               });
                      //             },
                      //           ),
                      //           Expanded(
                      //             child: textWidget(
                      //                 'Wallet',
                      //                 pureBlack,
                      //                 FontWeight.bold,
                      //                 16.0,
                      //                 false,
                      //                 null,
                      //                 0.0,
                      //                 0.0,
                      //                 0.0,
                      //                 0.0),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //     Expanded(
                      //       child: Row(
                      //         children: [
                      //           Radio(
                      //             value: options[1],
                      //             groupValue: currentOption,
                      //             activeColor: Colors.black,
                      //             onChanged: (value) {
                      //               setState(() {
                      //                 currentOption = value.toString();
                      //               });
                      //             },
                      //           ),
                      //           Expanded(
                      //             child: textWidget(
                      //                 'Bank',
                      //                 pureBlack,
                      //                 FontWeight.bold,
                      //                 16.0,
                      //                 false,
                      //                 null,
                      //                 0.0,
                      //                 0.0,
                      //                 0.0,
                      //                 0.0),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextButton(
                            text: 'Download',
                            color: blueMain,
                            callBack: () {},
                            textColor: Colors.white,
                            border: 0.0,
                            borderColor: Colors.transparent,
                            fontSize: 16.0,
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                backgroundColor: blueMain,
                              ),
                              onPressed: () {
                                shareFunction();
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.share_outlined,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  customTextWidget(
                                    text: "Share Invoice",
                                    size: 16.0,
                                    color: Colors.white,
                                    weight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // ignore: deprecated_member_use
                            backgroundColor: Colors.amber,
                            elevation: 0,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                          onPressed: () {},
                          child: textWidget(
                              'User Feedback',
                              pureBlack,
                              FontWeight.bold,
                              16.0,
                              false,
                              null,
                              0.0,
                              0.0,
                              0.0,
                              0.0),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget customRow(
  title,
  desc,
  tcolor,
  dcolor,
  tw,
  dw,
  ts,
  ds,
) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      textWidget(title, tcolor, tw, ts, false, null, 0.0, 10.0, 0.0, 0.0),
      textWidget(desc, dcolor, dw, ds, false, null, 0.0, 10.0, 0.0, 0.0)
    ],
  );
}
