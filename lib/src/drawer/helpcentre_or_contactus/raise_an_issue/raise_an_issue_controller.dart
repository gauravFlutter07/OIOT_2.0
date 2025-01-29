import 'package:flutter/foundation.dart';
import 'package:oiot/api/rider_repo.dart';
import 'package:oiot/main.dart';

import '../../../../imports.dart';

class RaiseIssueProvider extends ChangeNotifier {
  final TextEditingController _remarkController = TextEditingController();
  File? _issuePic;
  File? _issuePdf;
  String? selectedPdfLastPath;
  File? get issuePic => _issuePic;
  File? get issuePdf => _issuePdf;

  bool _isAppIssueClicked = false;
  bool get isAppIssueClicked => _isAppIssueClicked;

  bool _isRideIssueClicked = false;
  bool get isRideIssueClicked => _isRideIssueClicked;

  bool _isRouteIssueClicked = false;
  bool get isRouteIssueClicked => _isRouteIssueClicked;

  bool _isPayementIssueClicked = false;
  bool get isPaymentIssueClicked => _isPayementIssueClicked;

  TextEditingController get remarkController => _remarkController;

  String? _selectedIssue;

  String? get selectedIssue => _selectedIssue;

  onAppIssueClickedFunction() {
    _isAppIssueClicked = !_isAppIssueClicked;

    _isRouteIssueClicked = false;
    _isPayementIssueClicked = false;
    _isRideIssueClicked = false;
    _selectedIssue = "App Issue";
    notifyListeners();

  }

  onRideIssueClickedFunction() {
    _isRideIssueClicked = !_isRideIssueClicked;
    _selectedIssue = "Ride Issue";

    _isRouteIssueClicked = false;
    _isPayementIssueClicked = false;
    _isAppIssueClicked = false;
    notifyListeners();
  }

  onRouteIssueClicked() {
    _isRouteIssueClicked = !_isRouteIssueClicked;
    _selectedIssue = "Route Issue";

    _isRideIssueClicked = false;
    _isPayementIssueClicked = false;
    _isAppIssueClicked = false;
    notifyListeners();

  }

  onPaymentClickedFunction() {
    _isPayementIssueClicked = !_isPayementIssueClicked;
    _selectedIssue = "Payment Issue";

    _isRideIssueClicked = false;
    _isAppIssueClicked = false;
    _isRouteIssueClicked = false;
    notifyListeners();

  }

  disableIssue(List<bool> data){
    data.where((e)=> e=!e).toList();
    notifyListeners();
  }

  String? remarkValidation(String? remarkValue) {
    if (remarkValue == null || remarkValue.isEmpty) {
      return 'Please enter your remarks';
    }
    return null;
  }

  getLastPdfPathName() {
    final uri = Uri.parse(_issuePdf.toString());
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    log(' last path: ${pathSegments.last}');
    log('message : ${lastPathSegment.toString()}');
    selectedPdfLastPath = lastPathSegment;
  }

  setImage(File? image, String? imageName) {
    if (imageName == null) {
      _issuePic = image;
      notifyListeners();
    }
  }

  setPdf(File? pdf, String? pdfName) {
    if (pdf == null) {
      return;
    }
    _issuePdf = pdf;
    notifyListeners();
  }

  setImageNull() {
    _issuePic = null;
    notifyListeners();
  }

  void log(String s) {}


  void sendIssue(BuildContext context) async{
    final passProvider = Provider.of<AddBankAccountProvider>(context, listen: false);

    if(passProvider.passbookImage == null && passProvider.passbookPdf == null){
      Fluttertoast.showToast(
        msg: 'Please upload files ',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }

    try {
      var map  = FormData.fromMap({
        'blobName': await MultipartFile.fromFile((passProvider.passbookImage?.path ?? passProvider.passbookPdf?.path)!),
        "issue": selectedIssue,
        "remark": remarkController.text,
        "tripId": "",
        "raisedById": Utils().getDecodedToken()["id"],
        "driverId": "",

      });
      final result = await RiderRepo.submitSupport(map);

      if (result != null)  {

      } else {
        Fluttertoast.showToast(
          msg: 'Something went wrong',
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
