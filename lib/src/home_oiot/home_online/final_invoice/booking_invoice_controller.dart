import 'dart:developer';
import '../../../../imports.dart';

class BookingProvider extends ChangeNotifier {
  int _selectedOption = 0;
  bool billingDetail = false;
  bool container1state = false;
  bool container2state = false;
  bool container3state = false;

  int get selectedOption => _selectedOption;
  bool get isBillingDetail => billingDetail;
  bool get isContainer1Expanded => container1state;
  bool get isContainer2Expanded => container2state;
  bool get isContainer3Expanded => container3state;

  BookingInvoiceModel? _bookingInvoiceModel;
  BookingInvoiceModel? get bookingInvoiceModel => _bookingInvoiceModel;

  BookingProvider() {
    fetchInvoiceBooking();
  }

  void setSelectedOption(int option) {
    _selectedOption = option;
    notifyListeners();
  }

  void toggleBillingDetail() {
    billingDetail = !billingDetail;
    container1state = !container1state;
    container2state = !container2state;
    container3state = !container3state;
    notifyListeners();
  }

  void toggleContainer1State() {
    container1state = !container1state;
    notifyListeners();
  }

  void toggleContainer2State() {
    container2state = !container2state;
    notifyListeners();
  }

  void toggleContainer3State() {
    container3state = !container3state;
    notifyListeners();
  }

  Future<void> fetchInvoiceBooking() async {
    BookingInvoiceService bookingInvoiceService = BookingInvoiceService();

    final result = await bookingInvoiceService.fetchInvoiceBooking();

    if (result != null) {
      _bookingInvoiceModel = result;
      log(_bookingInvoiceModel!.driverName.toString());
      notifyListeners();
    }
  }

  Future<void> shareFunction() async {
    await FlutterShare.share(
      title: 'Share via',
      text: 'Thank you for sharing oiot',
      chooserTitle: 'Share via',
    );
  }
}
