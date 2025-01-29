import 'package:get/get.dart';
import 'package:oiot/models/basic_fare_modal.dart';
import 'package:oiot/src/home_oiot/home_online/driver_searching_page/driver_searching_screen.dart';

import '../../../../api/rider_repo.dart';
import '../../../../imports.dart';
import '../driver_searching_page/model/searched_driver_list_modal.dart';

class OscillatingProgressIndicator extends StatefulWidget {
  final Duration duration;
  final VehicleCategory vehicleModal;

  const OscillatingProgressIndicator( {
    super.key,
    this.duration = const Duration(seconds: 1), required this.vehicleModal,
  });

  @override

  // ignore: library_private_types_in_public_api
  _OscillatingProgressIndicatorState createState() =>
      _OscillatingProgressIndicatorState();
}

class _OscillatingProgressIndicatorState extends State<OscillatingProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);

    fetchDrivers(context, widget.vehicleModal);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DriverReachedScreen(),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: AnimatedContainer(
              duration: const Duration(
                microseconds: 200,
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: LinearProgressIndicator(
                  minHeight: 8,
                  backgroundColor: darkWhiteBackground,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color.lerp(blueMain, blueMain.withOpacity(0.8),
                        _controller.value)!,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<List<Driver>?> fetchDrivers(BuildContext context,  VehicleCategory vehicleModal ) async{

    final PickupProvider pickupProvider = context.read<PickupProvider>();

    try {
      var map = {
        "serviceName": vehicleModal.type,
        "pickupLat": pickupProvider.pickUpModel?.pickUpLatLng.latitude,
        "pickupLng": pickupProvider.pickUpModel?.pickUpLatLng.longitude,
        "triptype": vehicleModal.tripTypeCode
      };

      final result = await RiderRepo.searchDrivers(map);

      if(result is Exception){
        Fluttertoast.showToast(msg: "Something went wrong");
        return [];
      }else{
        if(result !=null){

          var data = rideBookNowModalFromMap(jsonEncode(result));

          if(data.drivers?.isNotEmpty??false){

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>  DriverSearchingPage(drivers: data.drivers!,vehicleCategoryModal:vehicleModal),
              ),
            );

          }else{
            return [];
          }

        }else{
          Fluttertoast.showToast(msg: 'Something went wrong');
          return [];
        }
      }
    } on Exception catch (e) {
      e.printError();
      Fluttertoast.showToast(msg: 'Something went wrong');
      return [];
    }
    return null;

  }

}
