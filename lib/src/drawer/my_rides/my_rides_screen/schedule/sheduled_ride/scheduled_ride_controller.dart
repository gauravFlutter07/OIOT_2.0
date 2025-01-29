import 'package:get/get.dart';
import 'package:oiot/src/drawer/my_rides/my_rides_screen/my_rides.dart';

import '../../../../../../api/rider_repo.dart';
import '../../../../../../imports.dart';
import '../../past/model/my_rides_modal.dart';

class ScheduledRideProvider extends ChangeNotifier {
  List<ScheduledRideModel?> _scheduledTrip = [];
  List<ScheduledRideModel?> get scheduledTrip => _scheduledTrip;

  List<MyRIdesModal>? _trips;
  List<MyRIdesModal>? get trips => _trips;

  ScheduledRideProvider() {

    getScheduledRide();
  }

  Future<void> fetchscheduledTripDatas() async {
    ScheduledRideService scheduledRideService = ScheduledRideService();

    final List<ScheduledRideModel>? result =
        await scheduledRideService.fetchScheduledTripDetails();

    if (result != null) {
      _scheduledTrip = result;
      notifyListeners();
    }
  }

  Future<void> getScheduledRide() async{

    try {
      var map = {

      };



      final result = await RiderRepo.getPastTripHistory(map);

      if(result is Exception){
        Fluttertoast.showToast(msg: "Something went wrong");

      }else{
        if(result !=null){

          var data = myRIdesModalFromMap(jsonEncode(result));

          if(data.isNotEmpty){
            _trips = data;
          }else{
            _trips = List.empty();
          }

          print("trip lenth :- ${trips?.length??0  }");
          notifyListeners();
        }else{
          Fluttertoast.showToast(msg: 'Something went wrong');

        }
      }
    } on Exception catch (e) {
      e.printError();
      Fluttertoast.showToast(msg: 'Something went wrong');
    }

  }



}
