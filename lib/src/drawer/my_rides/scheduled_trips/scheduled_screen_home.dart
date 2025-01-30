import '../../../../../../imports.dart';
import '../my_rides_screen/schedule/sheduled_ride/scheduled_tab_screen.dart';

class ScheduledHomeScreen extends StatelessWidget {
  const ScheduledHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: CustomHeader(
                title: AppLocalizations.of(context)!.scheduledTrips),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Container(
                margin: horizontalPadding10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                ),
                child: TabBar(
                  labelColor: blackColor,
                  unselectedLabelColor: blackColor,
                  tabs: [
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          AppLocalizations.of(context)!.scheduled,
                          style: tsSmall,
                        ),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          AppLocalizations.of(context)!.interested,
                          style: tsSmall,
                        ),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          AppLocalizations.of(context)!.upcoming,
                          style: tsSmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              ScheduledTabPage(),
              InterestedRide(),
              AcceptedRide(),
            ],
          ),
        ),
      ),
    );
  }
}
