import '../../../imports.dart';

class ReportProvider1 extends ChangeNotifier {
  ReportsService1 reportsService1 = ReportsService1();
  Map<String, List<Report>> _dataMap = {};
  Map<String, List<Report>> get dataMap => _dataMap;
  DateTime? startDate;
  DateTime? endDate;

  String? _selectedReport;
  String? get selectedReport => _selectedReport;

  DateTimeRange? _selectedDateRange;
  DateTimeRange? get selectedDateRange => _selectedDateRange;

  void clearDateRange() {
    _selectedDateRange = null;
    startDate = null;
    endDate = null;
    notifyListeners();
  }

  void setSelectedDateRange(DateTimeRange? range) {
    _selectedDateRange =
        range ?? DateTimeRange(start: DateTime.now(), end: DateTime.now());
    notifyListeners();
  }

  void setDateRange(DateTime? start, DateTime? end) {
    startDate = start;
    endDate = end;
    notifyListeners();
  }

  ReportProvider1() {
    fetchReportData();
  }

  void selectReport(String? report) {
    _selectedReport = report;
    notifyListeners();
  }

  Future<void> fetchReportData() async {
    final result = await reportsService1.fetchReport();

    if (result != null) {
      _dataMap = result.reports;
      if (_dataMap.isNotEmpty) {
        _selectedReport = _dataMap.keys.first;
      }
      notifyListeners();
    }
  }
}
