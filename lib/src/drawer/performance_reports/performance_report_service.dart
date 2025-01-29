import '../../../imports.dart';

class ReportsService1 {
  Map<String, dynamic> reports = {
    "reports": {
      "Total Trips": [
        {"label": "Offline Booking", "value": 70, "color": "#3d5a80"},
        {"label": "Online Booking", "value": 30, "color": "#98c1d9"}
      ],
      "Total Cancelled trips": [
        {"label": "Rider Cancel", "value": 80, "color": "#3d5a80"},
        {"label": "Driver Cancel", "value": 20, "color": "#98c1d9"}
      ],
      "Total Scheduled trips": [
        {"label": "Daily", "value": 60, "color": "#3d5a80"},
        {"label": "Outstation", "value": 30, "color": "#98c1d9"},
        {"label": "Rental", "value": 10, "color": "#0081a7"}
      ],
      "Total Kms travelled": [
        {"label": "Daily", "value": 70, "color": "#3d5a80"},
        {"label": "Outstation", "value": 20, "color": "#98c1d9"},
        {"label": "Rental", "value": 10, "color": "#0081a7"}
      ],
      "Total trip Amount": [
        {"label": "Offline Booking", "value": 20, "color": "#3d5a80"},
        {"label": "Online Booking", "value": 80, "color": "#98c1d9"}
      ],
      "Total Facial verifications": [
        {"label": "Verified", "value": 80, "color": "#3d5a80"},
        {"label": "Rejected", "value": 20, "color": "#98c1d9"}
      ],
      "Total Days with OIOT": [
        {"label": "Onduty", "value": 75, "color": "#3d5a80"},
        {"label": "Offduty", "value": 25, "color": "#98c1d9"}
      ],
      "Total Wallet Added amount": [
        {"label": "Bank", "value": 85, "color": "#3d5a80"},
        {"label": "Other", "value": 15, "color": "#98c1d9"}
      ],
      "Total Coupons Claimed": [
        {"label": "Bank", "value": 55, "color": "#3d5a80"},
        {"label": "Other", "value": 45, "color": "#98c1d9"},
      ],
      "Total Wallet bonus received": [
        {"label": "Welcome Bonus", "value": 10, "color": "#3d5a80"},
        {"label": "Referral Bonus", "value": 30, "color": "#98c1d9"},
        {"label": "Coupon Bonus", "value": 7, "color": "#0081a7"},
        {"label": "Subscription Bonus", "value": 13, "color": "#ee6c4d"},
        {"label": "Wallet Bonus", "value": 22, "color": "#293241"},
        {"label": "Performance Bonus", "value": 18, "color": "#8e9aaf"}
      ],
      "Total Subscription": [
        {"label": "Bank", "value": 45, "color": "#3d5a80"},
        {"label": "Wallet", "value": 30, "color": "#98c1d9"},
        {"label": "OIOT Coin", "value": 25, "color": "#0081a7"},
      ],
      "Total Ratings": [
        {"label": "Customer Rated", "value": 90, "color": "#3d5a80"},
        {"label": "Driver Rated", "value": 10, "color": "#98c1d9"}
      ],
      "Total Top Ratings": [
        {"label": "1", "value": 10, "color": "#3d5a80"},
        {"label": "2", "value": 20, "color": "#98c1d9"},
        {"label": "3", "value": 30, "color": "#0081a7"},
        {"label": "4", "value": 25, "color": "#ee6c4d"},
        {"label": "5", "value": 15, "color": "#293241"},
      ],
      "Total Referral Bonus": [
        {"label": "Claimed", "value": 55, "color": "#3d5a80"},
        {"label": "Pending", "value": 20, "color": "#98c1d9"},
        {"label": "Expired", "value": 25, "color": "#0081a7"}
      ],
      "Total Tickets Raised": [
        {"label": "Ticket Resolved", "value": 80, "color": "#3d5a80"},
        {"label": "Ticket Active", "value": 20, "color": "#98c1d9"}
      ],
      "Discounts given": [
        {"label": "Distributor", "value": 50, "color": "#3d5a80"},
        {"label": "Promotion Offer", "value": 50, "color": "#98c1d9"}
      ],
      "Total working hours": [
        {"label": "Offline", "value": 25, "color": "#3d5a80"},
        {"label": "Online", "value": 75, "color": "#98c1d9"}
      ],
      "Total Password reset": [
        {"label": "Successfull", "value": 80, "color": "#3d5a80"},
        {"label": "Failed", "value": 20, "color": "#98c1d9"}
      ],
      "Total expense": [
        {"label": "Daily", "value": 60, "color": "#3d5a80"},
        {"label": "Rental", "value": 25, "color": "#98c1d9"},
        {"label": "Outstation", "value": 15, "color": "#98c1d9"}
      ],
      "Total wallet Transaction": [
        {"label": "Wallet Payments Received", "value": 85, "color": "#3d5a80"},
        {"label": "Wallet Payments Sent", "value": 15, "color": "#98c1d9"}
      ],
    }
  };

  Dio dio = Dio();
  Future<ReportDataModel?> fetchReport() async {
    // String reportUrl = "";

    try {
      // final response = await dio.get(reportUrl);
      int statusCode = 200;
      if (statusCode == 200) {
        final Map<String, dynamic> data = reports;
        return ReportDataModel.fromJson(data);
      } else {
        throw Exception('Failed to load report data');
      }
    } catch (e) {
      throw Exception('Error fetching report data: $e');
    }
  }
}
