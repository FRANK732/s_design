import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

void
    main() {
  runApp(
      const ModernSDesignExample());
}

class ModernSDesignExample
    extends StatelessWidget {
  const ModernSDesignExample(
      {super.key});

  @override
  Widget build(
      BuildContext
          context) {
    // Define ColorSchemes
    final ColorScheme
        lightColorScheme =
        ColorScheme.fromSeed(
      seedColor:
          const Color(0xFF6366F1), // Indigo brand color
    );

    final ColorScheme
        darkColorScheme =
        ColorScheme.fromSeed(
      seedColor:
          const Color(0xFF6366F1),
      brightness:
          Brightness.dark,
    );

    return MaterialApp(
      title:
          'sDesign Modern Example',
      debugShowCheckedModeBanner:
          false,

      // Light theme with ColorScheme
      theme:
          ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        extensions: <ThemeExtension<dynamic>>[
          SButtonThemeData.fromColorScheme(lightColorScheme),
          SInputFieldThemeData.fromColorScheme(lightColorScheme),
          SCheckboxThemeData.fromColorScheme(lightColorScheme),
          SCardThemeData.fromColorScheme(lightColorScheme),
          SListTileThemeData.fromColorScheme(lightColorScheme),
          SDialogThemeData.fromColorScheme(lightColorScheme),
          SProgressBarThemeData.fromColorScheme(lightColorScheme),
          SSwitchThemeData.fromColorScheme(lightColorScheme),
        ],
      ),

      // Dark theme with ColorScheme
      darkTheme:
          ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        extensions: <ThemeExtension<dynamic>>[
          SButtonThemeData.fromColorScheme(darkColorScheme),
          SInputFieldThemeData.fromColorScheme(darkColorScheme),
          SCheckboxThemeData.fromColorScheme(darkColorScheme),
          SCardThemeData.fromColorScheme(darkColorScheme),
          SListTileThemeData.fromColorScheme(darkColorScheme),
          SDialogThemeData.fromColorScheme(darkColorScheme),
          SProgressBarThemeData.fromColorScheme(darkColorScheme),
          SSwitchThemeData.fromColorScheme(darkColorScheme),
        ],
      ),
      home:
          const ComponentShowcase(),
    );
  }
}

class ComponentShowcase
    extends StatefulWidget {
  const ComponentShowcase(
      {super.key});

  @override
  State<ComponentShowcase>
      createState() =>
          _ComponentShowcaseState();
}

class _ComponentShowcaseState
    extends State<
        ComponentShowcase> {
  bool
      _checkboxValue =
      false;
  bool
      _switchValue =
      false;
  final TextEditingController
      _inputController =
      TextEditingController();

  @override
  void
      dispose() {
    _inputController
        .dispose();
    super
        .dispose();
  }

  @override
  Widget build(
      BuildContext
          context) {
    final ColorScheme
        colorScheme =
        Theme.of(context).colorScheme;

    return SScaffold(
      appBar:
          AppBar(
        title: const Text('sDesign - Clean Architecture'),
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
      ),
      renderBody: (BuildContext context) =>
          SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Header
            Text(
              'Modern Component Library',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Clean Architecture with ColorScheme Theming',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 24),

            // Input Components Section
            _buildSectionHeader('Input Components', colorScheme),
            const SizedBox(height: 16),

            SCard(
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: <Widget>[
                        SButton(
                          onPressed: () => _showSnackBar(context, 'Primary button pressed!'),
                          child: const Text('Primary Button'),
                        ),
                        SButton(
                          onPressed: () => _showSnackBar(context, 'Secondary button pressed!'),
                          variant: ButtonVariant.secondary,
                          child: const Text('Secondary Button'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SInputField(
                      controller: _inputController,
                      hintText: 'Enter text here...',
                      labelText: 'Input Field',
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: <Widget>[
                        SCheckbox(
                          value: _checkboxValue ? SCheckboxState.checked : SCheckboxState.unchecked,
                          onChanged: (SCheckboxState? value) {
                            setState(() => _checkboxValue = value == SCheckboxState.checked);
                          },
                        ),
                        const SizedBox(width: 8),
                        const Text('Checkbox with ColorScheme theming'),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: <Widget>[
                        SSwitch(
                          value: _switchValue,
                          onChanged: (bool value) {
                            setState(() => _switchValue = value);
                          },
                        ),
                        const SizedBox(width: 8),
                        const Text('Switch Component'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Layout Components Section
            _buildSectionHeader('Layout Components', colorScheme),
            const SizedBox(height: 16),

            SCard(
              color: colorScheme.surfaceContainerHighest,
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'This is an SCard with custom styling',
                  style: TextStyle(color: colorScheme.onSurface),
                ),
              ),
            ),
            const SizedBox(height: 12),

            SListTile(
              title: const Text('List Tile Example'),
              subtitle: const Text('With ColorScheme integration'),
              leading: Icon(Icons.star, color: colorScheme.primary),
              trailing: Icon(Icons.chevron_right, color: colorScheme.onSurfaceVariant),
              onTap: () => _showSnackBar(context, 'List tile tapped!'),
            ),
            const SizedBox(height: 24),

            // Feedback Components Section
            _buildSectionHeader('Feedback Components', colorScheme),
            const SizedBox(height: 16),

            SCard(
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SButton(
                      onPressed: () => _showExampleDialog(context),
                      variant: ButtonVariant.secondary,
                      child: const Text('Show Dialog'),
                    ),
                    const SizedBox(height: 12),
                    const Text('Progress Bar:'),
                    const SizedBox(height: 8),
                    const SProgressBar(value: 0.65),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Theme Information
            _buildSectionHeader('Theme Information', colorScheme),
            const SizedBox(height: 16),

            SCard(
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildThemeInfo('Primary', colorScheme.primary),
                    _buildThemeInfo('Secondary', colorScheme.secondary),
                    _buildThemeInfo('Surface', colorScheme.surface),
                    _buildThemeInfo('Error', colorScheme.error),
                    const SizedBox(height: 12),
                    Text(
                      '✨ All components automatically adapt to your ColorScheme!',
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
      String
          title,
      ColorScheme
          colorScheme) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration:
          BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child:
          Text(
        title,
        style: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildThemeInfo(
      String
          name,
      Color
          color) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 8),
      child:
          Row(
        children: <Widget>[
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey.shade300),
            ),
          ),
          const SizedBox(width: 12),
          Text('$name: ${_colorToHex(color)}'),
        ],
      ),
    );
  }

  String _colorToHex(
      Color
          color) {
    return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
  }

  void _showSnackBar(
      BuildContext
          context,
      String
          message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _showExampleDialog(
      BuildContext
          context) {
    SDialog.show<
        void>(
      context:
          context,
      title:
          'Example Dialog',
      content:
          const Text('This dialog uses ColorScheme theming automatically!'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
