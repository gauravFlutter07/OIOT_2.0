import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseTripFlow {
  static final FirebaseDatabase database = FirebaseDatabase.instance;
  static DatabaseEvent? tripFlowValue;
  static late DatabaseReference tripFlowReference;



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