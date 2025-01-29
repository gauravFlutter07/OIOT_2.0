import 'package:oiot/src/home_oiot/home_online/service_type/rental_estimated_price/model/rental_estimated_model.dart';
import 'package:oiot/src/home_oiot/home_online/service_type/rental_estimated_price/rental_estimated_service.dart';

import '../../../../../imports.dart';

class RentalEstimateprovider with ChangeNotifier {
  RentalEstimateprovider() {
    fetchChooseARideData();
  }

  RentalEstimatModel? _vehicleTypeInvoiceData;
  RentalEstimatModel? get vehicleTypeInvoiceData => _vehicleTypeInvoiceData;

  String? _selectedVehicleType;
  String? get selectedVehicleType => _selectedVehicleType;

  String? _selectedPackage;
  String? get selectedPackage => _selectedPackage;

  final TextEditingController _couponController = TextEditingController();
  TextEditingController get couponController => _couponController;

  void setSelectedVehicleType(String? vehicleType) {
    _selectedVehicleType = vehicleType;
    notifyListeners();
  }

  void setSelectedPackage(String? package) {
    _selectedPackage = package;
    notifyListeners();
  }

  Future<void> fetchChooseARideData() async {
    RentalEstimatedService rentalEstimatedService = RentalEstimatedService();
    final RentalEstimatModel? result =
        await rentalEstimatedService.fetchRentalInvoiceData();

    if (result != null) {
      _vehicleTypeInvoiceData = result;
      notifyListeners();
    }
  }
}
