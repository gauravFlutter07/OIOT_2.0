import 'package:oiot/src/home_oiot/home_online/sos_emergency/add_emergency_controller.dart';
import 'package:oiot/src/home_oiot/home_online/sos_emergency/save_emergencycontact_success.dart';

import '../../../../imports.dart';

class AddEmergencyContact extends StatefulWidget {
  const AddEmergencyContact({super.key});

  @override
  State<AddEmergencyContact> createState() => _AddEmergencyContactState();
}

class _AddEmergencyContactState extends State<AddEmergencyContact> {
  bool isActivated = false;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final AddEmergencyContactProvider addEmergencyContactProvider =
        Provider.of<AddEmergencyContactProvider>(context, listen: false);
    final addEmergencyContactProviderWatch =
        context.watch<AddEmergencyContactProvider>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0.0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset('assetst/leftArrow.png'),
        ),
        title: customTextWidget(
          text: AppLocalizations.of(context)!.addContact,
          size: 18.0,
          color: Colors.black,
          weight: FontWeight.bold,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50.0,
              ),
              customTextWidget(
                text: AppLocalizations.of(context)!.fullName,
                size: 14.0,
                color: Colors.black,
                weight: FontWeight.bold,
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: addEmergencyContactProviderWatch.fullName,
                decoration: const InputDecoration(
                  hintText: 'Raghu Yadav',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              customTextWidget(
                text: AppLocalizations.of(context)!.mobileNumber,
                size: 14.0,
                color: Colors.black,
                weight: FontWeight.bold,
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: addEmergencyContactProviderWatch.mobileNumber,
                decoration: const InputDecoration(
                  hintText: '9876543215',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customTextWidget(
                    text: AppLocalizations.of(context)!
                        .alwaysShareMyRideDetailWithThisContact,
                    size: 15.0,
                    color: Colors.black,
                    weight: FontWeight.w500,
                  ),
                  Row(
                    children: [
                      Text(isActivated ? 'on' : 'off'),
                      Switch(
                        value: isActivated,
                        onChanged: (newValue) {
                          setState(() {
                            isActivated = newValue;
                          });
                        },
                        activeColor: blueMain,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const SizedBox(
                height: 100.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blueMain,
                  ),
                  onPressed: () {},
                  child: CustomButton(
                      onTap: () {
                        SaveEmergencyContactPopUpSuccessMessage
                            saveContactPopUpSuccessMessage =
                            SaveEmergencyContactPopUpSuccessMessage();
                        saveContactPopUpSuccessMessage.showMessage(context);
                      },
                      title:
                          AppLocalizations.of(context)!.saveAsEmergencyContact,
                      border: true),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
