import 'package:flutter/material.dart';
import 'package:portfolio/presentation/atomic_design/foundations/colors.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:printing/printing.dart';

class CVSection extends StatelessWidget {
  const CVSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      width: size.width / 2,
      height: size.height - 40,
      child: Column(
        children: [
          Expanded(
            child: Theme(
              data: ThemeData(
                  primaryColor: PortfolioColorsFoundation.accentColor),
              child: PdfPreview(
                padding: const EdgeInsets.all(0),
                scrollViewDecoration: const BoxDecoration(color: Colors.black),
                allowPrinting: false,
                allowSharing: true,
                previewPageMargin: const EdgeInsets.all(0),
                canChangeOrientation: false,
                canChangePageFormat: false,
                canDebug: false,
                maxPageWidth: MediaQuery.of(context).size.width * 0.8,
                build: (format) => generatePdf(format),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
