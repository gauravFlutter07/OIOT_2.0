import 'package:share_plus/share_plus.dart';

import '../../../../../imports.dart';

class OngoingRiderProvider extends ChangeNotifier {
  Future<void> shareFunction() async {
    await Share.share('Thank you for sharing oiot',
    );
  }
}
