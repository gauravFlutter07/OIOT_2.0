import '../../../../../../imports.dart';

class BottomInvoiceProvider extends ChangeNotifier {
  BottomInvoiceProvider() {
    fetchSubInvoice();
  }
  SubscriptionInvoiceModel? mySubscriptionInvoiceDetails;

  Future fetchSubInvoice() async {
    InvoiceService invoiceService = InvoiceService();

    final SubscriptionInvoiceModel? result =
        await invoiceService.fetchSubscriptionInvoice();

    if (result != null) {
      mySubscriptionInvoiceDetails = result;
      notifyListeners();
    }
  }
}
