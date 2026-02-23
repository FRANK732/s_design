import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

/// Demo page showcasing all Alert samples for [SAlert].
class SAlertPage
    extends StatefulWidget {
  const SAlertPage(
      {super.key});

  @override
  State<SAlertPage>
      createState() =>
          _SAlertPageState();
}

class _SAlertPageState
    extends State<
        SAlertPage> {
  bool
      _smoothCloseVisible =
      true;

  @override
  Widget build(
      BuildContext
          context) {
    return SScaffold(
      appBar:
          AppBar(title: const Text('SAlert')),
      renderBody: (context) =>
          ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── 1. Basic ──────────────────────────────────────────────────────
          _sectionHeader('1. Basic'),
          const SAlert(type: SAlertType.success, title: 'Success Text'),
          const SizedBox(height: 8),
          const SAlert(title: 'Info Text'),
          const SizedBox(height: 8),
          const SAlert(type: SAlertType.warning, title: 'Warning Text'),
          const SizedBox(height: 8),
          const SAlert(type: SAlertType.error, title: 'Error Text'),
          const SizedBox(height: 24),

          // ── 2. Description ────────────────────────────────────────────────
          _sectionHeader('2. With Description'),
          const SAlert(
            type: SAlertType.success,
            title: 'Success Text',
            description: 'Success Description Success Description Success Description',
          ),
          const SizedBox(height: 8),
          const SAlert(
            title: 'Info Text',
            description: 'Info Description Info Description Info Description Info Description',
          ),
          const SizedBox(height: 8),
          const SAlert(
            type: SAlertType.warning,
            title: 'Warning Text',
            description: 'Warning Description Warning Description Warning Description Warning Description',
          ),
          const SizedBox(height: 8),
          const SAlert(
            type: SAlertType.error,
            title: 'Error Text',
            description: 'Error Description Error Description Error Description Error Description',
          ),
          const SizedBox(height: 24),

          // ── 3. Icon ───────────────────────────────────────────────────────
          _sectionHeader('3. With Icon'),
          const SAlert(type: SAlertType.success, title: 'Success Tips', showIcon: true),
          const SizedBox(height: 8),
          const SAlert(title: 'Informational Notes', showIcon: true),
          const SizedBox(height: 8),
          const SAlert(type: SAlertType.warning, title: 'Warning', showIcon: true, closable: true),
          const SizedBox(height: 8),
          const SAlert(type: SAlertType.error, title: 'Error', showIcon: true),
          const SizedBox(height: 8),
          const SAlert(
            type: SAlertType.success,
            title: 'Success Tips',
            description: 'Detailed description and advice about successful copywriting.',
            showIcon: true,
          ),
          const SizedBox(height: 8),
          const SAlert(
            title: 'Informational Notes',
            description: 'Additional description and information about copywriting.',
            showIcon: true,
          ),
          const SizedBox(height: 8),
          const SAlert(
            type: SAlertType.warning,
            title: 'Warning',
            description: 'This is a warning notice about copywriting.',
            showIcon: true,
            closable: true,
          ),
          const SizedBox(height: 8),
          const SAlert(
            type: SAlertType.error,
            title: 'Error',
            description: 'This is an error message about copywriting.',
            showIcon: true,
          ),
          const SizedBox(height: 24),

          // ── 4. Closable ───────────────────────────────────────────────────
          _sectionHeader('4. Closable'),
          SAlert(
            type: SAlertType.warning,
            title: 'Warning Title',
            closable: true,
            onClose: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Warning alert closed')),
            ),
          ),
          const SizedBox(height: 8),
          SAlert(
            type: SAlertType.success,
            title: 'Success Title',
            closable: true,
            onClose: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Success alert closed')),
            ),
          ),
          const SizedBox(height: 8),
          SAlert(
            title: 'Info Title',
            closable: true,
            onClose: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Info alert closed')),
            ),
          ),
          const SizedBox(height: 8),
          SAlert(
            type: SAlertType.error,
            title: 'Error Title',
            closable: true,
            onClose: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Error alert closed')),
            ),
          ),
          const SizedBox(height: 24),

          // ── 5. Action ─────────────────────────────────────────────────────
          _sectionHeader('5. With Action'),
          SAlert(
            type: SAlertType.success,
            title: 'Success Tips',
            showIcon: true,
            closable: true,
            action: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                minimumSize: const Size(40, 28),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text('UNDO', style: TextStyle(fontSize: 12)),
            ),
          ),
          const SizedBox(height: 8),
          SAlert(
            type: SAlertType.error,
            title: 'Error Text',
            description: 'Error Description Error Description Error Description Error Description',
            showIcon: true,
            action: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade50,
                foregroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                minimumSize: const Size(60, 28),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                textStyle: const TextStyle(fontSize: 12),
                elevation: 0,
                side: BorderSide(color: Colors.red.shade200),
              ),
              child: const Text('Detail'),
            ),
          ),
          const SizedBox(height: 8),
          SAlert(
            type: SAlertType.warning,
            title: 'Warning Text',
            closable: true,
            action: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                minimumSize: const Size(48, 28),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text('Done', style: TextStyle(fontSize: 12)),
            ),
          ),
          const SizedBox(height: 8),
          SAlert(
            title: 'Info Text',
            description: 'Info Description Info Description Info Description Info Description',
            closable: true,
            action: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    minimumSize: const Size(72, 28),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    textStyle: const TextStyle(fontSize: 12),
                  ),
                  child: const Text('Accept'),
                ),
                const SizedBox(height: 4),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    minimumSize: const Size(72, 28),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    textStyle: const TextStyle(fontSize: 12),
                    side: const BorderSide(color: Colors.red),
                  ),
                  child: const Text('Decline'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // ── 6. Banner ─────────────────────────────────────────────────────
          _sectionHeader('6. Banner Mode'),
          const SAlert(title: 'Warning text', banner: true),
          const SizedBox(height: 8),
          const SAlert(
            title: 'Very long warning text warning text text text text text text text',
            banner: true,
            closable: true,
          ),
          const SizedBox(height: 8),
          const SAlert(
            title: 'Warning text without icon',
            banner: true,
          ),
          const SizedBox(height: 8),
          const SAlert(type: SAlertType.error, title: 'Error text', banner: true),
          const SizedBox(height: 24),

          // ── 7. Custom Icon ────────────────────────────────────────────────
          _sectionHeader('7. Custom Icon'),
          const SAlert(
            icon: Icon(Icons.sentiment_satisfied_alt, color: Colors.orange),
            title: 'showIcon = false (no icon shown)',
            type: SAlertType.success,
          ),
          const SizedBox(height: 8),
          const SAlert(
            icon: Icon(Icons.sentiment_satisfied_alt, color: Colors.orange),
            title: 'Success Tips',
            type: SAlertType.success,
            showIcon: true,
          ),
          const SizedBox(height: 8),
          const SAlert(
            icon: Icon(Icons.sentiment_satisfied_alt, color: Colors.orange),
            title: 'Informational Notes',
            showIcon: true,
          ),
          const SizedBox(height: 8),
          const SAlert(
            icon: Icon(Icons.sentiment_satisfied_alt, color: Colors.orange),
            title: 'Warning',
            type: SAlertType.warning,
            showIcon: true,
          ),
          const SizedBox(height: 8),
          const SAlert(
            icon: Icon(Icons.sentiment_satisfied_alt, color: Colors.orange),
            title: 'Error',
            type: SAlertType.error,
            showIcon: true,
          ),
          const SizedBox(height: 8),
          const SAlert(
            icon: Icon(Icons.sentiment_satisfied_alt, color: Colors.orange),
            title: 'Success Tips',
            description: 'Detailed description and advice about successful copywriting.',
            type: SAlertType.success,
            showIcon: true,
          ),
          const SizedBox(height: 24),

          // ── 8. Smooth Close ───────────────────────────────────────────────
          _sectionHeader('8. Smooth Close (after close → re-show)'),
          if (_smoothCloseVisible)
            SAlert(
              type: SAlertType.success,
              title: 'Alert Message Text',
              closable: true,
              onClose: () {},
              afterClose: () => setState(() => _smoothCloseVisible = false),
            ),
          if (!_smoothCloseVisible) ...[
            const Text('Closed! Tap the button below to re-show.'),
          ],
          const SizedBox(height: 8),
          Row(
            children: [
              ElevatedButton(
                onPressed: () => setState(() => _smoothCloseVisible = true),
                child: const Text('Re-show Alert'),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // ── 9. Open Customizability ───────────────────────────────────────
          _sectionHeader('9. Open Customizability'),
          const SAlert(
            type: SAlertType.error,
            title: 'Fully Custom Alert',
            description: 'Purple theme with custom border, radius, and styles.',
            showIcon: true,
            closable: true,
            backgroundColor: Color(0xFFF5F0FF),
            borderColor: Color(0xFF722ED1),
            borderWidth: 1.5,
            borderRadius: BorderRadius.all(Radius.circular(2)),
            iconColor: Color(0xFF722ED1),
            iconSize: 20,
            titleStyle: TextStyle(
              color: Color(0xFF391085),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            descriptionStyle: TextStyle(
              color: Color(0xFF722ED1),
              fontSize: 12,
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            elevation: 4,
            shadowColor: Color(0x40722ED1),
          ),
          const SizedBox(height: 8),
          SAlert(
            title: 'Custom Size Constraint',
            description: 'constrained to 400 px max width.',
            showIcon: true,
            constraints: const BoxConstraints(maxWidth: 400),
            action: TextButton(onPressed: () {}, child: const Text('Learn more')),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _sectionHeader(
      String
          text) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 10),
      child:
          Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
