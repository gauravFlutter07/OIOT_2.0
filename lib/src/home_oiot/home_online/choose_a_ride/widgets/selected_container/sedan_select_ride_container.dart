import '../../../../../../imports.dart';

class SedanSelectRideContainer extends StatelessWidget {
  final String imagePath;
  final String type;
  final String maxPillions;
  final String rupees;
  final bool isActive;
  final VoidCallback callback;

  const SedanSelectRideContainer({
    super.key,
    required this.imagePath,
    required this.type,
    required this.maxPillions,
    required this.rupees,
    required this.isActive,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: isActive ? blueMain : Colors.grey[200],
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
                child: Image.asset(
                  imagePath,
                  height: 50,
                  width: 50,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: isActive ? Colors.white : Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      color: isActive ? Colors.white : Colors.black,
                    ),
                    Text(
                      maxPillions,
                      style: TextStyle(
                        color: isActive ? Colors.white : Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text(
              '₹$rupees',
              style: TextStyle(
                color: isActive ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SedanEstimatePrice(),
                  ),
                );*/
              },
              child: Icon(
                Icons.info,
                size: 30,
                color: isActive ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
