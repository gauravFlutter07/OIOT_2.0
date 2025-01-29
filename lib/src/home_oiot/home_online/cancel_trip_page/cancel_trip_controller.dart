import 'package:get/get.dart';
import 'package:oiot/src/home_oiot/home_online/driver_searching_page/model/ride_request_success_modal.dart';

import '../../../../api/rider_repo.dart';
import '../../../../imports.dart';

class SelectedReasonProvider extends ChangeNotifier {
  String? _selectedReason;

  String? get selectedReason => _selectedReason;

  void setSelectedReason(String reason) {
    _selectedReason = reason;
    notifyListeners();
  }

  void clearSelectedReason() {
    _selectedReason = null;
    notifyListeners();
  }


  Future<void> cancelTrip(context, RideRequestSuccessModal tripData) async {


    var map =  {
      "requestId": tripData.requestDetails??'-'
    };


    try {
      final result = await RiderRepo.cancelTaxi(map);

      if (result is Exception) {
        Fluttertoast.showToast(msg: "Something went wrong");

      } else {
        if (result != null) {


          final pickupProvider = Provider.of<PickupProvider>(context, listen: false);
          pickupProvider.clearSearchDestination();
          pickupProvider.clearSearchPickUp();



          Navigator.pushNamed(context,
              RouteClass.useronlinehome);
          ScaffoldMessenger.of(context)
              .showSnackBar(
            SnackBar(
              content: Text(
                AppLocalizations.of(
                    context)!
                    .yourTripHasBeenCancelledSuccessfully,
                style: const TextStyle(
                    fontSize: 16),
              ),
            ),
          );

        } else {
          Fluttertoast.showToast(msg: 'Something went wrong');

        }
      }
    } on Exception catch (e) {
      e.printError();

    }
  }
}
