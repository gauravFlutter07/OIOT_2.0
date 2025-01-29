import 'package:oiot/imports.dart';

class FeedBackDriverProvider extends ChangeNotifier {
  final TextEditingController _remarkController = TextEditingController();

  bool _isCleanlinessClicked = false;
  bool get isCleanlinessClicked => _isCleanlinessClicked;

  onCleanlinessClickedFunction() {
    _isCleanlinessClicked = !_isCleanlinessClicked;
    notifyListeners();
  }

// ---------------------------------------
  bool _isBehaviourClicked = false;
  bool get isBehaviourClicked => _isBehaviourClicked;

  onBehaviourClickedFunction() {
    _isBehaviourClicked = !_isBehaviourClicked;
    notifyListeners();
  }
// -------------------------------------

  bool _isNavigationClicked = false;
  bool get isNavigationClicked => _isNavigationClicked;

  onNavigationClicked() {
    _isNavigationClicked = !_isNavigationClicked;
    notifyListeners();
  }

// ---------------------------------------
  bool _pricingClicked = false;
  bool get pricingClicked => _pricingClicked;

  onpricingClickedFunction() {
    _pricingClicked = !_pricingClicked;
    notifyListeners();
  }
// --------------------------------------

  bool _mobileEngagementClicked = false;
  bool get mobileEngagementClicked => _mobileEngagementClicked;

  onMobileEngagementClickedFunction() {
    _mobileEngagementClicked = !_mobileEngagementClicked;
    notifyListeners();
  }

// ----------------------------------------

  bool _isPickupIssueClicked = false;
  bool get isPickupIssueClicked => _isPickupIssueClicked;

  onPickUpIssueClickedFunction() {
    _isPickupIssueClicked = !_isPickupIssueClicked;
    notifyListeners();
  }

// ----------------------------------------

  bool _isCabClicked = false;
  bool get isCabClicked => _isCabClicked;

  onCabClickedIssueClickedFunction() {
    _isCabClicked = !_isCabClicked;
    notifyListeners();
  }

// ----------------------------------------

  bool _isSmoothDrivingClicked = false;
  bool get isSmoothDrivingClicked => _isSmoothDrivingClicked;

  onSmoothDrivingClickedFunction() {
    _isSmoothDrivingClicked = !_isSmoothDrivingClicked;
    notifyListeners();
  }

// ----------------------------------------

  bool _isRouteKnowledgeClicked = false;
  bool get isRouteKnowledgeClicked => _isRouteKnowledgeClicked;

  onRouteKnowledgeClickedFunction() {
    _isRouteKnowledgeClicked = !_isRouteKnowledgeClicked;
    notifyListeners();
  }

// ----------------------------------------

  bool _isWhileDrivingClicked = false;
  bool get isWhileDrivingClicked => _isWhileDrivingClicked;

  onWhileDrivingClickedFunction() {
    _isWhileDrivingClicked = !_isWhileDrivingClicked;
    notifyListeners();
  }

// ----------------------------------------

  TextEditingController get remarkController => _remarkController;
  String? remarkValidation(String? remarkValue) {
    if (remarkValue == null || remarkValue.isEmpty) {
      return 'Please enter your remarks';
    }
    return null;
  }
}
