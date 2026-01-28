import 'package:auto_route/auto_route.dart';
import 'package:qr_pay_app/src/core/widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final int? scrollY;

  const WebViewPage({
    super.key,
    required this.url,
    this.scrollY,
  });

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  InAppWebViewController? webViewController;
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: '',
        actions: [
          GestureDetector(
            onTap: () => context.router.pop(),
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primitiveNeutralwarm0,
              ),
              child: const Icon(Icons.close_rounded),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(widget.url)),
            onWebViewCreated: (controller) {
              webViewController = controller;
            },
            onLoadStop: (controller, url) async {
              await Future.delayed(const Duration(milliseconds: 10));
              await controller.scrollBy(
                  x: 0, y: widget.scrollY ?? 0, animated: false);
            },
            onProgressChanged: (controller, p) =>
                setState(() => progress = p / 100),
          ),
          if (progress < 1.0) const CircleLoader()
        ],
      ),
    );
  }
}
