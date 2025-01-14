import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:weisro/core/api/api_service.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/core/widgets/custom_loading.dart';

class PrivacyPolicyPageView extends StatefulWidget {
  const PrivacyPolicyPageView({
    Key? key,
    required this.appTitle,
  }) : super(key: key);

  final String appTitle;

  @override
  State<PrivacyPolicyPageView> createState() => _PrivacyPolicyPageViewState();
}

class _PrivacyPolicyPageViewState extends State<PrivacyPolicyPageView> {
  String _htmlContent = "";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchHtmlContent();
  }

  Future<void> _fetchHtmlContent() async {
    try {
      // Fetch the full Response object
      final response = await getIt.get<ApiService>().getHtml(
            endPoint:
                "https://www.freeprivacypolicy.com/live/61acdb23-a7fd-407f-8842-408404beacfa",
          );

      if (response.statusCode == 200) {
        // Ensure we pass only the response body to the parser
        setState(() {
          _htmlContent = response.data.toString();
          _isLoading = false;
        });
      } else {
        setState(() {
          _htmlContent =
              "Failed to load privacy policy. Status code: ${response.statusCode}";
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _htmlContent =
            "An error occurred while loading the privacy policy. Error: $e";
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.appTitle,
          style: AppStyles.style18w500Grey(context)
              .copyWith(color: AppColors.orangeColor),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CustomLoading())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: _htmlContent.isEmpty
                  ? const Center(child: Text("No content available"))
                  : Html(
                      // Using flutter_html package to render HTML content
                      data: _htmlContent,
                      style: {
                        "body": Style(
                          fontSize: FontSize(16.0),
                          color: AppColors.greyColor,
                        ),
                      },
                    ),
            ),
    );
  }
}
