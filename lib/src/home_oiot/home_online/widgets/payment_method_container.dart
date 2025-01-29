import '../../../../imports.dart';

class PaymentMethodContainer extends StatelessWidget {
  final String imagePath;
  final String type;
  final bool isActive;
  final VoidCallback callback;
  final bool isWallet;

  const PaymentMethodContainer({
    super.key,
    required this.imagePath,
    required this.type,
    required this.isActive,
    required this.callback,
    required this.isWallet,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: isActive ? blueMain : darkWhiteBackground,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    imagePath,
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
            ),
            Text(
              type,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: (isActive) ? Colors.white : textBlack),
            ),
            const Spacer(),
            (isWallet)
                ? Text(
                    '₹ 1200.00',
                    style: TextStyle(
                        color: (isActive) ? Colors.white : textBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  )
                : const Text(''),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
