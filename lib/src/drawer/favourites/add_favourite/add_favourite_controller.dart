// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:oiot/imports.dart';
// import "package:http/http.dart" as http;
// import '../../../../api/map_api.dart';
// import '../../../../api/rider_repo.dart';

// class AddFavouriteProvider extends ChangeNotifier {
//   final TextEditingController _destinationController = TextEditingController();
//   TextEditingController get destinationController => _destinationController;

//   late final double latitude;
//   late final double longitude;
//   final String _apiKey = apiKey;

//   LatLng? _destinationLatLng;
//   LatLng? get destinationLatLng => _destinationLatLng;

//   // Available options
//   String label = 'Home';
//   String? finalLabel; //to store the final label
//   String? customOption; //added to store the  textfield value
//   String? Address;

//   void setSelectedOption(String option) {
//     // to ge the label from aray
//     label = option;
//     notifyListeners();
//   } // Notify listeners when the selection changes

//   void setCustomOption(String option) {
//     // to get the second option if other selected
//     customOption = option;
//     notifyListeners();
//   }

//   // void setCustomOptionLocation(String option) {  // to get the ful address
//   //   //added to get the textfiled values
//   //   Address = option;
//   //   notifyListeners();
//   // }

//   /// Fetch suggestions for the entered text using Google Places Autocomplete API
//   List<String> _suggestions = [];
//   List<String> get suggestions => _suggestions;
//   Future<void> fetchSuggestions(String query) async {
//     if (query.isEmpty) {
//       _suggestions.clear();
//       notifyListeners();
//       return;
//     }
//     final url = Uri.parse(
//         'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${Uri.encodeComponent(query)}&key=$_apiKey');
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         if (data['status'] == 'OK' && data['predictions'].isNotEmpty) {
//           _suggestions = data['predictions']
//               .map<String>((prediction) => prediction['description'] as String)
//               .toList();
//           notifyListeners();
//         } else {
//           _suggestions.clear();
//           notifyListeners();
//         }
//       } else {
//         print('Error fetching suggestions: ${response.statusCode}');
//         _suggestions.clear();
//         notifyListeners();
//       }
//     } catch (e) {
//       print('Exception fetching suggestions: $e');
//       _suggestions.clear();
//       notifyListeners();
//     }
//   }

//   void clearSuggestions() {
//     _suggestions.clear();
//     notifyListeners();
//   }

//   /// Fetch LatLng for the entered address using Google Maps Geocoding API
//   Future<void> fetchLatLngFromAddress() async {
//     final address = _destinationController.text.trim();
//     Address = address; // -------------------stores the address into the Address
//     if (address.isEmpty) {
//       print("Address is empty");
//       return;
//     }
//     final url = Uri.parse(
//         'https://maps.googleapis.com/maps/api/geocode/json?address=${Uri.encodeComponent(address)}&key=$_apiKey');
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         if (data['status'] == 'OK' && data['results'].isNotEmpty) {
//           final location = data['results'][0]['geometry']['location'];
//           _destinationLatLng = LatLng(location['lat'], location['lng']);
//           latitude = location['lat']; //added
//           longitude = location['lng']; //added
//           print('LatLng: $_destinationLatLng');
//           notifyListeners();
//         } else {
//           print('No results found for the address.');
//         }
//       } else {
//         print('Error fetching LatLng: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Exception while fetching LatLng: $e');
//     }
//   }

//   void savedata() async {
//     await fetchLatLngFromAddress();

//     if (label == "Other" && customOption != null && customOption!.isNotEmpty) {
//       finalLabel = customOption;
//     } else {
//       finalLabel = label;
//     }

//     print("-----------------------------------------------------------");
//     print(finalLabel);
//     print(Address);
//     print(latitude);
//     print(longitude);
//     print("-----------------------------------------------------------");
//   }

//   Future<void> sendMyFav(BuildContext context) async {
//     var map = {
//       "label": finalLabel,
//       "address": Address,
//       "lat": latitude,
//       "lng": longitude
//     };

//     var favResult = await RiderRepo.addMyFav(map);

//     if (favResult != null && favResult['sucess']) {
//       Fluttertoast.showToast(msg: '${favResult['message']}');
//       notifyListeners();
//     } else {
//       if (favResult["message"] != null) {
//         Fluttertoast.showToast(msg: '${favResult['message']}');
//       }
//     }
//   }
// }
