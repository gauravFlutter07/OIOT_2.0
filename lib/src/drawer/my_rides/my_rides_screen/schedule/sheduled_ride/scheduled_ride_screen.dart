import 'package:oiot/src/drawer/my_rides/my_rides_screen/my_rides.dart';

import '../../../../../../imports.dart';

class ScheduledRides extends StatelessWidget {
  const ScheduledRides({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: horizontalPadding10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      AppLocalizations.of(context)!.scheduled,
                      style: tsSmall,
                    ),
                  ),
                  Tab(
                    child: Text(
                      AppLocalizations.of(context)!.interested,
                      style: tsSmall,
                    ),
                  ),
                  Tab(
                    child: Text(
                      AppLocalizations.of(context)!.accepted,
                      style: tsSmall,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 200,
                child: const TabBarView(
                  children: [
                    ScheduledTabPage(),
                    InterestedRide(),
                    AcceptedRide(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
