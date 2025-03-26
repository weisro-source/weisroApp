import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:weisro/core/utils/ansi_color.dart';
import 'package:weisro/feature/booking/data/models/your_booking_model.dart';

class QRScannerScreen extends StatefulWidget {
  final Docs booking;

  const QRScannerScreen({Key? key, required this.booking}) : super(key: key);

  @override
  QRScannerScreenState createState() => QRScannerScreenState();
}

class QRScannerScreenState extends State<QRScannerScreen> {
  MobileScannerController cameraController = MobileScannerController();

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code '),
      ),
      body: MobileScanner(
        controller: cameraController,
        onDetect: (capture) {
          final List<Barcode> barCodes = capture.barcodes;
          for (final barcode in barCodes) {
            log(
              AnsiColor.colorize(
                "barcodes $barcode",
                AnsiColor.blue,
              ),
              name: "barCodes List",
            );
          }
        },
        // onDetect: (barcode, args) {
        //   final List<Barcode> barCodes = [barcode];
        //   for (final barcode in barCodes) {
        //     log(
        //       AnsiColor.colorize(
        //         "barcodes $barcode",
        //         AnsiColor.blue,
        //       ),
        //       name: "barCodes List",
        //     );
        //   }
        // },
      ),
    );
  }
}
