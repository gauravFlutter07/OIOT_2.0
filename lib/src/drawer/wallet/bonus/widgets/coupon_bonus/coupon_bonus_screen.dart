import 'package:oiot/src/drawer/wallet/bonus/widgets/coupon_bonus/coupon_bonus_controller.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/coupon_bonus/model/coupon_bonus_model.dart';
import 'package:oiot/src/drawer/wallet/bonus/congrats_bonus_pop_up.dart';

import '../../../../../../imports.dart';

class CouponBonusScreen extends StatelessWidget {
  const CouponBonusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: padding10,
              child: CustomHeader(
                  title: AppLocalizations.of(context)!.couponBonus),
            ),
            Expanded(
              child: Consumer<CouponBonusProvider>(
                builder: (context, couponBonusProvider, _) {
                  List<CouponModel> couponBonusList =
                      couponBonusProvider.couponBonusList;

                  if (couponBonusList.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        itemCount: couponBonusList.length,
                        itemBuilder: (context, index) {
                          CouponModel coupon = couponBonusList[index];
                          return Card(
                            color: coupon.isActive
                                ? const Color.fromARGB(255, 249, 255, 250)
                                : const Color.fromARGB(255, 254, 247, 247),
                            child: ListTile(
                              leading: Image.asset(
                                couponBonus,
                              ),
                              title: Text(
                                'Id - ${coupon.id}',
                                style: TextStyle(fontWeight: fontWeight500),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${AppLocalizations.of(context)!.expiry} - ${coupon.expirationDate}',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    coupon.isActive
                                        ? '${AppLocalizations.of(context)!.status}: ${AppLocalizations.of(context)!.active}'
                                        : '${AppLocalizations.of(context)!.status}: ${AppLocalizations.of(context)!.expired}',
                                    style: TextStyle(
                                      color: coupon.isActive
                                          ? Colors.green.shade700
                                          : Colors.red.shade700,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    coupon.discountAmount,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  height10,
                                  Text(
                                    coupon.isActive
                                        ? AppLocalizations.of(context)!
                                            .tapToClaim
                                        : AppLocalizations.of(context)!.expired,
                                    style: TextStyle(
                                      color: coupon.isActive
                                          ? Colors.green.shade700
                                          : Colors.red.shade700,
                                    ),
                                  )
                                ],
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    if (coupon.isActive) {
                                      int bonusAmount = int.tryParse(
                                            coupon.discountAmount
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
                          return height05;
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
