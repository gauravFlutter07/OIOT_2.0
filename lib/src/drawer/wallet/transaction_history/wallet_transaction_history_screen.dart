import '../../../../imports.dart';
import '../../../../widgets/app_text_widget.dart';

class WalletTransctionHistoryScreen extends StatelessWidget {
  const WalletTransctionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final walletTransactionHistoryProvider =
        Provider.of<WalletTransactionHistoryProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: horizontalPadding20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height10,
              CustomHeader(title: AppLocalizations.of(context)!.history),
              height10,
              CustomTextFormField(
                textEditingController:
                    walletTransactionHistoryProvider.selectedDate,
                isPass: false,
                hint: AppLocalizations.of(context)!.selectDate,
                suffixIcon: IconButton(
                  onPressed: () {
                    walletTransactionHistoryProvider.selectDate(context);
                  },
                  icon: const Icon(Icons.calendar_month_outlined),
                ),
              ),
              height20,
              CustomTextFormField(
                textEditingController:
                    walletTransactionHistoryProvider.selectedDate1,
                isPass: false,
                hint: AppLocalizations.of(context)!.select,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textWidget('Sep 06, 2022', pureBlack, FontWeight.w700, 18.0,
                      false, null, 0.0, 20.0, 0.0, 10.0),
                  textWidget(
                    'Sort',
                    pureBlack,
                    FontWeight.w700,
                    18.0,
                    false,
                    null,
                    0.0,
                    20.0,
                    0.0,
                    10.0,
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) =>
                      historyListTile(
                    leadingImage: upArrowBlue,
                    title: 'Paid - ID:ABC2356',
                    subtitle: 'Swaminathan - 987632156',
                    trailingTitle: '₹ 300.00',
                    trailingIcon: Icons.arrow_forward_ios,
                    dateTime: '30 May 22 | 11:30 AM',
                    status: 'Successful',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
