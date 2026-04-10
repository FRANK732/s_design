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
                  onPressed: () => SFloatingPanel.close(),
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
                        onPressed: () => SFloatingPanel.close(),
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

  Future<void> _showCustomBottomPanel(BuildContext context) async {
    final theme = Theme.of(context);

    await SFloatingPanel.show(
      context: context,
      config: SFloatingPanelConfig(
        content: Container(
          width: 450,
          padding: const EdgeInsets.all(24),
          child: const SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Special Offer!',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text('Get 50% off your next purchase. Limited time only!'),
              ],
            ),
          ),
        ),
        customBottomWidget: Container(
          width: 450,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer.withAlpha(150),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: theme.colorScheme.primary.withAlpha(50),
            ),
          ),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            runSpacing: 8,
            children: [
              const TextButton(
                onPressed: null,
                child: Text('Maybe Later'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  elevation: 0,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Offer claimed!')),
                  );
                },
                child: const Text('Claim Offer'),
              ),
            ],
          ),
        ),
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
