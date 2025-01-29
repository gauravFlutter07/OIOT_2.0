import '../../../../../imports.dart';

class OtherIssueProvider extends ChangeNotifier {
  File? _image;
  File? get image => _image;

  String? _selectedTicketIssue;
  String? get selectedTicketIssue => _selectedTicketIssue;

  final List<dynamic> _tickeIssueList = [
    'Mobile device issue',
    'Wallet issue',
    'Report issue',
    'Report issue',
    'Incentive issue',
    'Referral issue',
    'Trip issue',
    'Driver issue',
  ];
  List<dynamic> get tickeIssueList => _tickeIssueList;

  final TextEditingController _commentController = TextEditingController();
  TextEditingController get commentController => _commentController;

  String? commentValidation(String? commentValue, BuildContext context) {
    if (commentValue == null || commentValue.isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterYourComment;
    }
    return null;
  }

  setImage(File? imagenew, String? imageName) {
    if (imagenew == null) return;
    _image = imagenew;
    notifyListeners();
  }

  updateSelectedValue(String? newValue) {
    if (newValue == null) return;

    _selectedTicketIssue = newValue;
    notifyListeners();
  }
}
