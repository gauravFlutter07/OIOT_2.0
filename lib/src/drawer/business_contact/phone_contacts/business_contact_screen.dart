// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:oiot/src/drawer/business_contact/phone_contacts/business_contacts.dart';

import '../../../../imports.dart';

class BusinessContacts extends StatelessWidget {
  const BusinessContacts({super.key});

  @override
  Widget build(BuildContext context) {
    final businessContactProvider =
        Provider.of<BusinessContactProvider>(context);
    return Scaffold(
      body: Padding(
        padding: padding8,
        child: Container(
          margin: horizontalPadding10,
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomHeader(
                      title: AppLocalizations.of(context)!.businessContacts,
                    ),
                    Checkbox(
                      value: businessContactProvider.showCheckboxes,
                      onChanged: (value) {
                        businessContactProvider
                            .setShowCheckboxes(value ?? false);
                        if (!(value ?? false)) {
                          businessContactProvider.clearSelectedContacts();
                        }
                      },
                    )
                  ],
                ),
                height10,
                Row(
                  children: [
                    width10,
                    Expanded(
                      child: TextField(
                        controller: businessContactProvider.contactController,
                        onChanged: (query) {
                          businessContactProvider.searchContacts(query);
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              businessContactProvider.contactController.clear();
                              businessContactProvider.clearSearch();
                            },
                            icon: const Icon(Icons.search),
                          ),
                          hintText: AppLocalizations.of(context)!.searchContact,
                          border: OutlineInputBorder(
                            borderRadius: circularBorderRadius10,
                          ),
                        ),
                      ),
                    ),
                    width10,
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddContact(),
                          ),
                        );
                      },
                      child: Container(
                        width: 50.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: blueMain,
                          borderRadius: circularBorderRadius10,
                        ),
                        child: Icon(
                          Icons.person_add,
                          color: whiteColor,
                        ),
                      ),
                    ),
                    width5,
                  ],
                ),
                height15,
                Expanded(
                  child: businessContactProvider.isLoading
                      ? Image.asset(
                          contactLoading,
                          scale: 1,
                        )
                      : businessContactProvider.searchedContacts.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    noContact,
                                    scale: 1,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .noContactsFound,
                                    textAlign: centreAlign,
                                    style: tsSmallBoldGrey,
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              itemCount: businessContactProvider
                                  .searchedContacts.length,
                              itemBuilder: (context, index) {
                                Contact contact = businessContactProvider
                                    .searchedContacts[index];
                                bool isSelected = businessContactProvider
                                    .selectedContacts
                                    .contains(contact);
                                return ListTile(
                                  leading: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (businessContactProvider
                                          .showCheckboxes)
                                        Checkbox(
                                          value: isSelected,
                                          onChanged: (value) {
                                            businessContactProvider
                                                .toggleSelectedContact(contact);
                                          },
                                        ),
                                      CircleAvatar(
                                        backgroundColor: greyShade200,
                                        backgroundImage: contact.thumbnail !=
                                                null
                                            ? MemoryImage(contact.thumbnail!)
                                            : null,
                                        radius: 20,
                                        child: contact.thumbnail == null
                                            ? Text(
                                                contact.displayName.isNotEmpty
                                                    ? contact.displayName
                                                        .substring(0, 1)
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            : null,
                                      ),
                                    ],
                                  ),
                                  title: Text(
                                    contact.displayName,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: fontWeight500,
                                    ),
                                  ),
                                  subtitle: contact.phones.isNotEmpty
                                      ? Text(
                                          contact.phones.first.number,
                                        )
                                      : Text(
                                          AppLocalizations.of(context)!
                                              .noPhoneNumber,
                                        ),
                                  trailing: isSelected
                                      ? ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            backgroundColor: blueMain,
                                            foregroundColor: whiteColor,
                                          ),
                                          onPressed: () {
                                            sendMessageToWhatsApp(
                                              contact.phones.first.number,
                                              'Hello, check out the OIOT app: https://play.google.com/store/apps/details?id=com.oiot.app',
                                            );
                                          },
                                          child: Text(
                                              AppLocalizations.of(context)!
                                                  .send),
                                        )
                                      : const SizedBox(),
                                  onTap: () {
                                    businessContactProvider
                                        .toggleSelectedContact(contact);
                                  },
                                );
                              },
                            ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        onTap: () {
                          businessContactProvider.fetchContacts();
                        },
                        title: AppLocalizations.of(context)!.syncContacts,
                        border: true,
                      ),
                    ),
                    width10,
                    Container(
                      decoration: BoxDecoration(
                        color: black87,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: IconButton(
                        onPressed: () {
                          businessContactProvider
                              .sendContactsToBackend(context);
                        },
                        icon: Icon(
                          Icons.save,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
                height40,
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendMessageToWhatsApp(String phoneNumber, String message) async {
    final whatsappUrl =
        "whatsapp://send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}";
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      log("Unable to launch WhatsApp");
    }
  }
}
