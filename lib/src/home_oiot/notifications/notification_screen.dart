import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../imports.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  static const route = '/notification_screen';

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments;
    final notificationProvider =
        Provider.of<NotificationProvider>(context, listen: false);

    if (message != null && message is RemoteMessage) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notificationProvider.addNotification(message);
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Consumer<NotificationProvider>(
            builder: (context, notificationProvider, child) {
              return Column(
                children: [
                  CustomHeader(
                      title: AppLocalizations.of(context)!.notificationss),
                  height10,
                  TextFormField(
                    onChanged: (value) {
                      notificationProvider.searchByTitle(value);
                    },
                    decoration: InputDecoration(
                      labelText:
                          AppLocalizations.of(context)!.searchNotification,
                      hintText:
                          AppLocalizations.of(context)!.searchNotification,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  height10,
                  Expanded(
                    child: notificationProvider.notificationList.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  noNotificationJpg,
                                  width: 200,
                                  height: 200,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .noNotificationsAvailable,
                                  style: tsRegularGrey,
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: padding8,
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return height10;
                              },
                              itemCount:
                                  notificationProvider.notificationList.length,
                              itemBuilder: (context, index) {
                                var notification = notificationProvider
                                    .notificationList[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            NotificationDetailPage(
                                          notification: notification,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Slidable(
                                    endActionPane: ActionPane(
                                      motion: const DrawerMotion(),
                                      children: [
                                        // SlidableAction(
                                        //   onPressed: (context) {
                                        //     // Archive action
                                        //   },
                                        //   icon: Icons.archive,
                                        //   backgroundColor: Colors.grey.shade400,
                                        //   label: 'Archive',
                                        // ),
                                        SlidableAction(
                                          onPressed: (context) {
                                            notificationProvider
                                                .removeNotification(index);
                                          },
                                          icon: Icons.delete,
                                          backgroundColor: grey900,
                                          label: AppLocalizations.of(context)!
                                              .delete,
                                        ),
                                      ],
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(bottom: 10),
                                      padding: padding8,
                                      decoration: BoxDecoration(
                                        color: blueGreyshade50,
                                        borderRadius: circularBorderRadius10,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            notification.notification?.title ??
                                                '',
                                            style: tsRegularBold,
                                          ),
                                          height05,
                                          Text(
                                            notification.notification?.body ??
                                                '',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: tsRegularGrey,
                                          ),
                                          height05,
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                  TextButton(
                    onPressed: () {
                      notificationProvider.clearAllNotifications();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.clearall,
                      style: tsRegularGrey,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}









// 'assets/images/no notification.jpg'