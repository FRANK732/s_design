import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

import 'pages/bottom_navigation.dart';
import 'pages/card.dart';
import 'pages/check_box.dart';
import 'pages/dropdown_menu.dart';
import 'pages/inputs_page.dart';
import 'pages/list_tile_page.dart';
import 'pages/progress_indicator_page.dart';
import 'pages/s_floating_panel_page.dart';
import 'pages/s_modal_page.dart';
import 'pages/sbutton.dart';
import 'pages/slider_page.dart';
import 'pages/sonner_page.dart';
import 'pages/sscaffold/base_scaffold.dart';
import 'pages/switch_page.dart';
import 'pages/tab_page.dart';
import 'pages/toast_page.dart';

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
          STabsThemeData.fromColorScheme(lightColorScheme),
          SDropdownMenuThemeData.fromColorScheme(lightColorScheme),
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
          STabsThemeData.fromColorScheme(darkColorScheme),
          SDropdownMenuThemeData.fromColorScheme(darkColorScheme),
        ],
      ),
      home:
          const HomePage(),
    );
  }
}

class HomePage
    extends StatelessWidget {
  const HomePage(
      {super.key});

  @override
  Widget build(
      BuildContext
          context) {
    // Initialize overlays
    final OverlayState
        overlayState =
        Overlay.of(context);
    SFloatingPanel.initialize(
        overlayState);
    SSonner
        .instance
        .initialize(overlayState);
    SToast.initialize(
        overlayState);

    final ColorScheme
        colorScheme =
        Theme.of(context).colorScheme;

    return Scaffold(
      appBar:
          AppBar(
        title: const Text('sDesign Component Gallery'),
        backgroundColor: colorScheme.surface,
        scrolledUnderElevation: 2.0,
      ),
      body:
          ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: <Widget>[
          _buildSectionHeader('Inputs', colorScheme),
          _buildListTile(context, 'Buttons', const ButtonPage(), Icons.touch_app),
          _buildListTile(context, 'Input Fields', const InputFieldPage(), Icons.text_fields),
          _buildListTile(context, 'Checkbox', const CheckboxPage(), Icons.check_box),
          _buildListTile(context, 'Switch', const SwitchPage(), Icons.toggle_on),
          _buildListTile(context, 'Dropdown Menu', const DropdownMenuPage(), Icons.arrow_drop_down_circle),
          _buildListTile(context, 'Slider', const SliderPage(), Icons.linear_scale),
          _buildSectionHeader('Layout & Surfaces', colorScheme),
          _buildListTile(context, 'Card', const CardPage(), Icons.dashboard),
          _buildListTile(context, 'List Tile', const ListTilePage(), Icons.list),
          _buildListTile(context, 'SScaffold', const BaseScaffoldPage(), Icons.web_asset),
          _buildSectionHeader('Navigation', colorScheme),
          _buildListTile(context, 'Tabs', const TabsPage(), Icons.tab),
          _buildListTile(context, 'Bottom Navigation', const BottomNavigationPage(), Icons.call_to_action),
          _buildSectionHeader('Feedback & Overlays', colorScheme),
          _buildListTile(context, 'Dialog / Modal', const DialogPage(), Icons.chat_bubble_outline),
          _buildListTile(context, 'Floating Panel', const SFloatingPanelPage(), Icons.layers),
          _buildListTile(context, 'Toast', const ToastPage(), Icons.announcement),
          _buildListTile(context, 'Sonner', const SonnerPage(), Icons.notifications_active),
          _buildListTile(context, 'Progress Indicator', const ProgressIndicatorPage(), Icons.refresh),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
      String
          title,
      ColorScheme
          colorScheme) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          16,
          24,
          16,
          8),
      child:
          Text(
        title,
        style: TextStyle(
          color: colorScheme.primary,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
        ),
      ),
    );
  }

  Widget _buildListTile(
      BuildContext
          context,
      String
          title,
      Widget
          page,
      IconData
          icon) {
    return ListTile(
      leading:
          Icon(icon),
      title:
          Text(title),
      trailing:
          const Icon(Icons.chevron_right, size: 20),
      onTap:
          () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (context) => page),
        );
      },
    );
  }
}
