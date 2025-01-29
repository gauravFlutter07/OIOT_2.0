import '../../../imports.dart';

class UserOfflineHome extends StatelessWidget {
  UserOfflineHome({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Provider.of<OfflineHomeProvider>(context, listen: false);
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerScreen(),
      body: SafeArea(
        child: Padding(
          padding: symmetricpadding8,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              height05,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: menuIcon30,
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RouteClass.qrCodePage);
                        },
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset(
                            qr1,
                          ),
                        ),
                      ),
                      width10,
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: circleBoxShape,
                          color: blueMain,
                        ),
                        child: Center(
                          child: IconButton(
                            icon: notificationOutlined,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Expanded(
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset(
                    oiotlogo,
                  ),
                ),
              ),
              height15,
              Text(AppLocalizations.of(context)!.welcometoOIOT,
                  style: tsLargeBold),
              height35,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Consumer<MyProfileProvider>(
                  builder: (context, provider, child) => provider
                              .myProfileDetails ==
                          null
                      ? Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: circularBorderRadius10,
                          ),
                          child: Container(
                            padding: padding8,
                            decoration: BoxDecoration(
                              borderRadius: circularBorderRadius10,
                              color: whiteColor,
                            ),
                            child: Column(
                              children: [
                                height10,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    width5,
                                    CircularPercentIndicator(
                                      center: SizedBox(
                                        width: 120,
                                        height: 120,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(provider.myProfileDetails != null
                                              ? provider.myProfileDetails!.profileurl?? 'https://cdn-icons-png.flaticon.com/128/149/149071.png'
                                              : 'https://cdn-icons-png.flaticon.com/128/149/149071.png'),
                                        ),
                                      ),
                                      radius: 65,
                                      lineWidth: 5,
                                      percent: 0.999,
                                      progressColor: blueMain,
                                      backgroundColor: transperentColor,
                                    ),
                                    width5,
                                  ],
                                ),
                                height10,
                                Text(
                                  '${AppLocalizations.of(context)!.hey}, ${provider.myProfileDetails?.fname ?? 'No name'}',
                                  style: tsExtraLargeBold,
                                ),
                                height05,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: starColor,
                                    ),
                                    Text(
                                      provider.myProfileDetails?.rating?.rating ??
                                          '',
                                      style: tsRegularBoldGrey,
                                    ),
                                  ],
                                ),
                                height20,
                                CustomButton(
                                  onTap: () {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MyProfile(),
                                        ),
                                      );
                                    });
                                  },
                                  title: AppLocalizations.of(context)!
                                      .updateProfile,
                                  optionalColor: lightBlack,
                                  optionalTextColor: whiteColor,
                                  border: true,
                                ),
                                height10,
                              ],
                            ),
                          ),
                        )
                      : Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: circularBorderRadius10,
                          ),
                          child: ClipRRect(
                            borderRadius: circularBorderRadius10,
                            child: Image.network(
                              'https://static.theprint.in/wp-content/uploads/2022/03/Image_32022030212235320220302132809.jpg',
                              fit: boxfitCover,
                              width: double.infinity,
                              height: 312,
                            ),
                          ),
                        ),
                ),
              ),
              height15,
              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5),
                child: CustomButton(
                  onTap: () {
                    context.read<PickupProvider>().getCurrentLocation();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserOnlineHome(),
                      ),
                    );
                  },
                  title: AppLocalizations.of(context)!.goToBooking,
                  border: true,
                ),
              ),
              height45,
            ],
          ),
        ),
      ),
    );
  }
}
