import '../../../../../imports.dart';

class RecommendedPlans extends StatelessWidget {
  const RecommendedPlans({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: padding10,
              child: CustomHeader(
                title: AppLocalizations.of(context)!.recommendedPlans,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return const SubscriptionItemWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
