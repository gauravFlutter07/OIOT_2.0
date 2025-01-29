import 'package:oiot/imports.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/performance_bonus/model/performance_bonus_model.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/performance_bonus/performance_bonus_controller.dart';
import 'package:oiot/src/drawer/wallet/bonus/congrats_bonus_pop_up.dart';

class PerformanceBonusScreen extends StatelessWidget {
  const PerformanceBonusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PerformanceBonusProvider>(
        builder: (context, provider, child) {
          List<PerformanceBonusModel> performanceBonusData =
              provider.performanceBonusData;
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: padding10,
                  child: CustomHeader(
                      title: AppLocalizations.of(context)!.performanceBonus),
                ),
                Expanded(
                  child: Padding(
                    padding: padding10,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        PerformanceBonusModel performanceData =
                            performanceBonusData[index];
                        return Card(
                          color: performanceData.isActive
                              ? const Color.fromARGB(255, 249, 255, 250)
                              : const Color.fromARGB(255, 254, 247, 247),
                          child: ListTile(
                            leading: Image.asset(performanceBonus),
                            title: Text(
                              'Id - ${performanceData.id}',
                              style: TextStyle(fontWeight: fontWeight500),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    '${AppLocalizations.of(context)!.expiryDate} - ${performanceData.expiryDate}'),
                                Text(
                                    '${AppLocalizations.of(context)!.expiryDate} - ${performanceData.expiryTime}'),
                                Text(
                                  performanceData.isActive
                                      ? '${AppLocalizations.of(context)!.status}: ${AppLocalizations.of(context)!.active}'
                                      : '${AppLocalizations.of(context)!.status}: ${AppLocalizations.of(context)!.expired}',
                                  style: TextStyle(
                                    color: performanceData.isActive
                                        ? Colors.green.shade700
                                        : Colors.red.shade700,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  performanceData.bonusAmount,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Text(
                                  performanceData.isActive
                                      ? AppLocalizations.of(context)!.tapToClaim
                                      : AppLocalizations.of(context)!.expired,
                                  style: TextStyle(
                                    color: performanceData.isActive
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
                                  if (performanceData.isActive) {
                                    int bonusAmount = int.tryParse(
                                          performanceData.bonusAmount
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
                      itemCount: performanceBonusData.length,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
