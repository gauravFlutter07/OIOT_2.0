import 'package:oiot/models/basic_fare_modal.dart';
import 'package:oiot/src/home_oiot/home_online/driver_searching_animation/oscilating_progress_indicator.dart';
import '../../../../imports.dart';

class DriverSearchingAnimation extends StatelessWidget {
  final VehicleCategory vehicleModal;
  const DriverSearchingAnimation({super.key, required this.vehicleModal,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(mapBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: whiteColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height40,
                      Text(
                        AppLocalizations.of(context)!
                            .findingACleanAndSafeCabNearby,
                        style: tsLargeBold,
                      ),
                      height50,
                       OscillatingProgressIndicator(vehicleModal: vehicleModal),
                      height40,
                      CustomButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserOnlineHome(),
                            ),
                          );
                        },
                        title: AppLocalizations.of(context)!.cancelRideRequest,
                        border: true,
                      ),
                      height80
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
