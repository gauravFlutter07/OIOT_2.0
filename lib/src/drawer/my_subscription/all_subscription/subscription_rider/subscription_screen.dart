import '../../../../../imports.dart';

// S U B S C R I P T I O N  L A N D I N G  S C R E E N

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Consumer<SubscriptionProvider>(
            builder: (context, provider, child) => AppBar(
              automaticallyImplyLeading: false,
              title: CustomHeader(
                  title: AppLocalizations.of(context)!.subscriptions),
              bottom: TabBar(
                controller: provider.tabController,
                indicator: BoxDecoration(
                  borderRadius: circularBorderRadius10,
                  boxShadow: [
                    BoxShadow(
                      color: textGrey,
                      blurRadius: 15,
                      offset: const Offset(3, 3),
                    ),
                    BoxShadow(
                      color: whiteColor,
                      blurRadius: 15,
                      offset: const Offset(-3, -3),
                    ),
                  ],
                  color: blueMain,
                ),
                labelColor: whiteColor,
                labelStyle: tsRegularBoldGrey,
                unselectedLabelColor: blackColor,
                tabs: [
                  Container(
                    height: 45,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: circularBorderRadius7,
                    ),
                    child: Tab(
                      child: Align(
                        alignment: centreAlignment,
                        child: Text(
                          AppLocalizations.of(context)!.myPlans,
                          style: tsRegular,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: circularBorderRadius7,
                    ),
                    child: Tab(
                      child: Align(
                        alignment: centreAlignment,
                        child: Text(
                          AppLocalizations.of(context)!.viewHistory,
                          style: tsRegular,
                        ),
                      ),
                    ),
                  ),
                ],
                indicatorSize: TabBarIndicatorSize.label,
                onTap: (index) {
                  provider.setTabIndex(index);
                  // value.setColorMyPlans();
                  // value.setColorViewHistory();
                },
              ),
            ),
          ),
        ),
        body: Consumer<SubscriptionProvider>(
          builder: (context, value, child) => const TabBarView(
            children: [
              Center(child: MyPlanWidget()),
              Center(child: ViewHistoryPlanWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
