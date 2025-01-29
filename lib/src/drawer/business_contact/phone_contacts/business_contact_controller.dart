import 'dart:developer';
import 'package:oiot/src/drawer/business_contact/phone_contacts/business_contacts.dart';

import '../../../../imports.dart';

class BusinessContactProvider extends ChangeNotifier {
  final TextEditingController contactController = TextEditingController();

  List<Contact> _contacts = [];
  List<Contact> _searchedContacts = [];
  final List<Contact> _selectedContacts = [];
  bool _isLoading = false;
  bool _showCheckboxes = false;

  final ContactService _contactService = ContactService();

  // Getters
  bool get isLoading => _isLoading;
  bool get showCheckboxes => _showCheckboxes;
  List<Contact> get searchedContacts => _searchedContacts;
  List<Contact> get selectedContacts => _selectedContacts;

  // Setters
  void setShowCheckboxes(bool value) {
    _showCheckboxes = value;
    notifyListeners();
  }

  void toggleSelectedContact(Contact contact) {
    if (_selectedContacts.contains(contact)) {
      _selectedContacts.remove(contact);
    } else {
      _selectedContacts.add(contact);
    }
    notifyListeners();
  }

  void clearSelectedContacts() {
    _selectedContacts.clear();
    notifyListeners();
  }

  void clearSearch() {
    _searchedContacts.clear();
    notifyListeners();
  }

  Future<void> fetchContacts() async {
    _isLoading = true;
    notifyListeners();
    if (await FlutterContacts.requestPermission()) {}
    List<Contact> contacts = await FlutterContacts.getContacts(
      withProperties: true,
      withPhoto: true,
    );
    _contacts = contacts;
    _searchedContacts = contacts;
    _isLoading = false;
    notifyListeners();
  }

  void searchContacts(String query) {
    if (query.isNotEmpty) {
      _searchedContacts = _contacts
          .where((contact) =>
              contact.displayName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      _searchedContacts = _contacts;
    }
    notifyListeners();
  }

  Future<void> sendContactsToBackend(BuildContext context) async {
    List<PhoneContactModel> contactsToSend = [];

    for (var contact in _contacts) {
      File? photoFile;
      if (contact.photoOrThumbnail != null) {
        final tempDir = Directory.systemTemp;
        final tempPath = tempDir.path;
        final fileName =
            'contact_photo_${DateTime.now().millisecondsSinceEpoch}.jpg';
        final file = File('$tempPath/$fileName');
        await file.writeAsBytes(contact.photoOrThumbnail!);
        photoFile = file;
      }

      final phoneContactModel = PhoneContactModel(
        displayName: contact.displayName,
        phoneNumber:
            contact.phones.isNotEmpty ? contact.phones.first.number : '',
        photo: photoFile,
      );

      contactsToSend.add(phoneContactModel);
    }

    for (var contact in contactsToSend) {
      log("Contact: ${contact.displayName}, ${contact.phoneNumber}");
    }

    await _contactService.sendContactsToBackend(contactsToSend);

    // ignore: use_build_context_synchronously
    Fluttertoast.showToast(msg: AppLocalizations.of(context)!.contactsSaved);
  }
}
