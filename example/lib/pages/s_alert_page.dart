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
    final l10n = SLocalizations.ofContext(context);
    return SScaffold(
      appBar:
          AppBar(title: Text(l10n.alertTitle)),
      renderBody: (context) =>
          ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── 1. Basic ──────────────────────────────────────────────────────
          _sectionHeader(l10n.demoBasicUsage),
          SAlert(type: SAlertType.success, title: l10n.alertSuccessText),
          const SizedBox(height: 8),
          SAlert(title: l10n.alertInfoText),
          const SizedBox(height: 8),
          SAlert(type: SAlertType.warning, title: l10n.alertWarningText),
          const SizedBox(height: 8),
          SAlert(type: SAlertType.error, title: l10n.alertErrorText),
          const SizedBox(height: 24),

          // ── 2. Description ────────────────────────────────────────────────
          _sectionHeader(l10n.alertSectionDescription),
          SAlert(
            type: SAlertType.success,
            title: l10n.alertSuccessText,
            description: l10n.alertSuccessDesc,
          ),
          const SizedBox(height: 8),
          SAlert(
            title: l10n.alertInfoText,
            description: l10n.alertInfoDesc,
          ),
          const SizedBox(height: 8),
          SAlert(
            type: SAlertType.warning,
            title: l10n.alertWarningText,
            description: l10n.alertWarningDesc,
          ),
          const SizedBox(height: 8),
          SAlert(
            type: SAlertType.error,
            title: l10n.alertErrorText,
            description: l10n.alertErrorDesc,
          ),
          const SizedBox(height: 24),

          // ── 3. Icon ───────────────────────────────────────────────────────
          _sectionHeader(l10n.alertSectionIcon),
          SAlert(type: SAlertType.success, title: l10n.alertSuccessTips, showIcon: true),
          const SizedBox(height: 8),
          SAlert(title: l10n.alertInfoNotes, showIcon: true),
          const SizedBox(height: 8),
          SAlert(type: SAlertType.warning, title: l10n.alertWarning, showIcon: true, closable: true),
          const SizedBox(height: 8),
          SAlert(type: SAlertType.error, title: l10n.alertError, showIcon: true),
          const SizedBox(height: 8),
          SAlert(
            type: SAlertType.success,
            title: l10n.alertSuccessTips,
            description: l10n.alertDetailedSuccess,
            showIcon: true,
          ),
          const SizedBox(height: 8),
          SAlert(
            title: l10n.alertInfoNotes,
            description: l10n.alertAdditionalInfo,
            showIcon: true,
          ),
          const SizedBox(height: 8),
          SAlert(
            type: SAlertType.warning,
            title: l10n.alertWarning,
            description: l10n.alertWarningNotice,
            showIcon: true,
            closable: true,
          ),
          const SizedBox(height: 8),
          SAlert(
            type: SAlertType.error,
            title: l10n.alertError,
            description: l10n.alertErrorMessage,
            showIcon: true,
          ),
          const SizedBox(height: 24),

          // ── 4. Closable ───────────────────────────────────────────────────
          _sectionHeader(l10n.alertSectionClosable),
          SAlert(
            type: SAlertType.warning,
            title: l10n.alertWarningTitle,
            closable: true,
            onClose: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.alertClosedWarning)),
            ),
          ),
          const SizedBox(height: 8),
          SAlert(
            type: SAlertType.success,
            title: l10n.alertSuccessTitle,
            closable: true,
            onClose: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.alertClosedSuccess)),
            ),
          ),
          const SizedBox(height: 8),
          SAlert(
            title: l10n.alertInfoTitle,
            closable: true,
            onClose: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.alertClosedInfo)),
            ),
          ),
          const SizedBox(height: 8),
          SAlert(
            type: SAlertType.error,
            title: l10n.alertErrorTitle,
            closable: true,
            onClose: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.alertClosedError)),
            ),
          ),
          const SizedBox(height: 24),

          // ── 5. Action ─────────────────────────────────────────────────────
          _sectionHeader(l10n.alertSectionAction),
          SAlert(
            type: SAlertType.success,
            title: l10n.alertSuccessTips,
            showIcon: true,
            closable: true,
            action: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                minimumSize: const Size(40, 28),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(l10n.alertBtnUndo, style: const TextStyle(fontSize: 12)),
            ),
          ),
          const SizedBox(height: 8),
          SAlert(
            type: SAlertType.error,
            title: l10n.alertErrorText,
            description: l10n.alertErrorDesc,
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
              child: Text(l10n.alertBtnDetail),
            ),
          ),
          const SizedBox(height: 8),
          SAlert(
            type: SAlertType.warning,
            title: l10n.alertWarningText,
            closable: true,
            action: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                minimumSize: const Size(48, 28),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(l10n.alertBtnDone, style: const TextStyle(fontSize: 12)),
            ),
          ),
          const SizedBox(height: 8),
          SAlert(
            title: l10n.alertInfoText,
            description: l10n.alertInfoDesc,
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
                  child: Text(l10n.alertBtnAccept),
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
                  child: Text(l10n.alertBtnDecline),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // ── 6. Banner ─────────────────────────────────────────────────────
          _sectionHeader(l10n.alertSectionBanner),
          SAlert(title: l10n.alertWarningText, banner: true),
          const SizedBox(height: 8),
          const SAlert(
            title: 'Very long warning text warning text text text text text text text',
            banner: true,
            closable: true,
          ),
          const SizedBox(height: 8),
          SAlert(
            title: l10n.alertWarningText,
            banner: true,
          ),
          const SizedBox(height: 8),
          SAlert(type: SAlertType.error, title: l10n.alertErrorText, banner: true),
          const SizedBox(height: 24),

          // ── 7. Custom Icon ────────────────────────────────────────────────
          _sectionHeader(l10n.alertSectionCustomIcon),
          SAlert(
            icon: const Icon(Icons.sentiment_satisfied_alt, color: Colors.orange),
            title: l10n.alertSuccessTips,
            type: SAlertType.success,
          ),
          const SizedBox(height: 8),
          SAlert(
            icon: const Icon(Icons.sentiment_satisfied_alt, color: Colors.orange),
            title: l10n.alertSuccessTips,
            type: SAlertType.success,
            showIcon: true,
          ),
          const SizedBox(height: 8),
          SAlert(
            icon: const Icon(Icons.sentiment_satisfied_alt, color: Colors.orange),
            title: l10n.alertInfoNotes,
            showIcon: true,
          ),
          const SizedBox(height: 8),
          SAlert(
            icon: const Icon(Icons.sentiment_satisfied_alt, color: Colors.orange),
            title: l10n.alertWarning,
            type: SAlertType.warning,
            showIcon: true,
          ),
          const SizedBox(height: 8),
          SAlert(
            icon: const Icon(Icons.sentiment_satisfied_alt, color: Colors.orange),
            title: l10n.alertError,
            type: SAlertType.error,
            showIcon: true,
          ),
          const SizedBox(height: 8),
          SAlert(
            icon: const Icon(Icons.sentiment_satisfied_alt, color: Colors.orange),
            title: l10n.alertSuccessTips,
            description: l10n.alertDetailedSuccess,
            type: SAlertType.success,
            showIcon: true,
          ),
          const SizedBox(height: 24),

          // ── 8. Smooth Close ───────────────────────────────────────────────
          _sectionHeader(l10n.alertSectionSmoothClose),
          if (_smoothCloseVisible)
            SAlert(
              type: SAlertType.success,
              title: l10n.alertSuccessText,
              closable: true,
              onClose: () {},
              afterClose: () => setState(() => _smoothCloseVisible = false),
            ),
          if (!_smoothCloseVisible) ...[
            Text(l10n.alertClosedMsg),
          ],
          const SizedBox(height: 8),
          Row(
            children: [
              ElevatedButton(
                onPressed: () => setState(() => _smoothCloseVisible = true),
                child: Text(l10n.alertBtnReshow),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // ── 9. Open Customizability ───────────────────────────────────────
          _sectionHeader(l10n.alertSectionCustomizability),
          SAlert(
            type: SAlertType.error,
            title: l10n.alertCustomTitle,
            description: l10n.alertCustomDesc,
            showIcon: true,
            closable: true,
            backgroundColor: const Color(0xFFF5F0FF),
            borderColor: const Color(0xFF722ED1),
            borderWidth: 1.5,
            borderRadius: const BorderRadius.all(Radius.circular(2)),
            iconColor: const Color(0xFF722ED1),
            iconSize: 20,
            titleStyle: const TextStyle(
              color: Color(0xFF391085),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            descriptionStyle: const TextStyle(
              color: Color(0xFF722ED1),
              fontSize: 12,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            elevation: 4,
            shadowColor: const Color(0x40722ED1),
          ),
          const SizedBox(height: 8),
          SAlert(
            title: l10n.alertConstrainedTitle,
            description: l10n.alertConstrainedDesc,
            showIcon: true,
            constraints: const BoxConstraints(maxWidth: 400),
            action: TextButton(onPressed: () {}, child: Text(l10n.alertBtnLearnMore)),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

Widget _sectionHeader(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  );
}
