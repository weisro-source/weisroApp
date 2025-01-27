import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/enums/order_status.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/booking/data/models/your_booking_model.dart';
import 'package:weisro/generated/l10n.dart';

class YourBookingWidget extends StatelessWidget {
  const YourBookingWidget({
    super.key,
    required this.booking,
  });

  final Docs booking;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: AppColors.orangeColor, width: 1),
      ),
      child: Row(
        children: [
          30.kw,
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10),
            child: SizedBox(
              width: 90.0,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: HelperFunctions.ensureIsFirstItemOrNull(
                        booking.service?.images ?? []) ??
                    "",
                errorWidget: (context, url, error) {
                  return Image.asset(ImagePath.imagesService);
                },
              ),
            ),
          ),
          20.kw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.kh,
                Text(
                  "ID: ${booking.id ?? ""}",
                  style: AppStyles.style12w400Second2(context),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                10.kh,
                Text(
                  "Total Price: ${booking.totalPrice ?? ""}",
                  style: AppStyles.style12w400Second2(context),
                ),
                10.kh,
                Text(
                  "Payment Method: ${booking.paymentMethod ?? ""}",
                  style: AppStyles.style12w400Second2(context),
                ),
                10.kh,
                Text(
                  "Order Status: ${booking.status ?? ""}",
                  style: AppStyles.style12w400Second2(context),
                ),
              ],
            ),
          ),
          Visibility(
            visible: booking.status == OrderStatus.inProgress.name,
            child: IconButton(
              icon: const Icon(Icons.qr_code_scanner,
                  color: AppColors.orangeColor),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => QRScannerScreen(booking: booking),
                //   ),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key, required this.booking});

  final Docs booking;

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan QR Code"),
      ),
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      if (context.mounted) {
        Navigator.pop(context);
      }

      // Validate scanned data with booking information
      if (scanData.code == widget.booking.id) {
        // HelperFunctions.showToast(
        //     "Valid QR Code for booking ID: ${widget.booking.id}");
        print("Valid QR Code for booking ID: ${widget.booking.id}");
      } else {
        print("Invalid QR Code");
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
