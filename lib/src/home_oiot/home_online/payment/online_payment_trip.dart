import 'package:oiot/src/home_oiot/home_online/widgets/payment_method_container.dart';
import 'package:oiot/src/home_oiot/home_online/service_type/widgets/please_wait.dart';
import 'package:oiot/src/home_oiot/home_online/final_invoice/booking_invoice_screen.dart';
import '../../../../imports.dart';

class OnlinePaymentMethod extends StatefulWidget {
  const OnlinePaymentMethod({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnlinePaymentMethodState createState() => _OnlinePaymentMethodState();
}

class _OnlinePaymentMethodState extends State<OnlinePaymentMethod> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedContainer = 1;

  void navigateToPleaseWait() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PleaseWait(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerScreen(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(mapBackground),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(12.0),
              //   child: RideHeader(
              //     scaffoldKey: _scaffoldKey,
              //   ),
              // ),
              const Spacer(),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Text(
                        AppLocalizations.of(context)!.paymentMethod,
                        style: TextStyle(
                          color: darkBlack,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.totalAmount,
                            style: TextStyle(
                              color: textBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '₹ 200.00',
                            style: TextStyle(
                              color: textBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      PaymentMethodContainer(
                        imagePath: wallet,
                        type: AppLocalizations.of(context)!.myWallet,
                        isActive: selectedContainer == 1,
                        callback: () {
                          setState(() {
                            selectedContainer = 1;
                          });
                        },
                        isWallet: true,
                      ),
                      const SizedBox(height: 15),
                      // PaymentMethodContainer(
                      //   imagePath: cash,
                      //   type: 'Pay Cash',
                      //   isActive: selectedContainer == 2,
                      //   callback: () {
                      //     setState(() {
                      //       selectedContainer = 2;
                      //     });
                      //   },
                      //   isWallet: false,
                      // ),
                      const SizedBox(height: 15),
                      PaymentMethodContainer(
                        imagePath: upi,
                        type: AppLocalizations.of(context)!.upiOrNetBanking,
                        isActive: selectedContainer == 3,
                        callback: () {
                          setState(() {
                            selectedContainer = 3;
                          });
                        },
                        isWallet: false,
                      ),
                      const SizedBox(height: 15),
                      PaymentMethodContainer(
                        imagePath: debitCard,
                        type: AppLocalizations.of(context)!.debitCreditCard,
                        isActive: selectedContainer == 4,
                        callback: () {
                          setState(() {
                            selectedContainer = 4;
                          });
                        },
                        isWallet: false,
                      ),
                      const SizedBox(height: 15),
                      CustomButton(
                          onTap: () {
                            navigateToPleaseWait();
                          },
                          title: AppLocalizations.of(context)!.ok,
                          border: true),
                      CustomButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const BookingInvoiceOnline(),
                            ),
                          );
                        },
                        title: AppLocalizations.of(context)!.cancel,
                        optionalColor: Colors.transparent,
                        border: true,
                        optionalTextColor: textBlack,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
