import 'package:oiot/src/drawer/wallet/bonus/congrats_bonus_pop_up.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/referral_bonus/model/referral_bonus_model.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/referral_bonus/referralbonus_controller.dart';
import '../../../../../../imports.dart';

class ReferralBonusPage extends StatelessWidget {
  const ReferralBonusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ReferralBonusProvider>(builder: (context, provider, child) {
      List<ReferralBonusModel?> referralBonusData =
          provider.referralBonusModelData;
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: padding10,
            child: Column(
              children: [
                CustomHeader(
                  title: AppLocalizations.of(context)!.referralBonus,
                ),
                height20,
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return height10;
                    },
                    itemCount: referralBonusData.length,
                    itemBuilder: (context, index) {
                      ReferralBonusModel? referralData =
                          referralBonusData[index];

                      return Card(
                        color: referralData!.status
                            ? const Color.fromARGB(255, 249, 255, 250)
                            : const Color.fromARGB(255, 254, 247, 247),
                        child: ListTile(
                          leading: Image.asset(
                            referralBonus,
                          ),
                          title: Text(
                            'ID - ${referralData.id}',
                            style: TextStyle(fontWeight: fontWeight500),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${referralData.date} | ${referralData.time}',
                                style: const TextStyle(fontSize: 13),
                              ),
                              Text(
                                referralData.status
                                    ? '${AppLocalizations.of(context)!.status}: ${AppLocalizations.of(context)!.active}'
                                    : '${AppLocalizations.of(context)!.status}: ${AppLocalizations.of(context)!.expired}',
                                style: TextStyle(
                                  color: referralData.status
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
                                referralData.bonusAmount,
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                referralData.status
                                    ? AppLocalizations.of(context)!.tapToClaim
                                    : AppLocalizations.of(context)!.expired,
                                style: TextStyle(
                                  color: referralData.status
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
                                if (referralData.status) {
                                  int bonusAmount = int.tryParse(
                                        referralData.bonusAmount
                                            .replaceAll('₹', ''),
                                      ) ??
                                      0;
                                  return CongratsBonusPopup(rupee: bonusAmount);
                                } else {
                                  return AlertDialog(
                                    title: Text(AppLocalizations.of(context)!
                                        .bonusExpired),
                                    content: Text(AppLocalizations.of(context)!
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
                  ),
                ),
                height05,
              ],
            ),
          ),
        ),
      );
    });
  }
}
