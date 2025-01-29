// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:oiot/api/api_base_helper.dart';
import 'package:oiot/firebase_api/firebase_api.dart';
import 'package:oiot/firebase_options.dart';
import 'package:oiot/utils/api_endpoints.dart';
import 'imports.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final apiHelper = ApiBaseHelper();
final LocalStorageService localStorageService = LocalStorageService();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotification();
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  runApp(const RiderApp());
  // runApp(
  //   DevicePreview(
  //     builder: (context) => const RiderApp(),
  //   ),
  // );
}

Future<void> initServices() async {
  EnvConfig devConfig = EnvConfig(
    appName: AppValues.appName,
    baseUrl: ApiEndPoints.dev.baseUrl,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );
  await localStorageService.init();
  // localStorageService = await Get.putAsync(() => LocalStorageService().init());

  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
}
