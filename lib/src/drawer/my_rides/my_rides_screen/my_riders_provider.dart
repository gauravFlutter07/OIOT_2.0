import 'package:get/get.dart';
import 'package:oiot/src/drawer/my_rides/my_rides_screen/past/model/my_rides_modal.dart';

import '../../../../api/rider_repo.dart';
import '../../../../imports.dart';

class MyRidesProvider extends ChangeNotifier {
  DateTime? startDate;
  DateTime? endDate;
  String selectedOption = 'Past';

  void setDateRange(DateTime? start, DateTime? end) {
    startDate = start;
    endDate = end;
    notifyListeners();
  }

  void setSelectedOption(String option) {
    selectedOption = option;
    notifyListeners();
  }

  void clearDateRange() {
    startDate = null;
    endDate = null;
    notifyListeners();
  }

  getRIdes(String selectedRide) async{

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

          }


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
