import '../../../../../imports.dart';

class ImageContainerPan extends StatelessWidget {
  const ImageContainerPan({super.key});

  @override
  Widget build(BuildContext context) {
    final providerWatch = context.watch<UpdateKycProvider>();
    return Consumer<UpdateKycProvider>(
      builder: (context, provider, child) {
        return provider.panImage == null && provider.panPdf != null
            ? InkWell(
                onTap: () {
                  bottomSheet(
                      context: context,
                      provider: provider,
                      isPdf: true,
                      imageName: 'panCard');
                  provider.getLastPdfPathName('panCard');
                },
                child: Column(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 50,
                        child: Image.asset(pdfImage),
                      ),
                    ),
                    Text(
                      ' ${providerWatch.selectedPdfPancard}',
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
                        context: context,
                        provider: provider,
                        isPdf: true,
                        imageName: 'panCard');
                    provider.getLastPdfPathName('panCard');
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: lightGrey,
                        borderRadius: BorderRadius.circular(5)),
                    child: provider.panImage == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.upload_file,
                                size: 40,
                              ),
                              Text(
                                AppLocalizations.of(context)!.uploadTheFiles,
                              )
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
                                          isPdf: true,
                                          imageName: 'panCard');
                                    },
                                    child: SizedBox(
                                      height: 250,
                                      width: 350,
                                      child: Image.file(
                                        provider.panImage!,
                                        fit: BoxFit.fill,
                                      ),
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
