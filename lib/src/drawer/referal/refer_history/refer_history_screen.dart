import '../../../../imports.dart';

class ReferHistoryScreen extends StatelessWidget {
  const ReferHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ReferHistoryProvider provider =
        Provider.of<ReferHistoryProvider>(context, listen: false);
    ReferHistoryModel? refetHistoryData = provider.referHistoryData;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: CustomHeader(
              title: AppLocalizations.of(context)!.referralHistory),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  whiteColor,
                  blueGreyshade50,
                ],
              ),
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30.0),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Text(
                refetHistoryData?.totalBalance ?? '',
                style: tsExtraLargeBold,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: padding10,
            child: Consumer<ReferHistoryProvider>(
              builder: (context, provider, child) {
                ReferHistoryModel? refetHistoryData = provider.referHistoryData;
                return Column(
                  children: [
                    height10,
                    Card(
                      color: blueGreyshade50,
                      child: Padding(
                        padding: padding12,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.referralTo,
                                  style: tsRegularBold,
                                ),
                                width5,
                                Text(refetHistoryData?.referName ?? '',
                                    style: tsRegularBold),
                              ],
                            ),
                            height05,
                            Row(
                              children: [
                                Text('${AppLocalizations.of(context)!.status}:',
                                    style: tsRegularBoldGreen),
                                width5,
                                Text(refetHistoryData?.referStatus ?? '',
                                    style: tsRegularBoldGreen),
                              ],
                            ),
                            height05,
                            Row(
                              children: [
                                Text(
                                    '${AppLocalizations.of(context)!.referralCode}:',
                                    style: tsRegularBold),
                                width5,
                                Text(
                                  refetHistoryData?.referCode ?? '',
                                  style: tsRegularBold,
                                ),
                              ],
                            ),
                            height05,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                        '${AppLocalizations.of(context)!.referralTo}:',
                                        style: tsRegularBold),
                                    width5,
                                    Text(refetHistoryData?.referType ?? '',
                                        style: tsRegularBold),
                                  ],
                                ),
                                Text(
                                  '₹${refetHistoryData?.referralAmount ?? ''}',
                                  style: tsLargeBold,
                                ),
                              ],
                            ),
                            height05,
                            Row(
                              children: [
                                Text(
                                    '${AppLocalizations.of(context)!.dateAndTime}:',
                                    style: tsSmall),
                                width5,
                                Text(
                                    '${refetHistoryData?.referDate ?? ''} | ${refetHistoryData?.referTime ?? ''}',
                                    style: tsSmall),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
