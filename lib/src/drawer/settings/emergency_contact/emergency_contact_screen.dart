import 'package:oiot/widgets/material_alert_dialogue.dart';
import '../../../../imports.dart';

class EmergencyContactPage extends StatelessWidget {
  const EmergencyContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emergencyProvider = Provider.of<EmergencyProvider>(context);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: Consumer<EmergencyProvider>(
          builder: (BuildContext context, provider, Widget? child) {
            List<EmergencyContactModel> emergencyContactList =
                provider.emergencyContact;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: padding8,
                    child: CustomHeader(
                        title: AppLocalizations.of(context)!.emergencyContact),
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: emergencyContactList.length,
                      itemBuilder: (context, index) {
                        EmergencyContactModel emergencyContact =
                            emergencyContactList[index];
                        return Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: blueGreyshade50,
                                child: customTextWidget(
                                  text: emergencyContact.name[0].toUpperCase(),
                                  size: 20.0,
                                  color: blackColor,
                                  weight: FontWeight.bold,
                                ),
                              ),
                              title: customTextWidget(
                                text: emergencyContact.name,
                                size: 16.0,
                                color: blackColor,
                                weight: FontWeight.normal,
                              ),
                              subtitle: customTextWidget(
                                text: emergencyContact.phoneNumber,
                                size: 18.0,
                                color: blackColor,
                                weight: FontWeight.w500,
                              ),
                              trailing: CircleAvatar(
                                backgroundColor: redShade100,
                                child: IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const MaterialAlertDialog();
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    Icons.delete_outline_rounded,
                                    color: redColor,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                customTextWidget(
                                  text: AppLocalizations.of(context)!
                                      .alwaysShareYourRideDetails,
                                  size: 15.0,
                                  color: blackColor,
                                  weight: FontWeight.normal,
                                ),
                                Switch(
                                  inactiveTrackColor: lightGrey,
                                  inactiveThumbColor: grey800,
                                  value: emergencyContact.switchState,
                                  onChanged: (value) {
                                    provider.setSwitchState(index, value);
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: padding8,
                    child: Form(
                      key: formKey,
                      child: Padding(
                        padding: padding8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              color: whiteColor,
                              child: Padding(
                                padding: padding8,
                                child: Text(AppLocalizations.of(context)!
                                    .youCanOnlySaveTwoContactsAsEmergencyContact),
                              ),
                            ),
                            height10,
                            Text(
                              AppLocalizations.of(context)!
                                  .fullNameCreateAccount,
                              style: tsSmallBold,
                            ),
                            height05,
                            TextFormField(
                              controller: emergencyProvider.fullNameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Ramana Brother",
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppLocalizations.of(context)!
                                      .pleaseEnterFullName;
                                }
                                return null;
                              },
                            ),
                            height10,
                            Text(
                              AppLocalizations.of(context)!.mobileNumber,
                              style: tsSmallBold,
                            ),
                            height05,
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              controller: emergencyProvider.regMobileController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "+91 | 0000000000",
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppLocalizations.of(context)!
                                      .pleaseEnterMobile;
                                }
                                return null;
                              },
                            ),
                            Text(
                              AppLocalizations.of(context)!.emailAddress,
                              style: tsSmallBold,
                            ),
                            height05,
                            TextFormField(
                              controller: emergencyProvider.emailID,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "ramanabglr@gmail.com",
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppLocalizations.of(context)!
                                      .pleaseEnterAddress;
                                }
                                return null;
                              },
                            ),
                            height30,
                            CustomButton(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  provider.postEmergencyContactDetails(context);
                                }
                              },
                              title: AppLocalizations.of(context)!
                                  .saveEmergencyContact,
                              border: true,
                            ),
                            height35,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
