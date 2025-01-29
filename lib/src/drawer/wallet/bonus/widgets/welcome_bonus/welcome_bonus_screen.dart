import 'package:oiot/src/drawer/wallet/bonus/congrats_bonus_pop_up.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/welcome_bonus/model/welcome_bonus_model.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/welcome_bonus/welcome_bonus_controller.dart';
import '../../../../../../imports.dart';

class WelcomeBonusScreen extends StatelessWidget {
  const WelcomeBonusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WelcomeBonusProvider();
    return Consumer<WelcomeBonusProvider>(builder: (context, provider, child) {
      List<WelcomeBonusModel?> welcomebonusData =
          provider.welcomeBonusModelData;
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: padding10,
            child: Column(
              children: [
                CustomHeader(
                  title: AppLocalizations.of(context)!.welcomeBonus,
                ),
                height20,
                Expanded(
                  child: ListView.separated(
                    itemCount: welcomebonusData.length,
                    itemBuilder: (context, index) {
                      WelcomeBonusModel? welcomebonus = welcomebonusData[index];
                      return Card(
                        color: welcomebonus!.isActive
                            ? const Color.fromARGB(255, 249, 255, 250)
                            : const Color.fromARGB(255, 254, 247, 247),
                        child: ListTile(
                          leading: Image.asset(
                            welcomeBonus,
                          ),
                          title: Text(
                            'ID - ${welcomebonus.id}',
                            style: TextStyle(fontWeight: fontWeight500),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${welcomebonus.date} | ${welcomebonus.time}',
                                style: const TextStyle(fontSize: 13),
                              ),
                              Text(
                                welcomebonus.isActive
                                    ? '${AppLocalizations.of(context)!.status}: ${AppLocalizations.of(context)!.active}'
                                    : '${AppLocalizations.of(context)!.status}: ${AppLocalizations.of(context)!.expired}',
                                style: TextStyle(
                                  color: welcomebonus.isActive
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
                                welcomebonus.bonusAmount,
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                welcomebonus.isActive
                                    ? AppLocalizations.of(context)!.tapToClaim
                                    : AppLocalizations.of(context)!.expired,
                                style: TextStyle(
                                  color: welcomebonus.isActive
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
                                if (welcomebonus.isActive) {
                                  int bonusAmount = int.tryParse(
                                        welcomebonus.bonusAmount
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
                    separatorBuilder: (context, index) {
                      return height10;
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
