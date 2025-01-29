import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../api/rider_repo.dart';
import '../../../../imports.dart';
import '../service_type/pick_up/model/outstation_taxi_list_modal.dart';

class EstimatePriceController extends ChangeNotifier {

  VehicleList? selectedVehicle;


  int selectedContainer = 1;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> bookRIde(BuildContext context) async {


    var provider = context.read<PickupProvider>();
    var modal =  provider.pickUpModel;


    var map = {
    "serviceType": selectedVehicle?.type??'',
    "vehicleTypeId": selectedVehicle?.id,
    "dropAddress": selectedVehicle?.dropLocation??'',
    "returnDay": "",
    "distanceDetails": "",
    "promo": "",
    "outstationType": "oneway",
    "bookingType": "rideLater",
    "pickupLat": modal?.pickUpLatLng.latitude,
    "pickupLng": modal?.pickUpLatLng.longitude,
    "dropLng": modal?.dropLatLng.longitude,
    "dropLat": modal?.dropLatLng.latitude,
    "serviceTypeId": 2,
    "requestFrom": "app",
    "tripTime": "",
    "paymentMode": "",
    "utc": "GMT+05:30",
    "startDay": "${DateFormat('dd MMM yyyy').format(provider.selectedStartDate)}, ${provider.selectedStartTime.format(context)}",
    "vehicleDetailsAndFare": "",
    "tripType": "outstation",
    "vehicleTypeCode": selectedVehicle?.tripTypeCode,
    "pickupCity": selectedVehicle?.scity,
    "pickupAddress": selectedVehicle?.pickupLocation??'',
    "tripDate": "",
    "serviceid": 2,
    "timeFare": ""
    };


    try {
      final result = await RiderRepo.bookOutstationTaxi(map);

      if (result is Exception) {
        Fluttertoast.showToast(msg: result.toString());
      } else {
        if (result != null) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const UserOnlineHome(),
              ),
              (route) => route.isFirst);
          Fluttertoast.showToast(msg: result['message']);
        } else {
          Fluttertoast.showToast(msg: 'Something went wrong');

        }
      }
    } on Exception catch (e) {
      e.printError();

    }


  }


}
