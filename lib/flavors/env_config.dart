import '../imports.dart';

class EnvConfig {
  final String appName;
  final String baseUrl;
  final bool shouldCollectLog;

  late final Logger logger;

  EnvConfig({
    required this.appName,
    required this.baseUrl,
    this.shouldCollectLog = true,
  }) {
    logger = Logger(
      printer: PrettyPrinter(
        methodCount: AppValues.loggerErrorMethodCount,
        errorMethodCount: AppValues.loggerErrorMethodCount,
        lineLength: AppValues.loggerLineLength,
        colors: true,
        printEmojis: true,
        printTime: true,
      ),
    );
  }
}
