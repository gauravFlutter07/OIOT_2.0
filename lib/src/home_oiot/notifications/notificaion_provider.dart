import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../imports.dart';

class NotificationProvider with ChangeNotifier {
  List<RemoteMessage> _notificationList = [];

  List<RemoteMessage> get notificationList => _notificationList;

  NotificationProvider() {
    _initFirebaseMessaging();
  }

  void _initFirebaseMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Got a message whilst in the foreground!');
      if (message.notification != null) {
        log('Notification Title: ${message.notification!.title}');
        log('Notification Body: ${message.notification!.body}');
        addNotification(message);
      }
    });

    // Handle messages when the app is in the background or terminated
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    log("Handling a background message: ${message.notification!.title}");
    addNotification(message); // Add the received message to the list
  }

  void addNotification(RemoteMessage message) {
    if (!_notificationList.any((msg) => msg.messageId == message.messageId)) {
      _notificationList.add(message);
      notifyListeners();
    }
  }

  void removeNotification(int index) {
    _notificationList.removeAt(index);
    notifyListeners();
  }

  void clearAllNotifications() {
    _notificationList.clear();
    notifyListeners();
  }

  void loadScreen() {
    _notificationList = [];
    notifyListeners();
  }

  void searchByTitle(String title) {
    if (title.isEmpty) {
      notifyListeners();
      return;
    }

    List<RemoteMessage> searchResults = _notificationList
        .where((message) =>
            message.notification != null &&
            message.notification!.title != null &&
            message.notification!.title!
                .toLowerCase()
                .contains(title.toLowerCase()))
        .toList();

    _notificationList = searchResults;
    notifyListeners();
  }
}
