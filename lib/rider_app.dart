import 'package:get/get.dart';
import 'package:oiot/main.dart';
import 'package:oiot/src/drawer/community/community_page_controller.dart';

import 'package:oiot/src/drawer/my_rides/my_rides_screen/my_riders_provider.dart';
import 'package:oiot/src/drawer/my_rides/my_rides_screen/ongoing/ongoing_controller.dart';
import 'package:oiot/src/drawer/my_rides/my_rides_screen/schedule/accepted_ride/accepted_ride-controller.dart';
import 'package:oiot/src/drawer/my_rides/my_rides_screen/schedule/interested_ride/interested_driver_controller.dart';
import 'package:oiot/src/drawer/my_rides/scheduled_trips/sheduled_trips.controller.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/coupon_bonus/coupon_bonus_controller.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/performance_bonus/performance_bonus_controller.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/referral_bonus/referralbonus_controller.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/subscription_bonus/subscription_bonus_controller.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/wallet_bonus/wallet_bonus_controller.dart';
import 'package:oiot/src/drawer/wallet/bonus/widgets/welcome_bonus/welcome_bonus_controller.dart';
import 'package:oiot/src/home_oiot/home_online/cancel_trip_page/cancel_trip_controller.dart';
import 'package:oiot/src/home_oiot/home_online/estimated_price/estimate_price_controller.dart';
import 'package:oiot/src/home_oiot/home_online/new_map/map_new_controller.dart';
import 'package:oiot/src/home_oiot/home_online/service_type/rental_estimated_price/rental_estimate_controller.dart';
import 'package:oiot/src/home_oiot/home_online/service_type/widgets/payment_method_controller.dart';
import 'package:oiot/src/home_oiot/home_online/feedback_driver/feedback_driver_controller.dart';
import 'package:oiot/src/home_oiot/home_online/sos_emergency/add_emergency_controller.dart';
import 'package:oiot/src/home_oiot/home_online/my_qr_for_trip_scan/qr_for_trip_scan_controller.dart';
import 'package:oiot/src/home_oiot/home_online/trip_id/trip_controller.dart';
import 'package:oiot/src/login_register/create_password/create_password_controller.dart';
import 'package:oiot/src/login_register/login_register.dart';
import 'package:oiot/src/login_register/mpin/mpin_provider.dart';
import 'imports.dart';
import 'src/drawer/business_contact/phone_contacts/business_contacts.dart';

class RiderApp extends StatelessWidget {
  const RiderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OtpVarificationProvider()),
        ChangeNotifierProvider(create: (context) => SettingsController()),
        ChangeNotifierProvider(create: (context) => SplashLoadingProvider()),
        ChangeNotifierProvider(create: (context) => SwipeProvider()),
        ChangeNotifierProvider(create: (context) => LocalStorageService()),
        // ChangeNotifierProvider(create: (context) => TermsOfServiceProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => ForgotPasswordProvider()),
        // ChangeNotifierProvider(
        //     create: (context) => CreateNewPasswordProvider()),
        ChangeNotifierProvider(create: (context) => LanguageSelectProvider()),
        ChangeNotifierProvider(create: (context) => MpinProvider()),
        ChangeNotifierProvider(create: (context) => CreateAccountProvider()),
        ChangeNotifierProvider(create: (context) => EditProfileProvider()),
        ChangeNotifierProvider(create: (context) => AddBankAccountProvider()),
        ChangeNotifierProvider(create: (context) => UpdateKycProvider()),
        ChangeNotifierProvider(create: (context) => TermsAndServicesProvider()),
        ChangeNotifierProvider(create: (context) => QrProvider()),
        ChangeNotifierProvider(create: (context) => ReferFriendsProvider()),
        ChangeNotifierProvider(create: (context) => BusinessContactProvider()),
        ChangeNotifierProvider(
            create: (context) => AddBusinessContactProvider()),
        ChangeNotifierProvider(create: (context) => FAQProvider()),
        // ChangeNotifierProvider(create: (context) => NewFAQProvider()),
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
        ChangeNotifierProvider(create: (context) => EmergencyProvider()),
        ChangeNotifierProvider(create: (context) => RaiseIssueProvider()),
        ChangeNotifierProvider(create: (context) => OtherIssueProvider()),
        ChangeNotifierProvider(create: (context) => ReportProvider1()),
        // ChangeNotifierProvider(create: (context) => BuySubscriptionProvider()),
        ChangeNotifierProvider(
            create: (context) => PayingSubscriptionProvider()),
        ChangeNotifierProvider(create: (context) => SubscriptionProvider()),
        ChangeNotifierProvider(
            create: (context) => AddBankAccountScreenProvider()),
        ChangeNotifierProvider(create: (context) => AddMoneyProvider()),
        ChangeNotifierProvider(
            create: (context) => WalletTransactionHistoryProvider()),
        ChangeNotifierProvider(create: (context) => UserOnlineHomeController()),
        ChangeNotifierProvider(create: (context) => QrForTripAndScanProvider()),
        ChangeNotifierProvider(create: (context) => DailyRideController()),
        ChangeNotifierProvider(create: (context) => ChooseARideProvider()),
        // ChangeNotifierProvider(create: (context) => OutstationPickupProvider()),
        ChangeNotifierProvider(
            create: (context) => AddEmergencyContactProvider()),
        ChangeNotifierProvider(create: (context) => FeedBackDriverProvider()),
        ChangeNotifierProvider(create: (context) => NotificationProvider()),
        // ChangeNotifierProvider(create: (context) => SettingPageProvider()),
        ChangeNotifierProvider(create: (context) => EstimatePriceController()),
        ChangeNotifierProvider(create: (context) => PaymentMethodController()),
        ChangeNotifierProvider(create: (context) => ScheduledTripProvider()),
        ChangeNotifierProvider(create: (context) => OfflineHomeProvider()),
        ChangeNotifierProvider(create: (context) => MyRidesProvider()),
        ChangeNotifierProvider(create: (context) => MyProfileProvider()),
        ChangeNotifierProvider(create: (context) => BottomInvoiceProvider()),
        ChangeNotifierProvider(create: (context) => MyPlansProvider()),
        ChangeNotifierProvider(create: (context) => ViewHistoryProvider()),
        ChangeNotifierProvider(create: (context) => ButtonPopUpProvider()),
        ChangeNotifierProvider(create: (context) => WalletProvider()),
        ChangeNotifierProvider(create: (context) => ReferHistoryProvider()),
        ChangeNotifierProvider(create: (context) => WelcomeBonusProvider()),
        ChangeNotifierProvider(create: (context) => ReferralBonusProvider()),
        ChangeNotifierProvider(create: (context) => CouponBonusProvider()),
        ChangeNotifierProvider(
            create: (context) => SubscriptionBonusProvider()),
        ChangeNotifierProvider(create: (context) => WalletBonusProvider()),
        ChangeNotifierProvider(create: (context) => PerformanceBonusProvider()),
        ChangeNotifierProvider(create: (context) => SelectedReasonProvider()),
        ChangeNotifierProvider(create: (context) => TicketHistoryProvider()),
        ChangeNotifierProvider(create: (context) => InterestedDriverProvider()),
        ChangeNotifierProvider(create: (context) => FavouriteProvider()),
        ChangeNotifierProvider(create: (context) => PickupProvider()),
        ChangeNotifierProvider(create: (context) => DriverSearchingProvider()),
        ChangeNotifierProvider(create: (context) => DriverOnTheWayProvider()),
        ChangeNotifierProvider(create: (context) => TripProvider()),
        ChangeNotifierProvider(create: (context) => BookingProvider()),
        ChangeNotifierProvider(create: (context) => SplashProvider()),
        ChangeNotifierProvider(create: (context) => BookingProvider()),
        // ChangeNotifierProvider(create: (context) => RentalPickupProvider()),
        ChangeNotifierProvider(create: (context) => RentalEstimateprovider()),
        ChangeNotifierProvider(create: (context) => OngoingRiderProvider()),
        ChangeNotifierProvider(create: (context) => PastRideProvider()),
        ChangeNotifierProvider(create: (context) => ScheduledRideProvider()),
        ChangeNotifierProvider(create: (context) => AcceptedRidePovider()),
        ChangeNotifierProvider(create: (context) => ScheduledRideTabProvider()),
        ChangeNotifierProvider(create: (context) => AboutUsProvider()),
        ChangeNotifierProvider(create: (context) => PrivacyPolicyProvider()),
        ChangeNotifierProvider(create: (context) => CreatPasswordProvider()),
        ChangeNotifierProvider(create: (context) => InviteFriendsProvider()),
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
        ChangeNotifierProvider(create: (context) => UserOnlineHomeController()),
        ChangeNotifierProvider(create: (context) => CommunityProvider()),
        ChangeNotifierProvider(create: (context) => NewMapProvider()),
        ChangeNotifierProvider(create: (context) => BottomSheetProvider()),
      ],
      child: Builder(builder: (context) {
        final settingsControllerWatch = context.watch<SettingsController>();
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: settingsControllerWatch.language,
          supportedLocales: const [
            Locale('en'),
            Locale('te'),
            Locale('kn'),
            Locale('mr'),
          ],
          theme: ThemeData(),
          // darkTheme: ThemeData.dark(),
          themeMode: settingsControllerWatch.themeMode,
          navigatorKey: navigatorKey,
          routes: RouteClass().routes,
        );
      }),
    );
  }
}
