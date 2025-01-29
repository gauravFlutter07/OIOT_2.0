import 'package:firebase_messaging/firebase_messaging.dart';
import '../../../imports.dart';

class NotificationDetailPage extends StatelessWidget {
  final RemoteMessage notification;

  const NotificationDetailPage({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: padding15,
          child: SafeArea(
            child: ListView(
              children: [
                CustomHeader(
                    title: AppLocalizations.of(context)!.notificationInDetail),
                height10,
                Text(
                  notification.notification?.title ??
                      AppLocalizations.of(context)!.noTitle,
                  style: tsMediumBold,
                ),
                height10,
                Text(
                  notification.notification?.body ??
                      AppLocalizations.of(context)!.noBody,
                  style: tsRegular,
                ),
                height20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
