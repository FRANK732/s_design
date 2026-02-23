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
    return const ComponentPage(
      name:
          'SQRCode',
      description:
          'A QR code generator component built on top of `qr_flutter`. '
          'Supports custom size, colors, icons, bordered style, and status overlays (expired, loading, scanned).',
      whenToUse: [
        'For displaying payment or app-sharing QR codes.',
        'When you need a scannable QR that shows a loading or expired state.',
        'For embedding a logo or icon inside the QR code.',
      ],
      sections: [
        ComponentSection(
          title: 'Basic QR Code',
          description: 'Show a scannable QR code for any string.',
          demo: Center(
            child: SQRCode(value: 'https://example.com'),
          ),
          code: '''
const SQRCode(value: 'https://example.com');''',
        ),
        ComponentSection(
          title: 'Custom Color',
          description: 'Change the QR color to match your brand.',
          demo: Row(
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
          title: 'With Icon',
          description: 'Overlay an icon in the center of the QR code.',
          demo: Center(
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
          title: 'Status: Expired',
          description: 'Show an expired overlay with `status: SQRCodeStatus.expired`.',
          demo: Center(
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
          title: 'Status: Scanned',
          description: 'Show a check mark overlay with `status: SQRCodeStatus.scanned`.',
          demo: Center(
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
