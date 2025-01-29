import '../../../../imports.dart';

class AddMoneyScreen extends StatelessWidget {
  const AddMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addMoneyProvider = context.read<AddMoneyProvider>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: horizontalPadding20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(title: AppLocalizations.of(context)!.addWallet),
              height20,
              Text(
                AppLocalizations.of(context)!.addAmount,
                style: tsRegularBold,
              ),
              height25,
              TextFormField(
                controller: addMoneyProvider.addedAmountController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.enterAmount,
                  border: OutlineInputBorder(
                    borderRadius: circularBorderRadius10,
                  ),
                ),
              ),
              height35,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildDefaultAmountContainer('100', context),
                  _buildDefaultAmountContainer('200', context),
                  _buildDefaultAmountContainer('500', context),
                  _buildDefaultAmountContainer('1000', context),
                ],
              ),
              height80,
              CustomButton(
                onTap: () {
                  addMoneyProvider.addWallet(context);
                },
                title: AppLocalizations.of(context)!.addMoney,
                border: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDefaultAmountContainer(String amount, BuildContext context) {
    final addMoneyProvider = context.read<AddMoneyProvider>();
    return GestureDetector(
      onTap: () {
        addMoneyProvider.setDefaultAmount(amount);
      },
      child: Container(
        padding: padding8,
        margin: rightPadding10,
        decoration: BoxDecoration(
          color: blueMain,
          borderRadius: circularBorderRadius8,
        ),
        child: Text(
          '₹$amount',
          style: tsRegularWhite,
        ),
      ),
    );
  }
}
