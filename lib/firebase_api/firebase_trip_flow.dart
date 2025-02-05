import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseTripFlow {
  static final FirebaseDatabase database = FirebaseDatabase.instance;
  static DatabaseEvent? tripFlowValue;
  static late DatabaseReference tripFlowReference;

  static Future<void> initializeTripFlow(context) async {
    try {
      // Initialize Firebase Realtime Database
       database.setPersistenceEnabled(true);

      // Get trip ID from shared preferences
      final prefs = await SharedPreferences.getInstance();
      const String tripId = "3759";

      if (tripId == null) {
        throw Exception('Trip ID not found');
      }

       DatabaseReference ref = FirebaseDatabase.instance.ref();

       // Create database reference
      tripFlowReference = ref.child('trips_data').child(tripId);

      // Add value event listener
      tripFlowReference.onValue.listen((event) {
        if (event.snapshot.value == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Trip data not found')),
          );
          return;
        }

        try {
          final Map<dynamic, dynamic> data = event.snapshot.value as Map;

          print("Status :- ${data['status']}");
          // Handle status changes
          final String? status = data['status'];
          if (status != null && status != "0") {
            // Constants.flowStatus = status;
            _handleTripFlowStatus(context, status);
          }

          // Handle driver token
          final String? driverToken = data['driver_token'];
          if (driverToken != null && driverToken != '0') {
            // Constants.driverToken = driverToken;
            print("Driver token :- $driverToken");
          }
        } catch (e) {
          debugPrint('Error processing trip data: $e');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error processing trip data: $e')),
          );
        }
      }, onError: (error) {
        debugPrint('Database error: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Database error: $error')),
        );
      });
    } catch (e) {
      debugPrint('Error initializing trip flow: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error initializing trip flow: $e')),
      );
    }
  }

  static void _handleTripFlowStatus(BuildContext context, String status) {
    switch (status) {
      case 'pending':
      // Handle pending status
        break;
      case 'in_progress':
      // Handle in progress status
        break;
      case 'completed':
      // Handle completed status
        break;
      default:
      // Handle unknown status
        break;
    }
  }

  static void dispose() {
    // tripFlowValue?.cl
  }
}