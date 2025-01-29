import 'dart:developer';

import '../../../../imports.dart';

class WalletService {
  List<Map<String, dynamic>> walletDataList = [
    {
      "totalBalance": "₹5000",
      "walletHistoryId": "ABV856205",
      "walletHistoryAmount": "₹350.00",
      "walletHistoryStatus": "Successfull",
      "walletHistoryDate": "09 Nov 2023",
      "walletHistoryTime": "10.45 AM",
      "purpose": "Trip Bonus",
    },
    {
      "totalBalance": "₹7000",
      "walletHistoryId": "XYZ123456",
      "walletHistoryAmount": "₹500.00",
      "walletHistoryStatus": "Successfull",
      "walletHistoryDate": "15 Dec 2023",
      "walletHistoryTime": "11.30 AM",
      "purpose": "Referral Bonus",
    },
  ];

  String getWalletUrl = 'api/wallet';

  Dio dio = Dio();

  Future<List<WalletDataModel>?> fetchWalletData() async {
    try {
      int statusCode = 200;
      if (statusCode == 200) {
        List<WalletDataModel> walletList = walletDataList
            .map((walletData) => WalletDataModel.fromJson(walletData))
            .toList();
        return walletList;
      } else {
        throw Exception('Failed to fetch wallet data');
      }
    } catch (e) {
      log('Error fetching wallet data: $e');
      return [];
    }
  }
}
