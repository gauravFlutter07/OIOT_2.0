import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:oiot/src/drawer/community/community_page_service.dart';
import 'package:oiot/src/drawer/community/model/community_model.dart';

class CommunityProvider extends ChangeNotifier {
  final CommunityService _service = CommunityService();
  CommunityModel? _communityModel;

  CommunityModel? get communityModel => _communityModel;

  Future<void> fetchCommunityData() async {
    try {
      _communityModel = await _service.fetchReport();
      notifyListeners();
    } catch (e) {
      log('Error fetching community data: $e');
    }
  }
}
