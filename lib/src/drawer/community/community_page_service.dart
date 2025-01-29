import 'package:oiot/src/drawer/community/model/community_model.dart';

import '../../../imports.dart';

class CommunityService {
  Map<String, dynamic> dropdowns = {
    "Facebook": {
      "imageUrl":
          "https://cdn.logojoy.com/wp-content/uploads/20230921104408/Facebook-logo-600x319.png",
      "items": [
        "Bangalore franchises group",
        "Bangalore franchises Page",
        "Face Book Page Review",
        "Market Place",
        "Watch - Live Video's",
        "Community groups",
        "Fund Support for others",
        "Events around you"
      ]
    },
    "Whatsapp": {
      "imageUrl":
          "https://cdn.icon-icons.com/icons2/3685/PNG/512/whatsapp_logo_icon_229310.png",
      "items": [
        "Bangalore group north",
        "Bangalore group South",
        "Bangalore group east",
        "Bangalore group west",
        "Bangalore group central",
        "Mysore group",
        "Mangalore group",
        "Karnataka admin group"
      ]
    },
    "Linkedin": {
      "imageUrl":
          "https://static.vecteezy.com/system/resources/previews/023/986/970/original/linkedin-logo-linkedin-logo-transparent-linkedin-icon-transparent-free-free-png.png",
      "items": [
        "Bangalore franchises group",
        "Bangalore franchises Page",
        "Face Book Page Review",
        "Market Place",
        "Watch - Live Video's",
        "Community groups",
        "Fund Support for others",
        "Events around you"
      ]
    },
    "Telegram": {
      "imageUrl":
          "https://static-00.iconduck.com/assets.00/telegram-icon-2048x2048-30xu965w.png",
      "items": [
        "Karnataka broadcast group",
        "Karnataka Chat group",
        "Tamilnadu broadcast group",
        "Tamilnadu Chat group",
        "AP broadcast group",
        "AP Chat group",
        "Delhi broadcast group",
        "Delhi Chat Group"
      ]
    },
    "Googlemeet": {
      "imageUrl":
          "https://download.logo.wine/logo/Google_Meet/Google_Meet-Logo.wine.png",
      "items": [
        "Karnataka meeting link",
        "Bangalore meeting link",
        "Tamilnadu meeting link",
        "Chennai meeting link",
        "AP meeting link",
        "Hyderabad meeting link",
        "Delhi meeting link",
        "Mumbai meeting link"
      ]
    },
    "Clubhouse": {
      "imageUrl":
          "https://static-prod.adweek.com/wp-content/uploads/2021/07/ClubhouseLogoJuly2021.jpg",
      "items": [
        "Karnataka meeting link",
        "Bangalore meeting link",
        "Tamilnadu meeting link",
        "Chennai meeting link",
        "AP meeting link",
        "Hyderabad meeting link",
        "Delhi meeting link",
        "Mumbai meeting link"
      ]
    },
    "Youtube": {
      "imageUrl":
          "https://t3.ftcdn.net/jpg/04/74/05/94/360_F_474059464_qldYuzxaUWEwNTtYBJ44VN89ARuFktHW.jpg",
      "items": [
        "Kannada channel link",
        "Bangalore channel link",
        "Tamil channel link",
        "Chennai channel link",
        "Telugu channel link",
        "Hyderabad channel link",
        "Hindi channel link",
        "Mumbai channel link"
      ]
    },
    "Koo": {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz9iZMRBszcVg9qBUTBbet_bNVErfHBVhboA&s",
      "items": [
        "Karnataka Page link",
        "Bangalore Page link",
        "Tamilnadu Page link",
        "Chennai Page link",
        "AP Page link",
        "Hyderabad Page link",
        "Delhi Page link",
        "Mumbai Page link"
      ]
    },
    "Playstore": {
      "imageUrl":
          "https://logowik.com/content/uploads/images/google-play-store4701.jpg",
      "items": [
        "App Review",
        "comments",
        "comments like",
        "share comments",
        "Add Image"
      ]
    },
    "Mouthshut": {
      "imageUrl":
          "https://images.crunchbase.com/image/upload/c_pad,h_256,w_256,f_auto,q_auto:eco,dpr_1/v1397193586/efac08949db0998551a0d52941073050.gif",
      "items": [
        "Safety instructions Reviews",
        "Handling Customers Blogs",
        "Maintain Vehicle",
        "Utilize Govt opportunities",
        "Offers available",
        "Creating Business",
        "Mentors",
        "achievers talk"
      ]
    },
    "Justdial": {
      "imageUrl":
          "https://i.pinimg.com/originals/dc/54/28/dc542838d58c67ebacbc0ba7d0e11c54.jpg",
      "items": [
        "Bangalore franchises Adding",
        "Franchises Reviewing",
        "Franchises posting Market Place",
        "Watch - add Photos",
        "Support Community posts",
        "Fund Support for others",
        "Find and create Events around you"
      ]
    },
    "Quicker": {
      "imageUrl":
          "https://news.quikr.com/wp-content/uploads/2015/07/New-Quikr-Logo.jpg",
      "items": [
        "Bangalore franchises Adding",
        "Franchises Reviewing",
        "Franchises posting Market Place",
        "Watch - add Photos",
        "Support Community posts",
        "Fund Support for others",
        "Find and create Events around you"
      ]
    },
    "GoogleClassroom": {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVpkaDvmRylGiV-eOayW3fmA3gUVJTgetoZQ&s",
      "items": [
        "Safety Instruction",
        "Handling Customers",
        "Maintain Vehicle",
        "Utilize Govt opportunities",
        "Offers available",
        "Creating Business",
        "Mentors",
        "achievers talk"
      ]
    }
  };
  Dio dio = Dio();
  Future<CommunityModel?> fetchReport() async {
    try {
      int statusCode = 200;
      if (statusCode == 200) {
        final Map<String, dynamic> data = dropdowns;
        return CommunityModel.fromJson(data);
      } else {
        throw Exception('Failed to load community data');
      }
    } catch (e) {
      throw Exception('Error fetching community data: $e');
    }
  }
}
