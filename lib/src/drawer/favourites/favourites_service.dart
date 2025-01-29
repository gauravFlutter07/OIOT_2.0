import 'dart:developer';

import '../../../imports.dart';

class FavouriteServices {
  List<Map<String, dynamic>> favouriteList = [
    {
      "category": "WORK",
      "location": "Towner solutions, JP Nagar 1st phase, Bangalore",
    },
    {
      "category": "HOME",
      "location": "Near Sea Spice, Banashankari, Bangalore",
    },
    {
      "category": "SHOP",
      "location": "D-Mart, Madiwala, Bangalore",
    },
    {
      "category": "SCHOOL",
      "location": "Christ, Bangalore",
    },
  ];

  String favouritePlaceUrl = 'api/favouriteplace';

  Dio dio = Dio();

  Future<List<FavouriteItemModel>?> fetchFavouriteData() async {
    try {
      int statusCode = 200;
      if (statusCode == 200) {
        List<FavouriteItemModel> favouritePlaceList = favouriteList
            .map((favouriteData) => FavouriteItemModel.fromJson(favouriteData))
            .toList();
        return favouritePlaceList;
      } else {
        throw Exception('Failed to fetch favourite places data');
      }
    } catch (e) {
      log('Error fetching favourite places data: $e');
      return [];
    }
  }
}
