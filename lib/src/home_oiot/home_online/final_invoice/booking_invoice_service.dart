import 'dart:developer';
import '../../../../imports.dart';

class BookingInvoiceService {
  Map<String, dynamic> bookingInvoiceData = {
    "bookingId": "OIOT00143",
    "startDate": "09 Mar 2024",
    "startTime": "10.00 AM",
    "endDate": "09 Mar 2024",
    "endTime": "11.00 AM",
    "amountTobePaid": "₹350.00",
    "driverName": "Narayanan",
    "profileId": "AB1234567",
    "vehicleRegNo": "KAAB5620",
    "vehicleType": "HatchBack",
    "seatingCapacity": "4",
    "vehicleColor": "Black",
    "panNo": "ABHS456135",
    "gstNo": "ABNVC4568713",
    "customerId": "Ajeesh",
    "customerPan": "BHSNK654848",
    "customerGst": "ABCH654632HJ",
    "customerAdress": "Bangalore",
    "modeofBooking": "Online",
    "pickUpLocation": "JP Nagar",
    "dropLocation": "Satellite Bus Stand",
    "serviceType": "Daily Ride",
    "basePrice": "₹50.00",
    "package": "5 Km x 20 min - Minimum",
    "extraKm": "15 Km",
    "extraTime": "2",
    "totalDistance": "10 Km",
    "totalRidingTime": "1.00 hrs",
    "totalBataCount": "2",
    "dayBata": "₹400.00",
    "nightBata": "₹900.00",
    "totalCharges": "₹250.00",
    "gst": "₹12.00",
    "sgst": "₹15.00",
    "driverDiscount": "₹120.00",
    "convCharges": "₹150.00",
    "payableAmount": "₹350.00",
    "promotionalDiscound": "₹50.00",
    "driverRating": "4",
  };

  String bookingInvoiceUrl = "api/bookingInvoiceUrl";
  Dio dio = Dio();

  Future<BookingInvoiceModel?> fetchInvoiceBooking() async {
    try {
      // Response response = await dio.get(bookingInvoiceUrl);
      int statuscode = 200;
      if (statuscode == 200) {
        dynamic result = BookingInvoiceModel.fromJson(bookingInvoiceData);
        return result;
      } else {
        throw Exception('Failed to fetch booking invoice data');
      }
    } catch (e) {
      log('Error fetching booking invoice data: $e');
      return null;
    }
  }
}
