// import '../../../../../../imports.dart';

// class UpcomingTabScreen extends StatelessWidget {
//   const UpcomingTabScreen({super.key});

  // Future<void> shareFunction() async {
  //   await FlutterShare.share(
  //     title: 'Share via',
  //     text: 'Thank you for sharing oiot',
  //     chooserTitle: 'Share via',
  //   );
  // }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         child: Image.asset(avtarDp),
//                       ),
//                       title: const Text(
//                         'Swaminathan Swami',
//                         style: TextStyle(fontWeight: FontWeight.w500),
//                       ),
//                       subtitle: const Text('⭐ 4.5 Since 2019'),
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: darkWhiteBackground,
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           Text(
//                             '6',
//                             style: TextStyle(
//                               color: darkBlack,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 18,
//                             ),
//                           ),
//                           Text(
//                             'minutes',
//                             style: TextStyle(color: textGrey, fontSize: 12),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Card(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           child: Image.asset(swiftDzire),
//                         ),
//                         title: const Text(
//                           'Swift Dzire',
//                           style: TextStyle(fontWeight: FontWeight.w500),
//                         ),
//                         subtitle: const Text('AP 25 DC 2345'),
//                       ),
//                     ),
//                     Column(
//                       children: [
//                         Text(
//                           '₹ 200.00',
//                           style: TextStyle(
//                               color: darkBlack,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 16),
//                         ),
//                         Text(
//                           'Condition apply',
//                           style: TextStyle(color: textGrey, fontSize: 12),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Container(
//                 height: 2,
//                 width: double.infinity,
//                 color: backgroundGrey,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundColor: darkWhiteBackground,
//                         child: Icon(
//                           Icons.location_on,
//                           color: blueMain,
//                         ),
//                       ),
//                       title: Text(
//                         'Pickup Location',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w300,
//                             color: textGrey,
//                             fontSize: 16),
//                       ),
//                       subtitle: Text(
//                         '37-10, 11, Lorem ipsum',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: darkBlack,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: darkWhiteBackground,
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Column(
//                           children: [
//                             Image.asset(
//                               clockOutlineLogo,
//                               height: 25,
//                               width: 25,
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             Text(
//                               '36 mins',
//                               style: TextStyle(
//                                 color: textDarkGrey,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Image.asset(
//                               rupeeLogo,
//                               height: 25,
//                               width: 25,
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             Text(
//                               '₹ 200',
//                               style: TextStyle(
//                                 color: blueMain,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Image.asset(
//                               steeringWheel,
//                               height: 25,
//                               width: 25,
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             Text(
//                               '12 Km',
//                               style: TextStyle(
//                                 color: textBlack,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 15.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: blueMain.withOpacity(0.2),
//                       child: Icon(
//                         Icons.email,
//                         color: blueMain,
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         shareFunction();
//                       },
//                       child: CircleAvatar(
//                         backgroundColor: blueMain.withOpacity(0.2),
//                         child: Icon(
//                           Icons.share_outlined,
//                           color: blueMain,
//                         ),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const SosPage(),
//                             ));
//                       },
//                       child: Image.asset(
//                         sos,
//                         height: 40,
//                         width: 40,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               height40,
//               Row(
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const TripID(),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(5),
//                         border: Border.all(
//                           color: const Color(0xFFa8a8a8),
//                           width: 1.5,
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 7.5, horizontal: 25),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Image.asset(
//                               call,
//                               height: 32,
//                               width: 33,
//                             ),
//                             const SizedBox(
//                               width: 7,
//                             ),
//                             const Text(
//                               'Call Driver',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 25),
//                       child: CustomButton(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => RaiseNewTicket(),
//                             ),
//                           );
//                         },
//                         title: 'Support',
//                         border: true,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               height15,
//               CustomButtonOnlyBorder(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const ReasonsForCancel(),
//                     ),
//                   );
//                 },
//                 title: 'Cancel Ride',
//                 border: true,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
