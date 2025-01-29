// import '../../../../imports.dart';
// import '../../../../widgets/app_text_widget.dart';

// class WithdrawMoneyScreen extends StatelessWidget {
//   WithdrawMoneyScreen({super.key});
//   final TextEditingController _withdrawAmount = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             children: [
//               const CustomHeader(title: 'Withdraw Money'),
//               Container(
//                 width: double.infinity,
//                 margin: horizontalPadding20,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Image(
//                               image: AssetImage(
//                                   'assets/images/communityLogos/wallet.png')),
//                           Column(
//                             children: [
//                               textWidget(
//                                   'Total Balance',
//                                   pureBlack,
//                                   FontWeight.bold,
//                                   18.0,
//                                   false,
//                                   null,
//                                   0.0,
//                                   00.0,
//                                   0.0,
//                                   0.0),
//                               textWidget(
//                                   '₹ 12000.00',
//                                   Colors.green,
//                                   FontWeight.bold,
//                                   24.0,
//                                   false,
//                                   null,
//                                   0.0,
//                                   00.0,
//                                   0.0,
//                                   0.0),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     textWidget('Amount', pureBlack, FontWeight.bold, 18.0,
//                         false, null, 0.0, 30.0, 0.0, 0.0),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 10.0),
//                       child: CustomTextFormField(
//                           textEditingController: _withdrawAmount,
//                           isPass: false,
//                           hint: 'Enter amount'),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //     builder: (context) => const WithdrawSuccess(),
//                         //   ),
//                         // );
//                       },
//                       child: PaymentOption('assets/images/bank.png',
//                           'Bank Account', 'All India banks'),
//                     ),
//                     PaymentOption('assets/images/upi.png', 'UPI',
//                         'Instant Payment using UPI App'),
//                     const SizedBox(
//                       height: 50,
//                     ),
//                     CustomButton(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const WithdrawSuccess()),
//                         );
//                       },
//                       title: 'Withdraw Money',
//                       border: true,
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     CustomButton(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   const AddBankAccountScreen(),
//                             ));
//                       },
//                       title: 'Add Bank Account',
//                       border: true,
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
