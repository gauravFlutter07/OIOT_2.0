import 'package:oiot/utils/api_endpoints.dart';

import 'imports.dart';

void main() async {
  EnvConfig qaConfig = EnvConfig(
    appName: AppValues.appName,
    baseUrl: ApiEndPoints.dev.baseUrl,
  );

  BuildConfig.instantiate(
    envType: Environment.QA,
    envConfig: qaConfig,
  );

  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();

  runApp(const RiderApp());
}
