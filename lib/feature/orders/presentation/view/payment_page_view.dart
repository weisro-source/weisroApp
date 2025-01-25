import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPageView extends StatefulWidget {
  const PaymentPageView({super.key, required this.paymentUrl});
  final String paymentUrl;
  @override
  State<PaymentPageView> createState() => _PaymentPageViewState();
}

class _PaymentPageViewState extends State<PaymentPageView> {
  late final WebViewController webViewController;
  @override
  void initState() {
    super.initState();

    webViewController = WebViewController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(
            controller: webViewController
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..setBackgroundColor(const Color(0x00000000))
              ..setNavigationDelegate(
                NavigationDelegate(
                  onProgress: (int progress) {
                    // Update loading bar.
                  },
                  onPageStarted: (String url) {},
                  onPageFinished: (String url) {
                    // LoggerHelper.info("the URL $url");
                    // if (url.contains("https://andechser-burger.de/orders")) {
                    //   placeOrderCubit.placeOrder = PlaceOrderModel();
                    //   placeOrderCubit.totalPrice = 0;
                    //   bottomNav.currentIndex = 0;
                    //   HelperFunctions.navigateToScreenAndRemove(
                    //       context, const HomePage());
                    // }
                  },
                  onWebResourceError: (WebResourceError error) {},
                ),
              )
              ..loadRequest(Uri.parse(widget.paymentUrl))),
      ),
    );
  }
}
