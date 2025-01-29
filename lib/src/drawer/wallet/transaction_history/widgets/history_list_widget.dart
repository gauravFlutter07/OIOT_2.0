import '../../../../../imports.dart';

Widget historyListTile(
        {leadingImage,
        title,
        subtitle,
        trailingTitle,
        trailingIcon,
        dateTime,
        status}) =>
    Container(
      color: lightGrey,
      margin: vertPadding10,
      child: Column(
        children: [
          ListTile(
            leading: Image(
              height: 40,
              image: AssetImage(leadingImage),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customTextWidget(
                  text: title,
                  size: 15.0,
                  color: blackColor,
                  weight: bold,
                ),
                customTextWidget(
                  text: trailingTitle,
                  size: 15.0,
                  color: blackColor,
                  weight: bold,
                ),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customTextWidget(
                  text: subtitle,
                  size: 15.0,
                  color: blackColor,
                  weight: fontWeight500,
                ),
                Icon(
                  trailingIcon,
                  color: blackColor,
                  size: 20,
                ),
              ],
            ),
          ),
          Container(
            margin: symmetricpadding15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customTextWidget(
                  text: dateTime,
                  size: 15.0,
                  color: textGrey,
                  weight: bold,
                ),
                Row(
                  children: [
                    customTextWidget(
                      text: status,
                      size: 15.0,
                      color: status == 'Successful' ? blueShade900 : redColor,
                      weight: FontWeight.bold,
                    ),
                    status != 'Successful'
                        ? Icon(
                            Icons.info,
                            color: redColor,
                          )
                        : const SizedBox(),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
