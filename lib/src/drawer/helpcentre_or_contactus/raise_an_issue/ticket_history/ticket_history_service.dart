import 'dart:developer';

import '../../../../../imports.dart';

class TicketHistoryService {
  List<Map<String, dynamic>> ticketHistoryDataList = [
    {
      "ticketId": "ABC1235",
      "dateTime": "16 April 2024, 05.00 PM",
      "isPending": true,
      "issueCategory": "App Issue",
      "remarks": "Test",
    },
    {
      "ticketId": "DEF5678",
      "dateTime": "05 March 2024, 08.00 PM",
      "isPending": false,
      "issueCategory": "Ride Issue",
      "remarks": "Test",
    },
    {
      "ticketId": "KIL1298",
      "dateTime": "05 Nov 2023, 06.00 PM",
      "isPending": false,
      "issueCategory": "Route Issue",
      "remarks": "Test",
    },
  ];

  String ticketHistoryUrl = 'api/ticketHistory';

  Future<List<TicketHistoryModel>> fetchTicketHistoryData() async {
    try {
      int statusCode = 200;
      if (statusCode == 200) {
        List<TicketHistoryModel> ticketHistoryList = ticketHistoryDataList
            .map((ticketdata) => TicketHistoryModel.fromJson(ticketdata))
            .toList();
        return ticketHistoryList;
      } else {
        throw Exception('Failed to fetch ticket history data');
      }
    } catch (e) {
      log('Error fetching ticket history data: $e');
      return [];
    }
  }
}
