import 'dart:developer';

import '../../../imports.dart';

class FavouriteProvider extends ChangeNotifier {
  List<FavouriteItemModel> _favouriteList = [];
  List<FavouriteItemModel> get favouriteList => _favouriteList;

  FavouriteProvider() {
    fetchFavouriteData();
  }

  Future<void> fetchFavouriteData() async {
    FavouriteServices favouriteServices = FavouriteServices();
    List<FavouriteItemModel>? result =
        await favouriteServices.fetchFavouriteData();
    if (result != null) {
      _favouriteList = result;
      notifyListeners();
    } else {
      log('Failed to fetch favourite places data');
    }
  }
}
