import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import '../widgets/component_page.dart';

class QRCodeDemoPage
    extends StatelessWidget {
  const QRCodeDemoPage(
      {super.key});

  @override
  Widget build(
      BuildContext
          context) {
    final l10n = SLocalizations.ofContext(context);
    return ComponentPage(
      name:
          'SQRCode',
      description: l10n.qrcodeDesc,
      whenToUse: [
        l10n.qrcodeTip1,
        l10n.qrcodeTip2,
        l10n.qrcodeTip3,
      ],
      sections: [
        ComponentSection(
          title: l10n.qrcodeSectionBasic,
          description: 'Show a scannable QR code for any string.',
          demo: const Center(
            child: SQRCode(value: 'https://example.com'),
          ),
          code: '''
const SQRCode(value: 'https://example.com');''',
        ),
        ComponentSection(
          title: l10n.qrcodeSectionColor,
          description: 'Change the QR color to match your brand.',
          demo: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SQRCode(value: 'brand-blue', color: Colors.indigo, size: 100),
              SQRCode(value: 'brand-green', color: Colors.teal, size: 100),
            ],
          ),
          code: '''
SQRCode(value: 'your-data', color: Colors.indigo, size: 100);
SQRCode(value: 'your-data', color: Colors.teal, size: 100);''',
        ),
        ComponentSection(
          title: l10n.qrcodeSectionIcon,
          description: 'Overlay an icon in the center of the QR code.',
          demo: const Center(
            child: SQRCode(
              value: 'https://flutter.dev',
              icon: Icon(Icons.flutter_dash, color: Colors.blue),
              iconSize: 30,
              size: 140,
            ),
          ),
          code: '''
const SQRCode(
  value: 'https://flutter.dev',
  icon: Icon(Icons.flutter_dash, color: Colors.blue),
  iconSize: 30,
  size: 140,
);''',
        ),
        ComponentSection(
          title: l10n.qrcodeSectionExpired,
          description: 'Show an expired overlay with `status: SQRCodeStatus.expired`.',
          demo: const Center(
            child: SQRCode(
              value: 'expired-session',
              status: SQRCodeStatus.expired,
              size: 140,
            ),
          ),
          code: '''
const SQRCode(
  value: 'expired-session',
  status: SQRCodeStatus.expired,
  size: 140,
);''',
        ),
        ComponentSection(
          title: l10n.qrcodeSectionScanned,
          description: 'Show a check mark overlay with `status: SQRCodeStatus.scanned`.',
          demo: const Center(
            child: SQRCode(
              value: 'scanned-code',
              status: SQRCodeStatus.scanned,
              size: 140,
            ),
          ),
          code: '''
const SQRCode(
  value: 'scanned-code',
  status: SQRCodeStatus.scanned,
  size: 140,
);''',
        ),
      ],
    );
  }
}
