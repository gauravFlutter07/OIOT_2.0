import '../../../../../imports.dart';

class ScheduledRideTabProvider extends ChangeNotifier {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  void updateTripDate(ScheduledRideModel? trip, DateTime date) {
    if (trip != null) {
      trip.tripDate = "${date.toLocal()}".split(' ')[0];
      notifyListeners();
    }
  }

  void updateTripTime(
      ScheduledRideModel? trip, TimeOfDay time, BuildContext context) {
    if (trip != null) {
      trip.tripTime = time.format(context);
      notifyListeners();
    }
  }
}
