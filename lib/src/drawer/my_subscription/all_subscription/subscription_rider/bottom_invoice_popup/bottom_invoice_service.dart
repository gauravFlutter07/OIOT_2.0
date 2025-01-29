import 'dart:developer';

import '../../../../../../imports.dart';

class InvoiceService {
  final Map<String, dynamic> subscriptionInvoice = {
    'invoiceId': 'OIOT00012',
    'startDate': '09 Nov, 2023 | 11:30 AM',
    'endDate': '09 Nov, 2023 | 11:30 AM',
    'businessName': 'Ajeesh Das',
    'panNumber': 'APHKH5425C',
    'gstNumber': 'GSTA1234656',
    'totalCharges': '₹840.0',
    'gstAmount': '₹60.0',
    'couponDiscount': '₹150.0',
    'pgCharges': '₹30',
    'bankCharges': '₹20',
    'roundOff': '₹10',
    'PaymentMode': 'Cash',
    'PaidAmount': '₹1050',
  };

  String getInvoiceUrl = 'api/invoice';

  Dio dio = Dio();

  Future<SubscriptionInvoiceModel?> fetchSubscriptionInvoice() async {
    try {
      // Response response = await dio.get(getInvoiceUrl);

      int statuscode = 200;
      if (statuscode == 200) {
        dynamic result = SubscriptionInvoiceModel.fromJson(subscriptionInvoice);
        return result;
      } else {
        throw Exception('Failed to fetch subscription invoice data');
      }
    } catch (e) {
      log('Error fetching profile data: $e');
      return null;
    }
  }
}
