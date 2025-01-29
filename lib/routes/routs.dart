import 'package:oiot/src/drawer/business_contact/phone_contacts/business_contact_screen.dart';
import 'package:oiot/src/drawer/my_subscription/all_subscription/invoice_bill/invoice_bill_screen.dart';
import 'package:oiot/src/drawer/my_subscription/all_subscription/payment_loading_screen/payment_loading_screen.dart';
import 'package:oiot/src/drawer/my_subscription/all_subscription/recommended_plans/recommended_plans_screen.dart';
import 'package:oiot/src/login_register/forgot_password/forgot_password.dart';
import 'package:oiot/src/login_register/mpin/mpin_screen.dart';

import '../imports.dart';

class RouteClass {
  static const String splashScreen = '/';
  static const String splashLoadingScreen = '/splash_loading_screen';
  static const String introScreen = '/intro_screen';
  static const String homeScreen = '/home_screen';
  static const String settingView = '/setting_view';
  static const String swipeScreen = '/swipe_screen';
  static const String createAccountIntroScreen = '/create_account_intro_screen';
  static const String termsOfServiceScreen = '/terms_of_service_screen';
  static const String languageSelectScreen = '/language_select_screen';

  static const String loginScreen = '/login_screen';
  static const String createAccountLoginScreen = '/create_account_login_screen';
  static const String forgotPasswordScreen = '/forgot_password_screen';
  static const String otpVarificationScreen = '/otp_varification_screen';
  static const String createNewPasswordScreen = '/create_new_password_screen';
  static const String landingScreenOwner = '/landing_screen_owner';
  static const String editProfileScreen = '/edit_profile_screen';
  static const String landingScreenDriver = '/landing_screen_driver';
  static const String notificationScreen = '/notification_screen';
  static const String welcomeScreen = '/welcome_screen';
  static const String mpinPage = '/mpin';
  static const String accountCreateIndividual = '/account_create_individual';
  static const String editProfile = '/edit_profile';
  static const String myProfile = '/edit_profile';
  static const String userOfflineHome = '/offline_home';
  static const String termsAndConditions = '/terms_and_conditions';
  static const String qrCodePage = '/qr_page';
  static const String businessContactPage = '/business_contact';
  static const String subscriptiondriverscreen = '/subscription_driver_screen';
  static const String subscriptionscreen = '/subscription_screen';
  static const String buysubscriptionscreen = '/buy_subscription_screen';
  static const String payingsubscriptionscreen = '/paying_subscription_screen';
  static const String paymentloadingprogress = '/payment_loading_progress';
  static const String invoicebill = '/invoice_bill';
  static const String recommendedplans = '/recommended_plans';
  static const String useronlinehome = '/user_online_home';
  static const String onboardingPage3 = 'onboarding_page_3';
  static const String onboardingPage2 = '/onboarding_page_2';
  static const String otpvarificationcreateaccount =
      '/otp_varification_create_account';

  Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SplashScreen(),
    '/splash_loading_screen': (context) => const SplashLoadingScreen(),
    '/setting_screen': (context) => const SettingsScreen(),
    '/swipe_screen': (context) => const IntroScreen(),
    // '/terms_of_service_screen': (context) => const TermsOfServiceScreen(),
    '/language_select_screen': (context) => const LanguageSelectScreen(),
    '/login_screen': (context) => LoginScreen(),
    '/forgot_password_screen': (context) => ForgotPasswordScreen(),
    '/otp_varification_screen': (context) => ForgotPasswordScreen(),
    // '/create_new_password_screen': (context) => CreateNewPasswordScreen(),
    '/welcome_screen': (context) => const WelcomePage(),
    '/mpin': (context) => const Mpin(),
    '/account_create_individual': (context) => AccountCreateIndividual(),
    '/edit_profile': (context) => const EditProfile(),
    '/my_profile': (context) => const MyProfile(),
    '/offline_home': (context) => UserOfflineHome(),
    '/terms_and_conditions': (context) => const TermsAndConditions(),
    '/qr_page': (context) => const MyQrCode(),
    '/business_contact': (context) => const BusinessContacts(),
    '/subscription_screen': (context) => const SubscriptionScreen(), //changed
    // '/buy_subscription_screen': (context) => const BuySubscriptionScreen(),
    '/paying_subscription_screen': (context) =>
        const PayingSubscriptionScreen(),

    '/payment_loading_progress': (context) => const PaymentLoadingProgress(),
    '/invoice_bill': (context) => const InvoiceBill(),

    '/recommended_plans': (context) => const RecommendedPlans(),
    '/user_online_home': (context) => const UserOnlineHome(),
    '/onboarding_page_3': (context) => const OnBoarding3(),
    '/onboarding_page_2': (context) => const OnBoarding2(),
    // '/otp_varification_create_account': (context) =>
    //     const OtpVarificationCreateAccountScreen(),
    NotificationScreen.route: (context) => const NotificationScreen(),
  };
}
