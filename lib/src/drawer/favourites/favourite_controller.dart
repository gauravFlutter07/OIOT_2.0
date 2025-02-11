import 'dart:developer';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oiot/api/map_api.dart';
import 'package:oiot/api/rider_repo.dart';

import '../../../imports.dart';
import "package:http/http.dart" as http;

import 'model/favourites_data_model.dart';



class FavouriteProvider extends ChangeNotifier {
  List<FavouriteItemModel> _favouriteList = [];
  List<FavouriteItemModel> get favouriteList => _favouriteList;
  bool fromAddPage = true;

  bool isLoading = false; //added var
  List<MyFavouritesModel> _myFavourites = []; //added var
  List<MyFavouritesModel> get myFavourites => _myFavourites; //added var

  MyFavouritesModel? myFavouritesModel; //added var

  FavouriteProvider() {
    // fetchFavouriteData();
    fetchFavouritesList();
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

  //get favourites list method
  Future<void> fetchFavouritesList() async {
    clearTextFields();
    try {
      isLoading = true;
      notifyListeners();
      final result = await RiderRepo.fetchFavourites(null);

      if (result != null && result['Address'] != null) {
        _myFavourites = (result['Address'] as List)
            .map((item) => MyFavouritesModel.fromJson(result.data))
            .toList();
        isLoading = false;
        notifyListeners();
      } else {
        log('Failed to fetch favourite places data: Address key is null');
      }
    } catch (e) {
      log("Error fetching favourites: $e");
      isLoading = false;
      notifyListeners();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // delete favourite method
  void deleteFavourite(String id) async {
    try {
      final result = await RiderRepo.deleteFavourite(id, null);
      print('Favourite deleted: $result');
      notifyListeners();
      fetchFavouritesList();
    } catch (e) {
      print('Error deleting favourite: $e');
    }
  }

  //------------------------------------------------------------------------------------------------------------------

  final TextEditingController _destinationController = TextEditingController();
  TextEditingController get destinationController => _destinationController;

  late final double latitude;
  late final double longitude;
  final String _apiKey = apiKey;

  LatLng? _destinationLatLng;
  LatLng? get destinationLatLng => _destinationLatLng;

  // Available options
  String label = 'Home';
  String? finalLabel; //to store the final label
  String? customOption; //added to store the  textfield value
  String? Address;

  void setSelectedOption(String option) {
    // to ge the label from aray
    label = option;
    notifyListeners();
  } // Notify listeners when the selection changes

  void setCustomOption(String option) {
    // to get the second option if other selected
    customOption = option;
    notifyListeners();
  }

  // void setCustomOptionLocation(String option) {  // to get the ful address
  //   //added to get the textfiled values
  //   Address = option;
  //   notifyListeners();
  // }

  /// Fetch suggestions for the entered text using Google Places Autocomplete API
  List<String> _suggestions = [];
  List<String> get suggestions => _suggestions;
  Future<void> fetchSuggestions(String query) async {
    if (query.isEmpty) {
      _suggestions.clear();
      notifyListeners();
      return;
    }
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${Uri.encodeComponent(query)}&key=$_apiKey');


    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK' && data['predictions'].isNotEmpty) {
          _suggestions = data['predictions']
              .map<String>((prediction) => prediction['description'] as String)
              .toList();
          notifyListeners();
        } else {
          _suggestions.clear();
          notifyListeners();
        }
      } else {
        print('Error fetching suggestions: ${response.statusCode}');
        _suggestions.clear();
        notifyListeners();
      }
    } catch (e) {
      print('Exception fetching suggestions: $e');
      _suggestions.clear();
      notifyListeners();
    }
  }

  void clearSuggestions() {
    _suggestions.clear();
    notifyListeners();
  }

  /// Fetch LatLng for the entered address using Google Maps Geocoding API
  Future<void> fetchLatLngFromAddress() async {
    final address = _destinationController.text.trim();
    Address = address; // -------------------stores the address into the Address
    if (address.isEmpty) {
      print("Address is empty");
      return;
    }
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?address=${Uri.encodeComponent(address)}&key=$_apiKey');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK' && data['results'].isNotEmpty) {
          final location = data['results'][0]['geometry']['location'];
          _destinationLatLng = LatLng(location['lat'], location['lng']);
          latitude = location['lat']; //added
          longitude = location['lng']; //added
          print('LatLng: $_destinationLatLng');
          notifyListeners();
        } else {
          print('No results found for the address.');
        }
      } else {
        print('Error fetching LatLng: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception while fetching LatLng: $e');
    }
  }

  void savedata() async {
    await fetchLatLngFromAddress();

    if (label == "Other" && customOption != null && customOption!.isNotEmpty) {
      finalLabel = customOption;
    } else {
      finalLabel = label;
    }

    print("-----------------------------------------------------------");
    print(finalLabel);
    print(Address);
    print(latitude);
    print(longitude);
    print("-----------------------------------------------------------");
  }

  Future<void> sendMyFav(BuildContext context) async {
    var map = {
      "label": finalLabel,
      "address": Address,
      "lat": latitude,
      "lng": longitude
    };

    var favResult = await RiderRepo.addMyFav(map);

    if (favResult != null && favResult['success']) {
      Fluttertoast.showToast(msg: '${favResult['message']}');
      isLoading == true;
      await fetchFavouritesList();
      notifyListeners();
    } else {
      if (favResult["message"] != null) {
        Fluttertoast.showToast(msg: '${favResult['message']}');
      }
    }
  }

  void clearTextFields() {
    // Clear destination controller (location input)
    _destinationController.clear();

    // Clear custom option if "Other" label was selected
    customOption = null;

    // If any other controllers are used, you can clear them as well
    // Example: textController.clear();

    notifyListeners(); // Notify listeners to update the UI
  }
  //-------------------------------------------------------------------------------------------------------------
}
