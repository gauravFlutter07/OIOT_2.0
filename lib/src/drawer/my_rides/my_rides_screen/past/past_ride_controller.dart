import 'package:get/get.dart';

import '../../../../../api/rider_repo.dart';
import '../../../../../imports.dart';
import 'model/my_rides_modal.dart';

class PastRideProvider extends ChangeNotifier {


  List<MyRIdesModal>? _trips;
  List<MyRIdesModal>? get trips => _trips;

  PastRideProvider() {
    // fetchPastTripDatas();
    getRides();
  }

  Future<void> fetchPastTripDatas() async {
  /*  PastTripServices pastTripServices = PastTripServices();

    final List<PastTripModel>? result =
        await pastTripServices.fetchPastTripDetails();

    if (result != null) {
      _pastTrip = result;
      notifyListeners();
    }*/

    try {


      final result = await RiderRepo.getPastTripHistory(null);

      if(result is Exception){
        Fluttertoast.showToast(msg: "Something went wrong");

      }else{
        if(result !=null){

          // var data = basicFareModalFromMap(jsonEncode(result));

        }else{
          Fluttertoast.showToast(msg: 'Something went wrong');

        }
      }
    } on Exception catch (e) {
      e.printError();
      Fluttertoast.showToast(msg: 'Something went wrong');
    }


  }

  Future<void> getRides() async{

    try {
      var map = {
        "_page":1,
        "_limit":1
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
