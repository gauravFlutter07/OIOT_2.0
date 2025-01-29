import 'package:oiot/src/drawer/wallet/bonus/congrats_bonus_pop_up.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/subscription_bonus/model/subscription_bonus_model.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/subscription_bonus/subscription_bonus_controller.dart';

import '../../../../../../imports.dart';

class SubscriptionBonusScreen extends StatelessWidget {
  const SubscriptionBonusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: padding10,
              child: CustomHeader(
                  title: AppLocalizations.of(context)!.subscriptionBonus),
            ),
            Expanded(
              child: Consumer<SubscriptionBonusProvider>(
                builder: (context, provider, child) {
                  List<SubscriptionBonusModel> subscriptionBonusList =
                      provider.subscriptionBonusList;
                  return Padding(
                    padding: padding10,
                    child: ListView.separated(
                      itemCount: subscriptionBonusList.length,
                      itemBuilder: (context, index) {
                        SubscriptionBonusModel subscription =
                            subscriptionBonusList[index];
                        return Card(
                          color: subscription.isActive
                              ? const Color.fromARGB(255, 249, 255, 250)
                              : const Color.fromARGB(255, 254, 247, 247),
                          child: ListTile(
                            leading: Image.asset(
                              subscriptionBonus,
                            ),
                            title: Text(
                              'Id - ${subscription.id}',
                              style: TextStyle(fontWeight: fontWeight500),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${AppLocalizations.of(context)!.validationPeriod} - ${subscription.validityPeriod}',
                                ),
                                Text(
                                  subscription.isActive
                                      ? '${AppLocalizations.of(context)!.status}: ${AppLocalizations.of(context)!.active}'
                                      : '${AppLocalizations.of(context)!.status}: ${AppLocalizations.of(context)!.expired}',
                                  style: TextStyle(
                                    color: subscription.isActive
                                        ? Colors.green.shade700
                                        : Colors.red.shade700,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  subscription.bonusAmount,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  subscription.isActive
                                      ? AppLocalizations.of(context)!.tapToClaim
                                      : AppLocalizations.of(context)!.expired,
                                  style: TextStyle(
                                    color: subscription.isActive
                                        ? Colors.green.shade700
                                        : Colors.red.shade700,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  if (subscription.isActive) {
                                    int bonusAmount = int.tryParse(
                                          subscription.bonusAmount
                                              .replaceAll('₹', ''),
                                        ) ??
                                        0;
                                    return CongratsBonusPopup(
                                        rupee: bonusAmount);
                                  } else {
                                    return AlertDialog(
                                      title: Text(AppLocalizations.of(context)!
                                          .bonusExpired),
                                      content: Text(
                                          AppLocalizations.of(context)!
                                              .thisBonusHasExpired),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                              AppLocalizations.of(context)!
                                                  .close),
                                        ),
                                      ],
                                    );
                                  }
                                },
                              );
                            },
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return height10;
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
