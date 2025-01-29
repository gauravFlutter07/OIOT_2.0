import 'package:intl/intl.dart';
import '../../../../imports.dart';
import '../../../../models/city_list_modal.dart';
import '../../../../models/states_list_modal.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: editProfilePagePadding,
            child: Consumer<EditProfileProvider>(
              builder: (context, editprofileprovider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomHeader(
                      title: AppLocalizations.of(context)!.editProfile,
                    ),
                    height10,
                    InkWell(
                      onTap: () {
                        bottomSheet(
                          context: context,
                          isPdf: false,
                          provider: editprofileprovider,
                        );
                      },
                      child: editprofileprovider.image == null
                          ? Align(
                              alignment: centreAlignment,
                              child: Stack(
                                alignment: centreAlignment,
                                children: [
                                  Image.asset(
                                    avatar1,
                                    height: 150,
                                    width: 150,
                                  ),
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      shape: circleBoxShape,
                                      color: blackOpacity045,
                                    ),
                                  ),
                                  Image.asset(
                                    cameraImage,
                                    height: 40,
                                    width: 40,
                                  ),
                                ],
                              ),
                            )
                          : Align(
                              alignment: centreAlignment,
                              child: Stack(
                                alignment: centreAlignment,
                                children: [
                                  Container(
                                    height: 160,
                                    width: 160,
                                    decoration: BoxDecoration(
                                      shape: circleBoxShape,
                                      color: blackOpacity045,
                                    ),
                                    child: ClipOval(
                                      child: Image.file(
                                        editprofileprovider.image!,
                                        height: 160,
                                        width: 160,
                                        fit: boxfitCover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                    height10,
                    Align(
                      alignment: centreAlignment,
                      child: Text(
                        AppLocalizations.of(context)!.uploadThePicture,
                        style: tsRegularBold,
                      ),
                    ),
                    height10,
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: padding10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.firstName,
                                  style: tsRegularBold,
                                ),
                                height05,
                                CustomTextfield(
                                  maxlength: 10,
                                  textEditingController:
                                      editprofileprovider.firstname,
                                  isPass: false,
                                  hint:
                                      AppLocalizations.of(context)!.sruthihint,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: leftPadding10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.lastName,
                                  style: tsRegularBold,
                                ),
                                height05,
                                CustomTextfield(
                                  maxlength: 10,
                                  textEditingController:
                                      editprofileprovider.lastname,
                                  isPass: false,
                                  hint:
                                      AppLocalizations.of(context)!.agrawalhint,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      AppLocalizations.of(context)!.gender,
                      style: tsRegularBold,
                    ),
                    height05,
                    CustomDropdown(
                      options: [
                        AppLocalizations.of(context)!.male,
                        AppLocalizations.of(context)!.female,
                        AppLocalizations.of(context)!.preferNotToSay,
                      ],
                      selectedOption: editprofileprovider.selectedGender,
                      onChanged: (value) {
                        editprofileprovider.setSelectedGender(value);
                      },
                      hint: AppLocalizations.of(context)!.male,
                    ),
                    height10,
                    Text(
                      AppLocalizations.of(context)!.dateOfBirth,
                      style: tsRegularBold,
                    ),
                    height10,
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: circularBorderRadius8,
                        border: Border.all(
                          color: lightGreyColor,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (pickedDate != null) {
                            editprofileprovider.setSelectedDate(pickedDate);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: whiteColor,
                          elevation: 0,
                        ),
                        child: Padding(
                          padding: verticalPadding12,
                          child: Row(
                            children: [
                              Text(
                                editprofileprovider.selectedDate != null
                                    ? DateFormat('dd-MM-yyyy').format(
                                        editprofileprovider.selectedDate!)
                                    : AppLocalizations.of(context)!.selectDate,
                                style: TextStyle(
                                  fontSize: 16,
                                  color:
                                      editprofileprovider.selectedDate != null
                                          ? blackColor
                                          : textGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    height10,
                    Text(
                      AppLocalizations.of(context)!.mobileNumber,
                      style: tsRegularBold,
                    ),
                    height05,
                    CustomMobileField(
                      maxlength: 10,
                      controller: editprofileprovider.mobilenumber,
                    ),
                    height05,
                    Text(
                      AppLocalizations.of(context)!.alternativeMobileNumber,
                      style: tsRegularBold,
                    ),
                    height05,
                    CustomMobileField(
                      maxlength: 10,
                      controller: editprofileprovider.alternativeMobile,
                    ),
                    height10,
                    Text(
                      AppLocalizations.of(context)!.emailAddress,
                      style: tsRegularBold,
                    ),
                    height05,
                    CustomTextfield(
                      textEditingController: editprofileprovider.emailID,
                      isPass: false,
                      hint: AppLocalizations.of(context)!.sruthigmailcomhint,
                    ),
                    height10,
                    Text(
                      AppLocalizations.of(context)!.address,
                      style: tsRegularBold,
                    ),
                    height05,
                    CustomTextfield(
                      maxlength: 25,
                      textEditingController: editprofileprovider.address,
                      isPass: false,
                      hint: AppLocalizations.of(context)!
                          .friendsNagarBangalorehint,
                    ),
                    height10,
                    Text(
                      AppLocalizations.of(context)!.state,
                      style: tsRegularBold,
                    ),
                    height05,
                    DropdownButtonFormField<StateListModal>(
                      items: editprofileprovider.states.map((StateListModal state) {
                        return DropdownMenuItem(value: state, child: Text(state.name??''));
                      }).toList(),
                      hint: const Text('Select a state'),
                      value: editprofileprovider.state,
                      onChanged: (value) {
                        editprofileprovider.selectedState = value!;

                        editprofileprovider.getCity(value.createUserSuccessModalId!);
                      },
                      validator: (StateListModal? value) {
                        if (value == null || value.id==null) {
                          return AppLocalizations.of(context)!.karnatakahint;
                        }
                        return null;
                      },
                    ),
                    height10,
                    Text(
                      AppLocalizations.of(context)!.city,
                      style: tsRegularBold,
                    ),
                    height05,
                    DropdownButtonFormField<CityListModal>(
                      items: editprofileprovider.cities.map((CityListModal state) {
                        return DropdownMenuItem(value: state, child: Text(state.name??''));
                      }).toList(),
                      hint: const Text('Select a city'),
                      value: editprofileprovider.selectedCity,
                      onChanged: (value) {
                        editprofileprovider.selectedCity = value!;

                      },
                      validator: (CityListModal? value) {
                        if (value == null || value.id==null) {
                          return AppLocalizations.of(context)!.bangalorehint;
                        }
                        return null;
                      },
                    ),
                    height25,
                    CustomButtonOnlyBorder(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddBankDetails(),
                          ),
                        );
                      },
                      title: AppLocalizations.of(context)!.addNBankAccount,
                      optionalTextColor: blackColor,
                      border: true,
                    ),
                    height15,
                    CustomButton(
                      onTap: () async {
                        editprofileprovider.postEditProfile(context);
                      },
                      title: AppLocalizations.of(context)!.saveChanges,
                      border: true,
                    ),
                    height15,
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
