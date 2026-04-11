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
    await SFloatingPanel
        .show(
      context:
          context,
      config:
          SFloatingPanelConfig(
        content: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle, size: 64, color: Colors.green),
                const SizedBox(height: 16),
                const Text(
                  'Action Completed!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => SFloatingPanel.close(context),
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void>
      _showAdvancedPanel(BuildContext context) async {
    await SFloatingPanel
        .show(
      context:
          context,
      config:
          SFloatingPanelConfig(
        content: Container(
          constraints: const BoxConstraints(maxWidth: 450),
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Advanced Settings',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => SFloatingPanel.close(context),
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Perform some action
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Settings saved!')),
                          );
                        },
                        child: const Text('Save'),
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
    await SFloatingPanel
        .show(
      context:
          context,
      config:
          SFloatingPanelConfig(
        contentConfig: const SFloatingContentConfig(
          icon: Icon(Icons.local_offer, size: 48, color: Colors.orange),
          title: 'Special Offer!',
          description: 'Get 50% off your next purchase. Limited time only!',
        ),
        bottomConfig: SFloatingBottomConfig(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          // backgroundColor: theme.colorScheme.transparent,
          actions: [
            SButton(
              variant: SButtonVariant.outline,
              onPressed: () => SFloatingPanel.close(context),
              child: const Text('Maybe Later'),
            ),
            SButton(
              onPressed: () {
                SFloatingPanel.close(context);
                SSonner.show(
                  message: 'Offer claimed!',
                );
              },
              child: const Text('Claim Offer'),
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
    return SScaffold(
      centerBody:
          true,
      appBar:
          AppBar(
        title: const Text('Floating Panel Demo'),
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
              child: const Text('Show Simple Panel'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _showAdvancedPanel(context),
              child: const Text('Show Advanced Panel'),
            ),
            ElevatedButton(
              onPressed: () => _showCustomBottomPanel(context),
              child: const Text('Show Custom Bottom Panel'),
            ),
          ],
        ),
      ),
    );
  }
}
