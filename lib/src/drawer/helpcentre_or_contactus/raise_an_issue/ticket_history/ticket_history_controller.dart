import '../../../../../imports.dart';

class TicketHistoryProvider extends ChangeNotifier {
  List<TicketHistoryModel> _ticketHistoryList = [];
  List<TicketHistoryModel> get ticketHistoryList => _ticketHistoryList;

  String _selectedStatus = 'All';
  String get selectedStatus => _selectedStatus;

  TicketHistoryProvider() {
    fetchTicketHistoryDetails();
  }

  Future<void> fetchTicketHistoryDetails() async {
    TicketHistoryService ticketHistoryService = TicketHistoryService();
    List<TicketHistoryModel> result =
        await ticketHistoryService.fetchTicketHistoryData();
    _ticketHistoryList = result;
    notifyListeners();
  }

  void updateSelectedStatus(String? status) {
    if (status != null) {
      _selectedStatus = status;
      notifyListeners();
    }
  }
}
