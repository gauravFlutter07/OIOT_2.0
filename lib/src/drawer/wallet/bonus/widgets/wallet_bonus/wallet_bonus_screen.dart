import 'package:oiot/src/drawer/wallet/bonus/congrats_bonus_pop_up.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/wallet_bonus/model/wallet_bonus_model.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/wallet_bonus/wallet_bonus_controller.dart';

import '../../../../../../imports.dart';

class WalletBonusScreen extends StatelessWidget {
  const WalletBonusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: padding10,
              child: CustomHeader(
                  title: AppLocalizations.of(context)!.walletBonus),
            ),
            Expanded(
              child: Consumer<WalletBonusProvider>(
                builder: (context, provider, child) {
                  List<WalletBonusModel> walletBonusData =
                      provider.walletBonusData;

                  return Padding(
                    padding: padding10,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          WalletBonusModel walletBonus = walletBonusData[index];
                          return Card(
                            color: walletBonus.isActive
                                ? const Color.fromARGB(255, 249, 255, 250)
                                : const Color.fromARGB(255, 254, 247, 247),
                            child: ListTile(
                              leading: Image.asset(walletBonusImg),
                              title: Text(
                                'Id - ${walletBonus.id}',
                                style: TextStyle(fontWeight: fontWeight500),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${AppLocalizations.of(context)!.expiryDate} - ${walletBonus.expiryDate}',
                                  ),
                                  Text(
                                      '${AppLocalizations.of(context)!.expiryDate} - ${walletBonus.expiryTime}'),
                                  Text(
                                    walletBonus.isActive
                                        ? '${AppLocalizations.of(context)!.status}: ${AppLocalizations.of(context)!.active}'
                                        : '${AppLocalizations.of(context)!.status}: ${AppLocalizations.of(context)!.expired}',
                                    style: TextStyle(
                                      color: walletBonus.isActive
                                          ? Colors.green.shade700
                                          : Colors.red.shade700,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    walletBonus.bonusAmount,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    walletBonus.isActive
                                        ? AppLocalizations.of(context)!
                                            .tapToClaim
                                        : AppLocalizations.of(context)!.expired,
                                    style: TextStyle(
                                      color: walletBonus.isActive
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
                                    if (walletBonus.isActive) {
                                      int bonusAmount = int.tryParse(
                                            walletBonus.bonusAmount
                                                .replaceAll('₹', ''),
                                          ) ??
                                          0;
                                      return CongratsBonusPopup(
                                          rupee: bonusAmount);
                                    } else {
                                      return AlertDialog(
                                        title: Text(
                                            AppLocalizations.of(context)!
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
                        itemCount: walletBonusData.length),
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
