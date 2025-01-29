import 'dart:developer';

import 'package:oiot/imports.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/wallet_bonus/model/wallet_bonus_model.dart';

class WalletBonusService {
  List<Map<String, dynamic>> walletBonusDataList = [
    {
      'id': 'WA132',
      'bonusAmount': '₹10',
      'expiryDate': '02-05-2024',
      'expiryTime': '07.45 AM',
      'isActive': true,
    },
    {
      'id': 'WA210',
      'bonusAmount': '₹15',
      'expiryDate': '30-06-2024',
      'expiryTime': '01.30 PM',
      'isActive': true,
    },
    {
      'id': 'WA345',
      'bonusAmount': '₹25',
      'expiryDate': '05-07-2024',
      'expiryTime': '04.15 PM',
      'isActive': true,
    },
    {
      'id': 'WA485',
      'bonusAmount': '₹15',
      'expiryDate': '08-07-2024',
      'expiryTime': '08.45 PM',
      'isActive': false,
    },
    {
      'id': 'WA412',
      'bonusAmount': '₹10',
      'expiryDate': '21-07-2024',
      'expiryTime': '10.00 AM',
      'isActive': false,
    },
  ];

  Dio dio = Dio();

  Future<List<WalletBonusModel>?> fetchWalletBonusData() async {
    try {
      int statusCode = 200;
      if (statusCode == 200) {
        List<WalletBonusModel> walletBonusData = walletBonusDataList
            .map((walletData) => WalletBonusModel.fromJson(walletData))
            .toList();

        return walletBonusData;
      } else {
        throw Exception('Failed to fetch wallet bonus data');
      }
    } catch (e) {
      log('Error fetching wallet bonus data: $e');
      return [];
    }
  }
}
