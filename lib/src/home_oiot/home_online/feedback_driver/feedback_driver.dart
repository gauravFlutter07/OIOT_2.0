import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:oiot/src/home_oiot/home_online/feedback_driver/feedback_driver_controller.dart';
import 'package:oiot/src/home_oiot/home_online/invoice/review_success.dart';
import '../../../../imports.dart';

// ignore: must_be_immutable
class DriverFeedback extends StatelessWidget {
  DriverFeedback({super.key});

  bool checkBoxState = false;

  @override
  Widget build(BuildContext context) {
    // final feedbackDriverProvider = Provider.of<FeedBackDriverProvider>(context);
    final feedbackDriverProviderWatch = context.watch<FeedBackDriverProvider>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomHeader(
                      title: AppLocalizations.of(context)!.driverRating),
                  height20,
                  Image.asset(
                    avtarDp,
                    height: 100,
                    width: 100,
                  ),
                  height15,
                  const Text(
                    'Swaminathan Swami',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  height05,
                  RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'But having an issue with',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  height10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          feedbackDriverProviderWatch
                              .onCleanlinessClickedFunction();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                feedbackDriverProviderWatch.isCleanlinessClicked
                                    ? lightBlack
                                    : whiteColor,
                            border:
                                feedbackDriverProviderWatch.isCleanlinessClicked
                                    ? null
                                    : Border.all(
                                        width: 1,
                                        color: borderGrey,
                                      ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: padding10,
                            child: Text(
                              ' Cleanliness ',
                              style: TextStyle(
                                  color: feedbackDriverProviderWatch
                                          .isCleanlinessClicked
                                      ? whiteColor
                                      : lightBlack,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          feedbackDriverProviderWatch
                              .onBehaviourClickedFunction();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                feedbackDriverProviderWatch.isBehaviourClicked
                                    ? lightBlack
                                    : whiteColor,
                            border:
                                feedbackDriverProviderWatch.isBehaviourClicked
                                    ? null
                                    : Border.all(
                                        width: 1,
                                        color: borderGrey,
                                      ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: padding10,
                            child: Text(
                              ' Behaviour ',
                              style: TextStyle(
                                  color: feedbackDriverProviderWatch
                                          .isBehaviourClicked
                                      ? whiteColor
                                      : lightBlack,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          feedbackDriverProviderWatch.onNavigationClicked();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                feedbackDriverProviderWatch.isNavigationClicked
                                    ? lightBlack
                                    : whiteColor,
                            border:
                                feedbackDriverProviderWatch.isNavigationClicked
                                    ? null
                                    : Border.all(
                                        width: 1,
                                        color: borderGrey,
                                      ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: padding10,
                            child: Text(
                              ' Navigation ',
                              style: TextStyle(
                                  color: feedbackDriverProviderWatch
                                          .isNavigationClicked
                                      ? whiteColor
                                      : lightBlack,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  height10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          feedbackDriverProviderWatch
                              .onpricingClickedFunction();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: feedbackDriverProviderWatch.pricingClicked
                                ? lightBlack
                                : whiteColor,
                            border: feedbackDriverProviderWatch.pricingClicked
                                ? null
                                : Border.all(
                                    width: 1,
                                    color: borderGrey,
                                  ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: padding10,
                            child: Text(
                              ' Pricing Issue ',
                              style: TextStyle(
                                  color:
                                      feedbackDriverProviderWatch.pricingClicked
                                          ? whiteColor
                                          : lightBlack,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          feedbackDriverProviderWatch
                              .onSmoothDrivingClickedFunction();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: feedbackDriverProviderWatch
                                    .isSmoothDrivingClicked
                                ? lightBlack
                                : whiteColor,
                            border: feedbackDriverProviderWatch
                                    .isSmoothDrivingClicked
                                ? null
                                : Border.all(
                                    width: 1,
                                    color: borderGrey,
                                  ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: padding10,
                            child: Text(
                              ' Smooth Driving ',
                              style: TextStyle(
                                  color: feedbackDriverProviderWatch
                                          .isSmoothDrivingClicked
                                      ? whiteColor
                                      : lightBlack,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  height10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          feedbackDriverProviderWatch
                              .onPickUpIssueClickedFunction();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                feedbackDriverProviderWatch.isPickupIssueClicked
                                    ? lightBlack
                                    : whiteColor,
                            border:
                                feedbackDriverProviderWatch.isPickupIssueClicked
                                    ? null
                                    : Border.all(
                                        width: 1,
                                        color: borderGrey,
                                      ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: padding10,
                            child: Text(
                              ' Pick Up ',
                              style: TextStyle(
                                  color: feedbackDriverProviderWatch
                                          .isPickupIssueClicked
                                      ? whiteColor
                                      : lightBlack,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          feedbackDriverProviderWatch
                              .onCabClickedIssueClickedFunction();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: feedbackDriverProviderWatch.isCabClicked
                                ? lightBlack
                                : whiteColor,
                            border: feedbackDriverProviderWatch.isCabClicked
                                ? null
                                : Border.all(
                                    width: 1,
                                    color: borderGrey,
                                  ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: padding10,
                            child: Text(
                              ' Cab Issue ',
                              style: TextStyle(
                                  color:
                                      feedbackDriverProviderWatch.isCabClicked
                                          ? whiteColor
                                          : lightBlack,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          feedbackDriverProviderWatch
                              .onRouteKnowledgeClickedFunction();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: feedbackDriverProviderWatch
                                    .isRouteKnowledgeClicked
                                ? lightBlack
                                : whiteColor,
                            border: feedbackDriverProviderWatch
                                    .isRouteKnowledgeClicked
                                ? null
                                : Border.all(
                                    width: 1,
                                    color: borderGrey,
                                  ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: padding10,
                            child: Text(
                              ' Route Knowledge ',
                              style: TextStyle(
                                  color: feedbackDriverProviderWatch
                                          .isRouteKnowledgeClicked
                                      ? whiteColor
                                      : lightBlack,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          feedbackDriverProviderWatch
                              .onWhileDrivingClickedFunction();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: feedbackDriverProviderWatch
                                    .isWhileDrivingClicked
                                ? lightBlack
                                : whiteColor,
                            border: feedbackDriverProviderWatch
                                    .isWhileDrivingClicked
                                ? null
                                : Border.all(
                                    width: 1,
                                    color: borderGrey,
                                  ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: padding10,
                            child: Text(
                              ' While Driving ',
                              style: TextStyle(
                                  color: feedbackDriverProviderWatch
                                          .isWhileDrivingClicked
                                      ? whiteColor
                                      : lightBlack,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          feedbackDriverProviderWatch
                              .onMobileEngagementClickedFunction();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: feedbackDriverProviderWatch
                                    .mobileEngagementClicked
                                ? lightBlack
                                : whiteColor,
                            border: feedbackDriverProviderWatch
                                    .mobileEngagementClicked
                                ? null
                                : Border.all(
                                    width: 1,
                                    color: borderGrey,
                                  ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: padding10,
                            child: Text(
                              'Mobile Engagement',
                              style: TextStyle(
                                  color: feedbackDriverProviderWatch
                                          .mobileEngagementClicked
                                      ? whiteColor
                                      : lightBlack,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  height20,
                  CustomButtonOnlyBorder(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RaiseNewTicket(),
                          ),
                        );
                      },
                      title: AppLocalizations.of(context)!.raiseTicket,
                      border: true),
                  height20,
                  CustomButton(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const ReviewSuccess();
                        },
                      ).then((value) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserOnlineHome(),
                          ),
                        );
                      });
                      Fluttertoast.showToast(
                        msg: AppLocalizations.of(context)!
                            .driverRatingSuccessPopUp,
                      );
                    },
                    title: AppLocalizations.of(context)!.submitNow,
                    border: true,
                  ),
                  height45,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
