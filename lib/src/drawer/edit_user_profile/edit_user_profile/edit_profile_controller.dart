import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../api/rider_repo.dart';
import '../../../../imports.dart';
import '../../../../models/city_list_modal.dart';
import '../../../../models/states_list_modal.dart';

class EditProfileProvider extends ChangeNotifier {
  EditProfileService editProfileService = EditProfileService();

  File? _image;
  File? get image => _image;

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();
  final TextEditingController _alternativeMobile = TextEditingController();
  final TextEditingController _emailID = TextEditingController();
  final TextEditingController _address = TextEditingController();
  // final TextEditingController _state = TextEditingController();
  final TextEditingController _dob = TextEditingController();

  StateListModal? _selectedState;
  List<StateListModal> _states= List.empty(growable: true);

  CityListModal? _selectedCity;
  List<CityListModal> _cities = List.empty(growable: true);


  TextEditingController get firstname => _firstName;
  TextEditingController get lastname => _lastName;
  TextEditingController get mobilenumber => _mobileNumber;
  TextEditingController get emailID => _emailID;
  TextEditingController get address => _address;
  TextEditingController get dob => _dob;
  TextEditingController get alternativeMobile => _alternativeMobile;

  StateListModal? get state => _selectedState;
  CityListModal? get selectedCity => _selectedCity;


  List<CityListModal> get cities => _cities;


  set selectedCity(CityListModal? value) {
    _selectedCity = value;
  }

  set selectedState(StateListModal? value) {
    _selectedState = value;
    notifyListeners();
  }

  List<StateListModal> get states => _states;

  EditProfileProvider(){
    getStates();
  }


  String? _selectedGender = 'Male';
  String? get selectedGender => _selectedGender;

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;

  void setSelectedGender(String gender) {
    log('mmm: $gender');
    _selectedGender = gender;
    notifyListeners();
  }

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  String? firstNameValidation(String? firstnameValue, BuildContext context) {
    if (firstnameValue == null || firstnameValue.isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterFirstName;
    }
    return null;
  }

  String? secondNameValidation(String? secondnameValue, BuildContext context) {
    if (secondnameValue == null || secondnameValue.isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterSecondName;
    }
    return null;
  }

  String? mobileNumberValidation(String? mobileValue, BuildContext context) {
    if (mobileValue == null || mobileValue.isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterTenDigitMobileNumber;
    }
    return null;
  }

  String? emailIDValidation(String? emailIDValue, BuildContext context) {
    if (emailIDValue == null || emailIDValue.isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterEmailId;
    }
    return null;
  }

  String? addressValidation(String? addressValue, BuildContext context) {
    if (addressValue == null || addressValue.isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterAddress;
    }
    return null;
  }

  setImage(File? imagenew, String? imageName) {
    if (imagenew == null) return;
    _image = imagenew;
    notifyListeners();

    postProfilePicture();
  }

  clearAllTextControllers() {
    firstname.clear();
    lastname.clear();
    mobilenumber.clear();
    emailID.clear();
    address.clear();

    selectedState = null;
    selectedCity = null;
    _selectedDate = null;

    // state.clear();
    // city.clear();
    alternativeMobile.clear();
    log('message: edit profilecontrollers cleared');
  }

  Future<bool> postEditProfile(BuildContext context) async {

    var dob = DateFormat("dd-MM-yyyy").format(selectedDate??DateTime.now());

    EditProfileModel data = EditProfileModel(
      firstName: _firstName.text,
      lastName: _lastName.text,
      alternativeMobileNumber: _alternativeMobile.text,
      dob: dob,
      mobileNumber: _mobileNumber.text,
      email: _emailID.text,
      address: _address.text,
      state: _selectedState?.value??"",
      city: _selectedCity?.cityListModalId?.toString()??'',
      gender: _selectedGender ?? 'Male',
      photo: _image,
      id: Utils().getDecodedToken()["id"],
      cityName: _selectedCity?.name??''
    );

    log(data.toJson().toString());


    try {
      final result =  await RiderRepo.updateProfile(data.toJson());

      if (result != null) {
        Navigator.pushNamed(context, RouteClass.userOfflineHome);
        clearAllTextControllers();

        Fluttertoast.showToast(msg: '${result['message']}');
        notifyListeners();
        return true;
      }else{
        // Fluttertoast.showToast(msg: 'Something went wrong');
        if(result["message"]!=null){
          Fluttertoast.showToast(msg: '${result['message']}');
        }
        return false;
      }
    } on Exception catch (e) {
      e.printError();
      return false;
    }

    /*final result = await editProfileService.postEditProfile(data);

    if (result != null && result['status'] == true) {
      await Future.delayed(const Duration(seconds: 2));

      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, RouteClass.userOfflineHome);
      clearAllTextControllers();

      Fluttertoast.showToast(msg: '${result['message']}');
      return true;
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong');
      return false;
    }*/
  }

  postProfilePicture() async {
    


    final result =  await RiderRepo.uploadProfilePicture(image, "profileImage");

    if (result != null && result['success'] == true) {


      Fluttertoast.showToast(msg: '${result['message']}');

    }else{
      if(result["message"]!=null){
        Fluttertoast.showToast(msg: '${result['message']}');
      }
    }
  }

  void getStates() async{

    try {
      final result =  await RiderRepo.getStates(null);

      if (result != null) {
        _states = createUserSuccessModalFromMap(jsonEncode(result));
        notifyListeners();
      }else{
        if(result["message"]!=null){
          Fluttertoast.showToast(msg: '${result['message']}');
        }
      }
    } on Exception catch (e) {
      e.printError();
    }

  }

  void getCity(String stateId) async{

    try {
      final result =  await RiderRepo.getCity(stateId);

      if (result != null) {
        _cities = cityListModalFromMap(jsonEncode(result));
        notifyListeners();
      }else{
        if(result["message"]!=null){
          Fluttertoast.showToast(msg: '${result['message']}');
        }
      }
    } on Exception catch (e) {
      e.printError();
    }

  }

}
