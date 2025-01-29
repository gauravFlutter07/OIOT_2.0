import 'package:oiot/src/drawer/wallet/bonus/widgets/performance_bonus/model/performance_bonus_model.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/performance_bonus/performance_bonus_service.dart';

import '../../../../../../imports.dart';

class PerformanceBonusProvider extends ChangeNotifier {
  List<PerformanceBonusModel> _performanceBonusData = [];
  List<PerformanceBonusModel> get performanceBonusData => _performanceBonusData;

  PerformanceBonusProvider() {
    fetchPerformanceBonusdetails();
  }

  Future<void> fetchPerformanceBonusdetails() async {
    PerformanceBonusService performanceBonusService = PerformanceBonusService();

    List<PerformanceBonusModel>? result =
        await performanceBonusService.fetchPerformanceBonusData();

    if (result != null) {
      _performanceBonusData = result;
      notifyListeners();
    }
  }
}
