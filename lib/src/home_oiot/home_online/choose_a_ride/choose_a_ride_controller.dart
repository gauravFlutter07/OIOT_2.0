import 'dart:developer';

import 'package:get/get.dart';
import 'package:oiot/models/basic_fare_modal.dart' show VehicleCategory, BasicFareModal;

import '../../../../api/rider_repo.dart';
import '../../../../imports.dart';
import '../../../../models/basic_fare_modal.dart' show VehicleCategory;
import 'model/estimated_fare_modal.dart';

class ChooseARideProvider extends ChangeNotifier {


  ChooseARideInvoiceModel? _vehicleTypeInvoiceData;
  ChooseARideInvoiceModel? get vehicleTypeInvoiceData =>
      _vehicleTypeInvoiceData;

  int _selectedContainer = 1;
  int get selectedContainer => _selectedContainer;

  String? _selectedVehicleType; // Track selected vehicle type
  String? get selectedVehicleType => _selectedVehicleType;

  final TextEditingController _couponController = TextEditingController();
  TextEditingController get couponController => _couponController;

  VehicleCategory? _selectedVehicle;
  VehicleCategory? get selectedVehicle => _selectedVehicle;

  void updateSelectedContainer(VehicleCategory selectedModal, BasicFareModal basicFareModal) {
    // _selectedContainer = containerIndex;

    basicFareModal.vehicleCategories?.where((veh)=>veh.isSelected=false).toList();
    selectedModal.isSelected = !selectedModal.isSelected!;

    _selectedVehicle = selectedModal.isSelected == true ? selectedModal : null;
    notifyListeners();
  }


  Future<void> getEstimation(BuildContext context, VehicleCategory modal) async {
    _selectedVehicle = modal;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            HatchbackEstimatePrice(estimatedFareModal: modal),
      ),
    );
  }

  Future<void> postCouponAndVehicleData(
    BuildContext context,
    String couponId, PickUpModel pickupModal,
  ) async {

    try {
      var map = {
        "discountAmt": 0,
        "promoCode": couponId,
        "userId": "",
        "pickupLat": pickupModal.pickUpLatLng.latitude,
        "pickupLng": pickupModal.pickUpLatLng.longitude,
        "tripType": "daily",
        "tripAmount": 0
      };

      final result = await RiderRepo.applyPromoCode(map);

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
}
