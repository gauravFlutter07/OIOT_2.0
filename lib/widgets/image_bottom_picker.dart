import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:oiot/widgets/pdf_viewer.dart';

import '../imports.dart';

Future<Widget?> bottomSheet(
    {required BuildContext context,
    dynamic provider,
    String? imageName,
    bool? isPdf}) async {
  return await showModalBottomSheet(
    backgroundColor: Colors.grey.shade400,
    // barrierColor: Colors.blue,
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 250,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    getImage(ImageSource.camera, context, provider, imageName);
                    Navigator.pop(context);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        IconData(0xf60b, fontFamily: 'MaterialIcons'),
                        size: 25,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Use a Camera ',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey.shade50),
                  ),
                  onPressed: () {
                    log('image name in gallery select : $imageName');
                    getImage(ImageSource.gallery, context, provider, imageName);
                    log('gallery image name: $imageName');
                    Navigator.pop(context);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image, size: 25, color: Colors.black),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Browse Gallery',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                isPdf == true
                    ? ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey.shade50)),
                        onPressed: () {
                          log('imageName in pdf: $imageName');
                          pickPdf(context, provider, imageName);
                          if (imageName == null) {
                            provider.setImageNull();
                          } else {
                            provider.setImageNull(imageName);
                          }
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.picture_as_pdf_rounded,
                                size: 25, color: Colors.black),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Select PDF File',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future getImage(ImageSource imageSource, BuildContext context, dynamic provider,
    String? imageName) async {
  var image = await ImagePicker().pickImage(source: imageSource);
  if (image == null) return;
  final imageTemporary = File(image.path);
  log('image name: ${imageName.toString()}');
  // Here it will set the image at the prefered provider class
  provider.setImage(imageTemporary, imageName);
}

Future<void> pickPdf(
    BuildContext context, dynamic provider, String? pdfName) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf'],
  );

  if (result != null) {
    File selectedPdf = File(result.files.single.path!);

    log('Pdf Name: $pdfName');
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewer(
          provider: provider,
          selectedPdf: selectedPdf,
          pdfName: pdfName,
        ),
      ),
    );
  }
}
