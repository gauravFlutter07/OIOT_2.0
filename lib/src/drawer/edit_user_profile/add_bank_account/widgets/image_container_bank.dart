import '../../../../../imports.dart';

class ImageContainerBank extends StatelessWidget {
  const ImageContainerBank({super.key});

  @override
  Widget build(BuildContext context) {
    final providerWatch = context.watch<AddBankAccountProvider>();
    return Consumer<AddBankAccountProvider>(
      builder: (context, provider, child) {
        return provider.passbookImage == null && provider.passbookPdf != null
            ? InkWell(
                onTap: () {
                  bottomSheet(
                      context: context, provider: provider, isPdf: true);
                  provider.getLastPdfPathName();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.picture_as_pdf,
                      color: redColor,
                      size: 40,
                    ),
                    Text(
                      ' ${providerWatch.selectedPdfLastPath}',
                      style: tsRegularBold,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: blueGreyshade50,
                        borderRadius: circularBorderRadius10,
                      ),
                      child: Padding(
                        padding: padding8,
                        child: Text(
                          AppLocalizations.of(context)!.edit,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : DottedBorder(
                radius: const Radius.circular(5),
                strokeWidth: 1,
                dashPattern: const [5, 5],
                color: textGrey,
                child: InkWell(
                  onTap: () {
                    bottomSheet(
                        context: context, provider: provider, isPdf: true);
                    provider.getLastPdfPathName();
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: lightGrey,
                      borderRadius: circularBorderRadius5,
                    ),
                    child: provider.passbookImage == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.upload_file,
                                size: 40,
                              ),
                              Text(AppLocalizations.of(context)!.uploadTheFiles)
                            ],
                          )
                        : Stack(
                            children: [
                              Positioned(
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () async {
                                      bottomSheet(
                                          context: context,
                                          provider: provider,
                                          isPdf: true);
                                    },
                                    child: SizedBox(
                                      height: 250,
                                      width: 350,
                                      child: Image.file(
                                        provider.passbookImage!,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 8,
                                child: Card(
                                  color: white54,
                                  child: Padding(
                                    padding: padding8,
                                    child: Text(
                                      AppLocalizations.of(context)!.edit,
                                      style: tsRegularBold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              );
      },
    );
  }
}
