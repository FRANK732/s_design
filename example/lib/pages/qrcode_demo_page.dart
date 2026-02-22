import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class QRCodeDemoPage
    extends StatefulWidget {
  const QRCodeDemoPage(
      {super.key});

  @override
  State<QRCodeDemoPage>
      createState() =>
          _QRCodeDemoPageState();
}

class _QRCodeDemoPageState
    extends State<
        QRCodeDemoPage> {
  SQRCodeStatus
      _status =
      SQRCodeStatus.active;

  @override
  Widget build(
      BuildContext
          context) {
    return Scaffold(
      appBar:
          AppBar(
        title: const Text('SQRCode Demo'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body:
          SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'Basic',
              const SQRCode(value: 'https://flutter.dev/'),
            ),
            const SizedBox(height: 32),
            _buildSection(
              'With Icon',
              SQRCode(
                value: 'https://flutter.dev/',
                icon: Container(color: Colors.black, child: const Icon(Icons.hub, color: Colors.white, size: 24)),
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              'Borderless',
              const SQRCode(
                value: 'https://flutter.dev/',
                bordered: false,
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              'Custom Colors',
              const SQRCode(
                value: 'https://flutter.dev/',
                color: Colors.green,
                backgroundColor: Color(0xFFf6ffed), // Light green bg
                bordered: false,
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              'Status: $_status',
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SQRCode(
                    value: 'https://flutter.dev/',
                    status: _status,
                    onRefresh: () {
                      setState(() {
                        _status = SQRCodeStatus.active;
                      });
                    },
                  ),
                  const SizedBox(width: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SButton(onPressed: () => setState(() => _status = SQRCodeStatus.active), child: const Text('Active')),
                      const SizedBox(height: 8),
                      SButton(onPressed: () => setState(() => _status = SQRCodeStatus.loading), child: const Text('Loading')),
                      const SizedBox(height: 8),
                      SButton(onPressed: () => setState(() => _status = SQRCodeStatus.expired), child: const Text('Expired')),
                      const SizedBox(height: 8),
                      SButton(onPressed: () => setState(() => _status = SQRCodeStatus.scanned), child: const Text('Scanned')),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      String
          title,
      Widget
          child) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 16),
        child,
      ],
    );
  }
}
