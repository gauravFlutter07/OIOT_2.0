// ignore_for_file: use_build_context_synchronously

import '../../../../imports.dart';

class UpdateKycProvider extends ChangeNotifier {
  UpdateKycService updateKycService = UpdateKycService();

  final TextEditingController _panNumber = TextEditingController();
  final TextEditingController _aadharNumber = TextEditingController();
  String _selectedDocument = 'Aadhaar';

  File? _panImage;
  File? _panPdf;
  File? _aadharImage;
  File? _aadharpdf;
  String? selectedPdfPancard;
  String? selectedPdfAdhar;

  File? get panImage => _panImage;
  File? get panPdf => _panPdf;
  File? get aadharImage => _aadharImage;
  File? get aadharpdf => _aadharpdf;

  TextEditingController get panNumber => _panNumber;
  TextEditingController get aadharNumber => _aadharNumber;

  String get selectedDocument => _selectedDocument;
  set selectedDocument(String value) {
    _selectedDocument = value;
    notifyListeners();
  }

  getLastPdfPathName(dynamic pdfName) {
    File? pdfVarName;
    if (pdfName == 'panCard') {
      pdfVarName = _panPdf;
    } else if (pdfName == 'adhar') {
      pdfVarName = _aadharpdf;
    }
    final uri = Uri.parse(pdfVarName.toString());
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;

    if (pdfName == 'panCard') {
      selectedPdfPancard = lastPathSegment;
    } else if (pdfName == 'adhar') {
      selectedPdfAdhar = lastPathSegment;
    }
  }

  setImage(File? image, String? imageName) {
    log('Image Name : $imageName');
    if (imageName == 'panCard') {
      _panImage = image;
      notifyListeners();
    } else if (imageName == 'adhar') {
      _aadharImage = image;
      notifyListeners();
    }
  }

  setPdf(File? pdf, String? typeName) {
    if (pdf == null) {
      return;
    }
    if (typeName == 'panCard') {
      _panPdf = pdf;
      log('pdf: $_panPdf');
      notifyListeners();
    } else if (typeName == 'adhar') {
      _aadharpdf = pdf;
      notifyListeners();
    }
  }

  setImageNull(String typeName) {
    if (typeName == 'panCard') {
      _panImage = null;
      notifyListeners();
    } else if (typeName == 'adhar') {
      _aadharImage = null;
      notifyListeners();
    }
  }

  void log(String s) {}

  clearAllKycTextControllers() {
    panNumber.clear();
    aadharNumber.clear();
    log('message: update kyc controllers cleared');
  }

  Future<bool> addKycData(BuildContext context) async {
    UpdateKycModel data = UpdateKycModel(
      aadharNumber: _aadharNumber.text,
      panNumber: _panNumber.text,
      aadhar: _aadharImage,
      panCard: _panImage,
    );

    final result = await updateKycService.postKycData(data);

    if (result != null && result['status'] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.kycUpdatedSuccessfully,
          ),
          duration: const Duration(
            seconds: 2,
          ),
        ),
      );
      await Future.delayed(const Duration(seconds: 2));
      Fluttertoast.showToast(msg: '${result['message']}');
      return true;
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong');
      return false;
    }
  }
}
