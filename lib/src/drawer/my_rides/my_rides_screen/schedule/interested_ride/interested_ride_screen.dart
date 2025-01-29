import 'package:oiot/src/drawer/my_rides/my_rides_screen/my_rides.dart';

import '../../../../../../imports.dart';

class InterestedRide extends StatelessWidget {
  const InterestedRide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<InterestedDriverProvider>(
          builder: (BuildContext context, provider, Widget? child) {
        List<InterestedDriverModel> interestedDriverList =
            provider.interestedDriverList;
        return ListView.separated(
          separatorBuilder: (context, index) {
            return height10;
          },
          itemCount: interestedDriverList.length,
          itemBuilder: (context, index) {
            InterestedDriverModel drivers = interestedDriverList[index];
            return Card(
              color: whiteColor,
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: whiteColor,
                  radius: 26,
                  backgroundImage: NetworkImage(drivers.drivePhoto),
                ),
                title: Text(drivers.driverName),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '${AppLocalizations.of(context)!.mobileNumber}: ${drivers.mobileNumber}'),
                    Text(
                        '${AppLocalizations.of(context)!.model}: ${drivers.carModel}'),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: starColor,
                        ),
                        Text(
                            '${AppLocalizations.of(context)!.rating}: ${drivers.rating}'),
                      ],
                    ),
                  ],
                ),
                trailing: Text(
                  drivers.price,
                  style: tsRegularBoldGreen,
                ),
                onTap: () {},
              ),
            );
          },
        );
      }),
    );
  }
}
