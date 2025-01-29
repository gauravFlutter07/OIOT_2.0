
import '../../../../imports.dart';
import '../../../../models/basic_fare_modal.dart';

class ChooseARide extends StatelessWidget {
  final PickUpModel pickupModal;
  final BasicFareModal basicFareModal;
  const ChooseARide({super.key, required this.pickupModal, required this.basicFareModal});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChooseARideProvider(),
      child:  _ChooseARideContent(pickupModal, basicFareModal),
    );
  }
}

class _ChooseARideContent extends StatelessWidget {
  final PickUpModel pickupModal;
  final BasicFareModal basicFareModal;
  const _ChooseARideContent( this.pickupModal, this.basicFareModal);

  @override
  Widget build(BuildContext context) {
    final chooseARideProvider = Provider.of<ChooseARideProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Consumer<ChooseARideProvider>(
          builder: (BuildContext context, provider, Widget? child) {
            ChooseARideInvoiceModel? chooseARideData = provider.vehicleTypeInvoiceData;

            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(mapBackground),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(12.0),
                    //   child: RideHeader(
                    //     scaffoldKey: GlobalKey<ScaffoldState>(),
                    //   ),
                    // ),
                    height300,
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: whiteColor,
                      ),
                      child: Padding(
                        padding: horizontalPadding10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            height20,
                            Padding(
                              padding: leftPadding05,
                              child: Text(
                                AppLocalizations.of(context)!.chooseARide,
                                style: tsLargeBold,
                              ),
                            ),
                            height15,

                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: basicFareModal.vehicleCategories?.length??0,
                              itemBuilder: (BuildContext context, int index) {

                                var modal = basicFareModal.vehicleCategories?[index];

                                return HatchbackSelectRideContainer(
                                  imagePath: "${ApiEndUrl.imageBaseUrl}${modal?.file}",
                                  type: modal!.type!,
                                  maxPillions: (modal.asppc ?? 0).toString(),
                                  rupees: modal.totalEstimationFare ?? '',
                                  timeInfo: modal.eta??'-',
                                  estimatedTime: modal.estimatedDropTime?.dropTime??'',
                                  isActive: modal.isSelected??false,
                                  callback: () {
                                    provider.updateSelectedContainer(modal, basicFareModal);

                                  },
                                  infoCallBack: () {
                                    provider.getEstimation(context, modal);
                                  },
                                );
                              }, separatorBuilder: (BuildContext context, int index) {
                              return height15;
                            },

                            ),

                            /*HatchbackSelectRideContainer(
                              imagePath: tiltedDownCar,
                              type: AppLocalizations.of(context)!.hatchback,
                              maxPillions: '4',
                              rupees:
                                  chooseARideData?.hatchback.estimatedAmount ??
                                      '',
                              isActive:
                                  chooseARideProvider.selectedContainer == 1,
                              callback: () {
                                chooseARideProvider.updateSelectedContainer(
                                  1,
                                );
                              },
                            ),
                            height15,
                            SedanSelectRideContainer(
                              imagePath: tiltedDownCar,
                              type: AppLocalizations.of(context)!.sedan,
                              maxPillions: '4',
                              rupees:
                                  chooseARideData?.sedan.estimatedAmount ?? '',
                              isActive:
                                  chooseARideProvider.selectedContainer == 2,
                              callback: () {
                                chooseARideProvider.updateSelectedContainer(2);
                              },
                            ),
                            height15,
                            SuvSelectRideContainer(
                              imagePath: carLogo1,
                              type: AppLocalizations.of(context)!.suv,
                              maxPillions: '6',
                              rupees:
                                  chooseARideData?.suv.estimatedAmount ?? '',
                              isActive:
                                  chooseARideProvider.selectedContainer == 3,
                              callback: () {
                                chooseARideProvider.updateSelectedContainer(3);
                              },
                            ),*/
                            height20,
                            Container(
                              decoration: BoxDecoration(
                                color: whiteColor,
                                border: Border.all(color: textDarkGrey),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: TextField(
                                        controller: chooseARideProvider
                                            .couponController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText:
                                              AppLocalizations.of(context)!
                                                  .applyCoupon,
                                        ),
                                        style: tsRegularBold,
                                      ),
                                    ),
                                  ),
                                  width10,
                                  SizedBox(
                                    height: 50,
                                    child: TextButton(
                                      onPressed: () {
                                        chooseARideProvider
                                            .postCouponAndVehicleData(
                                                context,
                                                chooseARideProvider.couponController.text,pickupModal
                                            );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: blueMain,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          AppLocalizations.of(context)!.apply,
                                          style: tsRegularWhite,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            height25,
                            Row(
                              children: [
                                width5,
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: CustomButtonOnlyBorder(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const UserOnlineHome(),
                                          ),
                                        );
                                      },
                                      title: AppLocalizations.of(context)!.skip,
                                      border: true,
                                      optionalTextColor: textBlack,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: CustomButton(
                                      onTap: () {

                                        if(provider.selectedVehicle!=null){
                                          print("Service Id :- ${provider.selectedVehicle?.estimation?.vehicleDetails?.vehicleDetails?.serviceId
                                              ??'-'}");
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DriverSearchingAnimation(vehicleModal: provider.selectedVehicle!),
                                            ),
                                          );
                                        }else{
                                          Fluttertoast.showToast(msg: "Please choose ride first");
                                        }

                                      },
                                      title:
                                          AppLocalizations.of(context)!.bookNow,
                                      border: true,
                                    ),
                                  ),
                                ),
                                width5,
                              ],
                            ),
                            height15,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
