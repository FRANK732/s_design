import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class SFloatingPanelPage
    extends StatefulWidget {
  const SFloatingPanelPage(
      {super.key});

  @override
  State<SFloatingPanelPage>
      createState() =>
          _SFloatingPanelPageState();
}

class _SFloatingPanelPageState
    extends State<
        SFloatingPanelPage> {
  Future<void>
      _showSimplePanel(BuildContext context) async {
    final l10n =
        SLocalizations.ofContext(context);
    await SFloatingPanel.show(
        context: context,
        config: SFloatingPanelConfig(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check_circle, size: 64, color: Colors.green),
                  const SizedBox(height: 16),
                  Text(
                    l10n.floatingLabelActionCompleted,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => SFloatingPanel.close(context),
                    child: Text(l10n.floatingBtnOk),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future<void>
      _showAdvancedPanel(BuildContext context) async {
    final l10n =
        SLocalizations.ofContext(context);
    await SFloatingPanel
        .show(
      context:
          context,
      config:
          SFloatingPanelConfig(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 450),
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.floatingTitleAdvanced,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: l10n.floatingLabelUsername,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: l10n.floatingLabelPassword,
                    border: const OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => SFloatingPanel.close(context),
                        child: Text(l10n.floatingBtnCancel),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Perform some action
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(l10n.floatingMsgSettingsSaved)),
                          );
                        },
                        child: Text(l10n.floatingBtnSave),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        barrierColor: Colors.black.withOpacity(0.7),
        showCloseButton: true,
      ),
    );
  }

  Future<void>
      _showCustomBottomPanel(BuildContext context) async {
    final l10n =
        SLocalizations.ofContext(context);
    await SFloatingPanel
        .show(
      context:
          context,
      config:
          SFloatingPanelConfig(
        icon: const Icon(Icons.local_offer, size: 48, color: Colors.orange),
        title: l10n.floatingTitleSpecialOffer,
        description: l10n.floatingDescSpecialOffer,
        actionsWidget: Row(
          children: [
            SButton(
              variant: SButtonVariant.outline,
              onPressed: () => SFloatingPanel.close(context),
              child: Text(l10n.floatingBtnMaybeLater),
            ),
            SButton(
              onPressed: () {
                SFloatingPanel.close(context);
                SSonner.show(
                  message: l10n.floatingMsgOfferClaimed,
                );
              },
              child: Text(l10n.floatingBtnClaimOffer),
            ),
          ],
        ),
        elevation: 0,
      ),
    );
  }

  @override
  Widget build(
      BuildContext
          context) {
    final l10n =
        SLocalizations.ofContext(context);
    return SScaffold(
      centerBody:
          true,
      appBar:
          AppBar(
        title: Text(l10n.floatingTitle),
      ),
      renderBody: (BuildContext context) =>
          SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 16,
          runSpacing: 16,
          children: [
            ElevatedButton(
              onPressed: () => _showSimplePanel(context),
              child: Text(l10n.floatingBtnShowSimple),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _showAdvancedPanel(context),
              child: Text(l10n.floatingBtnShowAdvanced),
            ),
            ElevatedButton(
              onPressed: () => _showCustomBottomPanel(context),
              child: Text(l10n.floatingBtnShowCustom),
            ),
          ],
        ),
      ),
    );
  }
}
