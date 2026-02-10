import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

/// Example: Custom app theming that completely overrides sDesign defaults
/// This demonstrates the production-ready way for consuming apps to use
/// their own theming with the sDesign package.

void
    main() {
  runApp(
      MyBrandedApp());
}

class MyBrandedApp
    extends StatelessWidget {
  @override
  Widget build(
      BuildContext
          context) {
    // Define your app's brand colors
    const myColors =
        MyCompanyColors();

    // Build a fully custom theme - this overrides ALL sDesign components
    final customTheme =
        STheme.buildCustomTheme(
      colors:
          myColors,
      baseTheme:
          ThemeData.light(), // or ThemeData.dark()
    );

    // Build dark theme variant (optional)
    final customDarkTheme =
        STheme.buildCustomTheme(
      colors:
          MyCompanyColorsDark(),
      baseTheme:
          ThemeData.dark(),
    );

    return MaterialApp(
      title:
          'My Branded App',
      theme:
          customTheme,
      darkTheme:
          customDarkTheme,
      themeMode:
          ThemeMode.system,
      home:
          HomePage(),
    );
  }
}

/// Your company's custom color scheme - Light Mode
class MyCompanyColors
    extends SColorsBase {
  const MyCompanyColors();

  // PRIMARY COLORS (your brand colors)
  @override
  Color get primary =>
      const Color(0xFF6366F1); // Indigo brand color

  @override
  Color get secondary =>
      const Color(0xFF8B5CF6); // Purple accent

  @override
  Color get primaryVariant =>
      const Color(0xFF4F46E5);

  @override
  Color get secondaryVariant =>
      const Color(0xFF7C3AED);

  // BACKGROUND COLORS
  @override
  Color get background =>
      const Color(0xFFF9FAFB);

  @override
  Color get surface =>
      const Color(0xFFFFFFFF);

  @override
  Color get cardBackground =>
      const Color(0xFFFFFFFF);

  // TEXT COLORS
  @override
  Color get textPrimary =>
      const Color(0xFF111827);

  @override
  Color get textSecondary =>
      const Color(0xFF6B7280);

  @override
  Color get textOnPrimary =>
      const Color(0xFFFFFFFF);

  @override
  Color get textOnSecondary =>
      const Color(0xFFFFFFFF);

  // STATUS COLORS
  @override
  Color get error =>
      const Color(0xFFEF4444);

  @override
  Color get success =>
      const Color(0xFF10B981);

  @override
  Color get warning =>
      const Color(0xFFF59E0B);

  @override
  Color get info =>
      const Color(0xFF3B82F6);

  // UI ELEMENT COLORS
  @override
  Color get divider =>
      const Color(0xFFE5E7EB);

  @override
  Color get disabled =>
      const Color(0xFF9CA3AF);

  @override
  Color get shadow =>
      const Color(0x1A000000);

  // BUTTON COLORS
  @override
  Color get buttonPrimary =>
      primary;

  @override
  Color get buttonSecondary =>
      secondary;

  @override
  Color get buttonDestructive =>
      error;

  // CHECKBOX COLORS
  @override
  Color get checkboxActive =>
      primary;

  @override
  Color get checkboxInactive =>
      const Color(0xFFD1D5DB);

  // DIALOG COLORS
  @override
  Color get dialogBackground =>
      surface;

  @override
  Color get dialogTitle =>
      textPrimary;

  @override
  Color get dialogContent =>
      textSecondary;

  // DROPDOWN COLORS
  @override
  Color get dropdownBackground =>
      surface;

  @override
  Color get dropdownItemSelected =>
      primary;

  @override
  Color get dropdownItemUnselected =>
      textPrimary;

  // INPUT COLORS
  @override
  Color get inputBackground =>
      surface;

  @override
  Color get inputBorder =>
      divider;

  @override
  Color get inputBorderFocused =>
      primary;

  @override
  Color get inputText =>
      textPrimary;

  // PROGRESS COLORS
  @override
  Color get progressBackground =>
      const Color(0xFFE5E7EB);

  @override
  Color get progressValue =>
      primary;

  // SWITCH COLORS
  @override
  Color get switchActive =>
      primary;

  @override
  Color get switchInactive =>
      const Color(0xFFD1D5DB);

  @override
  Color get switchDisabled =>
      disabled;

  // TABS COLORS
  @override
  Color get tabsIndicator =>
      primary;

  @override
  Color get tabsLabel =>
      primary;

  @override
  Color get tabsUnselectedLabel =>
      textSecondary;

  // TOASTER COLORS
  @override
  Color get toasterBackground =>
      const Color(0xFF1F2937);

  @override
  Color get toasterText =>
      const Color(0xFFFFFFFF);

  // CARD COLORS
  @override
  Color get cardShadow =>
      shadow;
}

/// Your company's custom color scheme - Dark Mode
class MyCompanyColorsDark
    extends SColorsBase {
  const MyCompanyColorsDark();

  // PRIMARY COLORS (keep brand colors consistent)
  @override
  Color get primary =>
      const Color(0xFF818CF8); // Lighter indigo for dark mode

  @override
  Color get secondary =>
      const Color(0xFFA78BFA); // Lighter purple

  @override
  Color get primaryVariant =>
      const Color(0xFF6366F1);

  @override
  Color get secondaryVariant =>
      const Color(0xFF8B5CF6);

  // BACKGROUND COLORS (dark backgrounds)
  @override
  Color get background =>
      const Color(0xFF111827);

  @override
  Color get surface =>
      const Color(0xFF1F2937);

  @override
  Color get cardBackground =>
      const Color(0xFF1F2937);

  // TEXT COLORS (light text on dark)
  @override
  Color get textPrimary =>
      const Color(0xFFF9FAFB);

  @override
  Color get textSecondary =>
      const Color(0xFF9CA3AF);

  @override
  Color get textOnPrimary =>
      const Color(0xFF111827);

  @override
  Color get textOnSecondary =>
      const Color(0xFF111827);

  // STATUS COLORS (slightly adjusted for dark mode)
  @override
  Color get error =>
      const Color(0xFFF87171);

  @override
  Color get success =>
      const Color(0xFF34D399);

  @override
  Color get warning =>
      const Color(0xFFFBBF24);

  @override
  Color get info =>
      const Color(0xFF60A5FA);

  // UI ELEMENT COLORS
  @override
  Color get divider =>
      const Color(0xFF374151);

  @override
  Color get disabled =>
      const Color(0xFF4B5563);

  @override
  Color get shadow =>
      const Color(0x33000000);

  // BUTTON COLORS
  @override
  Color get buttonPrimary =>
      primary;

  @override
  Color get buttonSecondary =>
      secondary;

  @override
  Color get buttonDestructive =>
      error;

  // CHECKBOX COLORS
  @override
  Color get checkboxActive =>
      primary;

  @override
  Color get checkboxInactive =>
      const Color(0xFF4B5563);

  // DIALOG COLORS
  @override
  Color get dialogBackground =>
      surface;

  @override
  Color get dialogTitle =>
      textPrimary;

  @override
  Color get dialogContent =>
      textSecondary;

  // DROPDOWN COLORS
  @override
  Color get dropdownBackground =>
      surface;

  @override
  Color get dropdownItemSelected =>
      primary;

  @override
  Color get dropdownItemUnselected =>
      textPrimary;

  // INPUT COLORS
  @override
  Color get inputBackground =>
      surface;

  @override
  Color get inputBorder =>
      divider;

  @override
  Color get inputBorderFocused =>
      primary;

  @override
  Color get inputText =>
      textPrimary;

  // PROGRESS COLORS
  @override
  Color get progressBackground =>
      const Color(0xFF374151);

  @override
  Color get progressValue =>
      primary;

  // SWITCH COLORS
  @override
  Color get switchActive =>
      primary;

  @override
  Color get switchInactive =>
      const Color(0xFF4B5563);

  @override
  Color get switchDisabled =>
      disabled;

  // TABS COLORS
  @override
  Color get tabsIndicator =>
      primary;

  @override
  Color get tabsLabel =>
      primary;

  @override
  Color get tabsUnselectedLabel =>
      textSecondary;

  // TOASTER COLORS
  @override
  Color get toasterBackground =>
      const Color(0xFF374151);

  @override
  Color get toasterText =>
      textPrimary;

  // CARD COLORS
  @override
  Color get cardShadow =>
      shadow;
}

/// Example home page using sDesign components with custom theming
class HomePage
    extends StatelessWidget {
  @override
  Widget build(
      BuildContext
          context) {
    return SScaffold(
      appBar:
          AppBar(
        title: Text('My Branded App'),
        // AppBar automatically uses your custom primary color
      ),
      renderBody: (context) =>
          Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Custom Theme Demo',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 16),

            // All sDesign components use your custom colors!
            SButton(
              onPressed: () {},
              child: Text('Custom Themed Button'),
              // Uses your brand primary color automatically
            ),
            SizedBox(height: 16),

            SCheckbox(
              value: SCheckboxState.checked,
              onChanged: (_) {},
              // Uses your brand primary color for active state
            ),
            SizedBox(height: 16),

            SCard(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text('Card with custom theming'),
              ),
              // Uses your custom card colors
            ),
          ],
        ),
      ),
    );
  }
}
