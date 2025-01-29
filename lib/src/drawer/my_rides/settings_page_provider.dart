// import 'package:flutter/material.dart';

// class SettingPageProvider with ChangeNotifier {
//   bool onGoing = false;
//   bool past = false;
//   bool cancelled = false;
//   bool schedule = false;

//   void changeOngoing() {
//     onGoing = !onGoing;
//     if (onGoing == true) {
//       past = false;
//       cancelled = false;
//       schedule = false;
//     }
//     notifyListeners();
//   }

//   void changePast() {
//     past = !past;
//     if (past == true) {
//       onGoing = false;
//       cancelled = false;
//       schedule = false;
//     }
//     notifyListeners();
//   }

//   void changeCancelled() {
//     cancelled = !cancelled;
//     if (cancelled == true) {
//       past = false;
//       onGoing = false;
//       schedule = false;
//     }
//     notifyListeners();
//   }

//   void changeSchedule() {
//     schedule = !schedule;
//     if (schedule == true) {
//       past = false;
//       cancelled = false;
//       onGoing = false;
//     }
//     notifyListeners();
//   }
// }
