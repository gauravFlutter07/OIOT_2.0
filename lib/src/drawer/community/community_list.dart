import '../../../imports.dart';

// Facebook Dropdown list
List<String> facebookDropdownList = [
  'Bangalore franchises group',
  'Bangalore franchises Page',
  'Face Book Page Review',
  'Market Place',
  'Watch - Live Video\'s',
  'Community groups',
  'Fund Support for others',
  'Events around you',
];

// Whatsapp Dropdown list
List<String> whatsappDropdownList = [
  'Bangalore group north',
  'Bangalore group South',
  'Bangalore group east',
  'Bangalore group west',
  'Bangalore group central',
  'Mysore group',
  'Mangalore group',
  'Karnataka admin group',
];

// Linkedin Dropdown list
List<String> linkedinDropdownList = [
  'Bangalore franchises group',
  'Bangalore franchises Page',
  'Face Book Page Review',
  'Market Place',
  'Watch - Live Video\'s',
  'Community groups',
  'Fund Support for others',
  'Events around you',
];

// Telegram Dropdown list
List<String> telegramDropdownList = [
  'Karnataka broadcast group',
  'Karnataka Chat group',
  'Tamilnadu broadcast group',
  'Tamilnadu Chat group',
  'AP broadcast group',
  'AP Chat group',
  'Delhi broadcast group',
  'Delhi Chat Group',
];

// Googlemeet Dropdown list
List<String> googlemeetDropdownList = [
  'Karnataka meeting link',
  'Bangalore meeting link',
  'Tamilnadu meeting link',
  'Chennai meeting link',
  'AP meeting link',
  'Hyderabad meeting link',
  'Delhi meeting link',
  'Mumbai meeting link',
];

// Clubhouse Dropdown list
List<String> clubhouseDropdownList = [
  'Karnataka meeting link',
  'Bangalore meeting link',
  'Tamilnadu meeting link',
  'Chennai meeting link',
  'AP meeting link',
  'Hyderabad meeting link',
  'Delhi meeting link',
  'Mumbai meeting link',
];

// Youtube Dropdown list
List<String> youtubeDropdownList = [
  'Kannada channel link',
  'Bangalore channel link',
  'Tamil channel link',
  'Chennai channel link',
  'Telugu channel link',
  'Hyderabad channel link',
  'Hindi channel link',
  'Mumbai channel link',
];

// koo Dropdown list
List<String> kooDropdownList = [
  'Karnataka Page link',
  'Bangalore Page link',
  'Tamilnadu Page link',
  'Chennai Page link',
  'AP Page link',
  'Hyderabad Page link',
  'Delhi Page link',
  'Mumbai Page link',
];

// Playstore Dropdown list
List<String> playstoreDropdownList = [
  'App Review',
  'comments',
  'comments like',
  'share comments',
  'Add Image',
];

// Mouthshut Dropdown list
List<String> mouthshutDropdownList = [
  'Safety instructions Reviews',
  'Handling Customers Blogs',
  'Maintain Vehicle',
  'Utilize Govt opportunities',
  'Offers available',
  'Creating Business',
  'Mentors',
  'achievers talk',
];

// Justdial Dropdown list
List<String> justdialDropdownList = [
  'Bangalore franchises Adding',
  'Franchises Reviewing',
  'Franchises posting Market Place',
  'Watch - add Photos',
  'Support Community posts',
  'Fund Support for others',
  'Find and create Events around you',
];

List<String> quickerDropdownList = [
  'Bangalore franchises Adding',
  'Franchises Reviewing',
  'Franchises posting Market Place',
  'Watch - add Photos',
  'Support Community posts',
  'Fund Support for others',
  'Find and create Events around you',
];

List<String> googleClassroomDropdownList = [
  'Safety Instruction',
  'Handling Customers',
  'Maintain Vehicle',
  'Utilize Govt opportunities',
  'Offers available',
  'Creating Business',
  'Mentors',
  'achievers talk',
];

// ignore: must_be_immutable
class CommunityGroups extends StatefulWidget {
  String name;
  CommunityGroups({super.key, required this.name});

  @override
  State<CommunityGroups> createState() => _CommunityGroupsState();
}

class _CommunityGroupsState extends State<CommunityGroups> {
  String? selectedGroup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                CustomHeader(title: widget.name),
                const SizedBox(
                  height: 30,
                ),
                CustomDropdown(
                  options: widget.name == 'Connect with F-Community'
                      ? facebookDropdownList
                      : widget.name == 'WhatsApp'
                          ? whatsappDropdownList
                          : widget.name == 'Linkedin'
                              ? linkedinDropdownList
                              : widget.name == 'Telegram'
                                  ? telegramDropdownList
                                  : widget.name == 'Google Meet'
                                      ? googlemeetDropdownList
                                      : widget.name == 'Clubhouse'
                                          ? clubhouseDropdownList
                                          : widget.name == 'Youtube'
                                              ? youtubeDropdownList
                                              : widget.name == 'Koo'
                                                  ? kooDropdownList
                                                  : widget.name == 'Playstore'
                                                      ? playstoreDropdownList
                                                      : widget.name ==
                                                              'Mouthshut'
                                                          ? mouthshutDropdownList
                                                          : widget.name ==
                                                                      'Google Classroom' ||
                                                                  widget.name ==
                                                                      'Google Podcast'
                                                              ? googleClassroomDropdownList
                                                              : widget.name ==
                                                                      'Justdial'
                                                                  ? justdialDropdownList
                                                                  : quickerDropdownList,
                  selectedOption: selectedGroup,
                  onChanged: (value) {
                    setState(() {
                      selectedGroup = value;
                    });
                  },
                  hint: widget.name == 'Connect with F-Community'
                      ? facebookDropdownList[0]
                      : widget.name == 'WhatsApp'
                          ? whatsappDropdownList[0]
                          : widget.name == 'Linkedin'
                              ? linkedinDropdownList[0]
                              : widget.name == 'Telegram'
                                  ? telegramDropdownList[0]
                                  : widget.name == 'Google Meet'
                                      ? googlemeetDropdownList[0]
                                      : widget.name == 'Clubhouse'
                                          ? clubhouseDropdownList[0]
                                          : widget.name == 'Youtube'
                                              ? youtubeDropdownList[0]
                                              : widget.name == 'Koo'
                                                  ? kooDropdownList[0]
                                                  : widget.name == 'Playstore'
                                                      ? playstoreDropdownList[0]
                                                      : widget.name ==
                                                              'Mouthshut'
                                                          ? mouthshutDropdownList[
                                                              0]
                                                          : widget.name ==
                                                                  'Justdial'
                                                              ? justdialDropdownList[
                                                                  0]
                                                              : widget.name ==
                                                                          'Google Classroom' ||
                                                                      widget.name ==
                                                                          'Google Podcast'
                                                                  ? googleClassroomDropdownList[
                                                                      0]
                                                                  : quickerDropdownList[
                                                                      0],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
