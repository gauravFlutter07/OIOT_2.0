import 'package:carousel_slider/carousel_slider.dart';
import 'package:oiot/src/home_oiot/home_online/new_map/map_new_screen.dart';

import '../../../imports.dart';

class UserOnlineHome extends StatelessWidget {
  const UserOnlineHome({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: padding12,
            child: Consumer<UserOnlineHomeController>(
              builder: (BuildContext context, provider, Widget? child) {
                provider.chekFIrebase(context);
                List<HomeScreenServiceModel> onlineHomeList =
                    provider.onlineHomeData;
                List<CarouselImageModel> carouselImages =
                    provider.carouselImages;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: backgroundGrey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          width7,
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const PickUpScreen(flag: 1),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.search,
                              color: textGrey,
                            ),
                          ),
                          width10,
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const PickUpScreen(flag: 1),
                                ),
                              );
                            },
                            child: Text(
                              AppLocalizations.of(context)!.dropLocation,
                              style: tsRegularBoldGrey,
                            ),
                          ),
                          const Spacer(),
                          width5,
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyQrCodeForTrip(),
                                ),
                              );
                            },
                            child: Image.asset(
                              qr2,
                              scale: 23,
                            ),
                          ),
                        ],
                      ),
                    ),
                    carouselImages.isNotEmpty
                        ? CarouselSlider(
                            options: CarouselOptions(
                              height: 180.0,
                              enableInfiniteScroll: true,
                              autoPlay: true,
                            ),
                            items: carouselImages
                                .map(
                                  (item) => Image.network(
                                    item.imageUrl,
                                    fit: BoxFit.contain,
                                  ),
                                )
                                .toList(),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                    height10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: onlineHomeList.isNotEmpty
                          ? [
                              OptionTileNetwork(
                                callback: () {
                                  final provider = Provider.of<PickupProvider>(context, listen: false);
                                  provider.clearSearchPickUp();
                                  provider.clearSearchDestination();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PickUpScreen(flag: 1),
                                    ),
                                  );
                                },
                                image: onlineHomeList[0].servicePic,
                                text: AppLocalizations.of(context)!.dailyRide,
                                isTransparent: false,
                                isActive: onlineHomeList[0].isActive,
                              ),
                              OptionTileNetwork(
                                callback: () {
                                  final provider = Provider.of<PickupProvider>(context, listen: false);
                                  provider.clearSearchPickUp();
                                  provider.clearSearchDestination();

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PickUpScreen(flag: 2),
                                    ),
                                  );
                                },
                                image: onlineHomeList[1].servicePic,
                                text: AppLocalizations.of(context)!
                                    .outstationRide,
                                isTransparent: false,
                                isActive: onlineHomeList[1].isActive,
                              ),
                              OptionTileNetwork(
                                callback: () {
                                  final provider = Provider.of<PickupProvider>(context, listen: false);
                                  provider.clearRentalData();

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PickUpScreen(flag: 3),
                                    ),
                                  );
                                },
                                image: onlineHomeList[2].servicePic,
                                text: AppLocalizations.of(context)!.rentalRide,
                                isTransparent: false,
                                isActive: onlineHomeList[2].isActive,
                              ),
                            ]
                          : [],
                    ),
                    height10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OptionTileAsset(
                          callback: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyRidesScreen(),
                              ),
                            );
                          },
                          image: suitCase,
                          text: AppLocalizations.of(context)!.myRides,
                          isTransparent: false,
                        ),
                        OptionTileAsset(
                          callback: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ScheduledHomeScreen(),
                              ),
                            );
                          },
                          image: calender,
                          text: AppLocalizations.of(context)!.mySchedule,
                          isTransparent: false,
                        ),
                        OptionTileAsset(
                          callback: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationScreen(),
                              ),
                            );
                          },
                          image: notification,
                          text: AppLocalizations.of(context)!.notificationss,
                          isTransparent: false,
                        ),
                      ],
                    ),
                    height10,
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.myFavourites,
                          style: tsMediumBold,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NewMapScreen(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.maps_ugc),
                        ),
                      ],
                    ),
                    height05,
                    Consumer<FavouriteProvider>(
                      builder: (BuildContext context, provider, Widget? child) {
                        List<FavouriteItemModel> favouriteList =
                            provider.favouriteList;

                        List<FavouriteItemModel> firstFavourites =
                            favouriteList.length <= 2
                                ? favouriteList
                                : favouriteList.sublist(0, 2);

                        if (firstFavourites.isEmpty) {
                          return Center(
                            child: Text(
                              AppLocalizations.of(context)!.noFavourites,
                              style: tsRegularBoldGrey,
                            ),
                          );
                        }
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: firstFavourites.length,
                          itemBuilder: (context, index) {
                            FavouriteItemModel favourite =
                                firstFavourites[index];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: backgroundGrey,
                                child: Icon(
                                  Icons.favorite,
                                  color: blackColor,
                                  size: 25,
                                ),
                              ),
                              trailing: Icon(
                                Icons.keyboard_arrow_right,
                                size: 35,
                                color: textBlack,
                              ),
                              title: Text(
                                favourite.category,
                                style: tsRegularBold,
                              ),
                              subtitle: Text(
                                favourite.location,
                                style: tsSmallBold,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const FavouriteScreen(),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                    const Divider(),
                    height05,
                    Text(
                      AppLocalizations.of(context)!.aroundYou,
                      style: tsMediumBold,
                    ),
                    height20,
                    const SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: MapPage(),
                    ),
                    height20,
                  ],
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: Consumer<UserOnlineHomeController>(
        builder: (context, onlineHomeController, child) {
          return BottomNavigationBar(
            currentIndex: onlineHomeController.currentIndex,
            selectedItemColor: blueMain,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            onTap: (value) {
              onlineHomeController.updateIndex(value);
              if (value == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserOfflineHome(),
                  ),
                );
              } else if (value == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReportScreenOne(),
                  ),
                );
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  logout,
                  height: 30,
                  width: 30,
                ),
                label: AppLocalizations.of(context)!.goHome,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  slip,
                  height: 30,
                  width: 30,
                ),
                label: AppLocalizations.of(context)!.activeCaps,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  more,
                  height: 30,
                  width: 40,
                ),
                label: AppLocalizations.of(context)!.more,
              ),
            ],
          );
        },
      ),
    );
  }
}
