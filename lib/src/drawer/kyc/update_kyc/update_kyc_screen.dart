import '../../../../imports.dart';

class UpdateKyC extends StatelessWidget {
  const UpdateKyC({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Consumer<UpdateKycProvider>(
      builder: (context, updateKycProvider, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: padding8,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomHeader(title: AppLocalizations.of(context)!.kyc),
                  height30,
                  Padding(
                    padding: horizontalPadding20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .selectAnyOneDocumentAndUpload,
                              style: tsRegularBoldGrey,
                            ),
                            Text(
                              ' *',
                              style: TextStyle(color: red),
                            ),
                          ],
                        ),
                        height10,
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: textDarkGrey,
                              width: 1,
                            ),
                            borderRadius: circularBorderRadius8,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              right: 10,
                            ),
                            child: DropdownButton<String>(
                              underline: const SizedBox(),
                              value: updateKycProvider.selectedDocument,
                              isExpanded: true,
                              items: <String>[
                                AppLocalizations.of(context)!.aadhaar,
                                AppLocalizations.of(context)!.pan,
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                updateKycProvider.selectedDocument = newValue!;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  height20,
                  if (updateKycProvider.selectedDocument ==
                      AppLocalizations.of(context)!.pan)
                    Padding(
                      padding: padding8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.panNumber,
                            style: tsRegularBold,
                          ),
                          height10,
                          TextFormField(
                            controller: updateKycProvider.panNumber,
                            obscureText: false,
                            decoration: const InputDecoration(
                              hintText: 'ABCD2346',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .pleaseEnterPanNumber;
                              }

                              return null;
                            },
                          ),
                          height30,
                          Text(
                            AppLocalizations.of(context)!.uploadPan,
                            style: tsRegularBold,
                          ),
                          height10,
                          const ImageContainerPan(),
                          height20,
                        ],
                      ),
                    ),
                  if (updateKycProvider.selectedDocument ==
                      AppLocalizations.of(context)!.aadhaar)
                    Padding(
                      padding: padding8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.aadhaarNumber,
                            style: tsRegularBold,
                          ),
                          height10,
                          TextFormField(
                            controller: updateKycProvider.aadharNumber,
                            obscureText: false,
                            decoration: const InputDecoration(
                              hintText: '7463 4657 8765',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .pleaseEnterAadhaarNumber;
                              }

                              return null;
                            },
                          ),
                          height30,
                          Text(
                            AppLocalizations.of(context)!.uploadAadhaar,
                            style: tsRegularBold,
                          ),
                          height10,
                          const ImageContainerAadhar(),
                          height20,
                        ],
                      ),
                    ),
                  const Spacer(),
                  Padding(
                    padding: padding8,
                    child: CustomButton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          bool success =
                              await updateKycProvider.addKycData(context);
                          if (success) {
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamed(
                                context, RouteClass.userOfflineHome);
                            updateKycProvider.clearAllKycTextControllers();
                          }
                        }
                      },
                      title: AppLocalizations.of(context)!.saveChanges,
                      border: true,
                    ),
                  ),
                  height40,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
