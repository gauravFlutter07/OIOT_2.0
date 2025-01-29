import 'package:flutter_pdfview/flutter_pdfview.dart';

import '../imports.dart';

class PdfViewer extends StatelessWidget {
  final dynamic provider;
  final File selectedPdf;
  final String? pdfName;
  const PdfViewer(
      {this.pdfName, this.provider, required this.selectedPdf, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PDFView(
            filePath: selectedPdf.path,
            enableSwipe: true,
            onPageChanged: (page, total) {
              Text('Page $page');
            },
          ),
        ),
        CustomButton(
          onTap: () {
            provider.setPdf(selectedPdf, pdfName);
            if (pdfName == null) {
              provider.getLastPdfPathName();
            } else {
              provider.getLastPdfPathName(pdfName);
            }
            Navigator.pop(context);
            Navigator.pop(context);
          },
          title: 'Select PDF',
          border: true,
        ),
      ],
    );
  }
}
