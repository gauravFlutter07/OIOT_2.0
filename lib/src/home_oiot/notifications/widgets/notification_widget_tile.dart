import '../../../../imports.dart';

class NotificationWidgetTile extends StatelessWidget {
  final NotificationItems notification;
  final Function deleteItem;
  const NotificationWidgetTile(
      {required this.notification, required this.deleteItem, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: circularBorderRadius10,
        color: notification.read ? whiteColor : blueShade100,
      ),
      child: Padding(
        padding: padding8,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(
                  right: 8.0,
                ),
                child: CustomCircularAvatar(
                  name: notification.name,
                  color: blueMain,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: tsRegularBold,
                  ),
                  height05,
                  Text(
                    notification.text,
                    style: tsSmallGrey,
                  ),
                  height15,
                  Text(
                    '05.30 pm',
                    style: tsSmallGrey,
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      // Perform cancel action
                    },
                    icon: IconButton(
                      onPressed: () {
                        deleteItem();
                      },
                      icon: Icon(
                        Icons.close,
                        color: notification.read ? textGrey : backgroundGreen,
                      ),
                    ),
                  ),
                  Text(
                    notification.date,
                    style: TextStyle(
                      color: black54,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
