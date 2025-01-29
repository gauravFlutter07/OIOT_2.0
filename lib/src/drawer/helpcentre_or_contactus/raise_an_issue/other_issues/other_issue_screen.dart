import '../../../../../imports.dart';

class OtherIssueScreen extends StatelessWidget {
  const OtherIssueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OtherIssueProvider>(
      builder: (context, otherIssueProvider, child) => Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: padding12,
              child: Column(
                children: [
                  CustomHeader(
                      title: AppLocalizations.of(context)!.raiseAnIssue),
                  height15,
                  TicketDropdownFitnessWidget(
                      hint: AppLocalizations.of(context)!.appIssue),
                  height15,
                  TextField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.comment,
                      filled: true,
                      fillColor: whiteColor,
                      border: OutlineInputBorder(
                        borderRadius: circularBorderRadius8,
                        borderSide: BorderSide(color: backgroundGrey),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                      hintStyle: TextStyle(color: textDarkGrey),
                    ),
                    style: tsRegular,
                    minLines: 6,
                    maxLines: 8,
                  ),
                  height20,
                  Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: circularBorderRadius7,
                      border: Border.all(color: textGrey, width: 0.8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: leftPadding10,
                            child: Text(
                              AppLocalizations.of(context)!.uploadImage,
                              style: tsRegularGrey,
                            ),
                          ),
                        ),
                        width10,
                        SizedBox(
                          height: 44,
                          child: TextButton(
                            onPressed: () {
                              bottomSheet(
                                  context: context,
                                  isPdf: false,
                                  provider: otherIssueProvider);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: blueMain,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.zero),
                              ),
                            ),
                            child: Padding(
                              padding: horizontalPadding8,
                              child: Text(
                                AppLocalizations.of(context)!.browse,
                                style: tsSmallWhite,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  height20,
                  otherIssueProvider.image == null
                      ? Align(
                          alignment: Alignment.center,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.noImageSelected,
                                style: tsRegularBoldGrey,
                              ),
                              const SizedBox(
                                height: 180,
                                width: double.infinity,
                              ),
                            ],
                          ),
                        )
                      : Align(
                          alignment: Alignment.center,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 160,
                                width: 160,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: black54,
                                ),
                                child: Image.file(
                                  otherIssueProvider.image!,
                                  height: 160,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                  height20,
                  CustomButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    title: AppLocalizations.of(context)!.submitTicket,
                    border: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
