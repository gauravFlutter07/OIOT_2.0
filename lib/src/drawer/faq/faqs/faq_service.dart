import 'dart:developer';

import '../../../../imports.dart';

class FaqServices {
  List<Map<String, dynamic>> faqData = [
    {
      "heading": "How to operate a trip?",
      "faq":
          "Operating a trip on the OIOT taxi app is simple and user-friendly. First, download and install the OIOT app from your device's app store. Open the app and sign in or create an account if you haven't already. Enter your current location and your desired destination in the designated fields. The app will show available drivers nearby, along with estimated fare and arrival time. Choose your preferred driver and confirm your booking. You can track your driver's location in real-time on the map. Once your driver arrives, hop in and enjoy your ride. After reaching your destination, you can pay through the app using your preferred payment method and rate your trip experience.",
    },
    {
      "heading": "How to book a ride?",
      "faq":
          "Booking a ride with the OIOT taxi app is simple and convenient. First, download the OIOT app and sign in or register. Set your pickup location using the map or GPS feature, then enter your destination. Choose your preferred ride type from the available options, review the fare estimate, and confirm your booking. You'll receive details of your driver and can track their location in real-time. Once the driver arrives, verify their details, enjoy your ride, and pay through the app upon arrival. Finally, rate your experience to help improve the service.",
    },
    {
      "heading": "How to pay for a ride?",
      "faq":
          "Paying for a ride with the OIOT taxi app is quick and flexible, offering multiple payment options to suit your preference. You can choose to pay using a debit card, credit card, net banking, or wallet. Simply add your preferred payment method in the app by navigating to the payment settings. For card payments, enter your card details, including the card number, expiry date, and CVV. For net banking, select your bank and follow the secure prompts to complete the payment. If you prefer using a wallet, ensure it's funded and linked to your OIOT account. After your ride, the fare will be automatically deducted from your chosen payment method, making the entire process seamless and hassle-free.",
    },
    {
      "heading": "How to change my password?",
      "faq":
          "Changing your password in the OIOT taxi app is a straightforward process. Start by opening the OIOT app and logging in. Navigate to the profile or menu icon, typically found in the top-right corner, and select Settings or Account. Within the account settings, choose the Change Password option. You will need to enter your current password for verification. Next, input your new password, ensuring it meets the security requirements, and confirm it by re-entering. Finally, save the changes by tapping the Save or Update Password button. Your password is now updated, allowing you to use the new credentials for future logins.",
    },
    {
      "heading": "How to update my profile?",
      "faq":
          "Updating your profile in the OIOT taxi app is easy and quick. First, open the app and log in. Navigate to the settings by tapping on the profile icon or menu button, usually located in the top-right corner. In the settings menu, select Profile or Account Information. Here, you can edit your personal details such as name, phone number, email address, and profile picture. Make the necessary changes and then tap the Save or Update button to confirm. Your profile will be updated instantly with the new information.",
    }
  ];

  String faqUrl = "api/faqs";
  Dio dio = Dio();

  Future<List<FaqModel>> fetchFaqData() async {
    try {
      int statusCode = 200;
      if (statusCode == 200) {
        List<FaqModel> faqList =
            faqData.map((faq) => FaqModel.fromJson(faq)).toList();
        return faqList;
      } else {
        throw Exception('Failed to fetch faq data');
      }
    } catch (e) {
      log('Error fetching faq data: $e');
      return [];
    }
  }
}
