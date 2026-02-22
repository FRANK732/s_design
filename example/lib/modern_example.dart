import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

import 'pages/bottom_navigation.dart';
import 'pages/card.dart';
import 'pages/card_demo.dart';
import 'pages/check_box.dart';
import 'pages/date_picker_page.dart';
import 'pages/dropdown_menu.dart';
import 'pages/home_overview.dart';
import 'pages/input_demo_page.dart';
import 'pages/list_tile_page.dart';
import 'pages/progress_demo.dart';
import 'pages/s_pagination_page.dart';
import 'pages/progress_indicator_page.dart';
import 'pages/s_alert_page.dart';
import 'pages/s_avatar_page.dart';
import 'pages/s_floating_panel_page.dart';
import 'pages/s_modal_page.dart';
import 'pages/s_time_picker_page.dart';
import 'pages/qrcode_demo_page.dart';
import 'pages/rate_demo_page.dart';
import 'pages/sbutton.dart';
import 'pages/scaffold_page.dart';
import 'pages/select_page.dart';
import 'pages/slider_demo.dart';
import 'pages/sonner_page.dart';
import 'pages/sscaffold/base_scaffold.dart';
import 'pages/steps_page.dart';
import 'pages/switch_demo.dart';
import 'pages/tabs_demo_v3.dart';
import 'pages/toast_page.dart';
import 'widgets/nav_sidebar.dart';

void
    main() {
  runApp(
      const ModernSDesignExample());
}

class ModernSDesignExample
    extends StatefulWidget {
  const ModernSDesignExample(
      {super.key});

  @override
  State<ModernSDesignExample>
      createState() =>
          _ModernSDesignExampleState();
}

class _ModernSDesignExampleState
    extends State<
        ModernSDesignExample> {
  ThemeMode
      _themeMode =
      ThemeMode.system;

  @override
  Widget build(
      BuildContext
          context) {
    return SApp(
      title:
          'SDesign Gallery',
      debugShowCheckedModeBanner:
          false,
      themeMode:
          _themeMode,
      theme:
          SThemeData.light(),
      darkTheme:
          SThemeData.dark(),
      home:
          GalleryShell(
        themeMode: _themeMode,
        onThemeChanged: (mode) => setState(() => _themeMode = mode),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Gallery Shell
// ─────────────────────────────────────────────────────────────────────────────

class GalleryShell
    extends StatefulWidget {
  const GalleryShell({
    super.key,
    required this.themeMode,
    required this.onThemeChanged,
  });

  final ThemeMode
      themeMode;
  final ValueChanged<ThemeMode>
      onThemeChanged;

  @override
  State<GalleryShell>
      createState() =>
          _GalleryShellState();
}

class _GalleryShellState
    extends State<
        GalleryShell> {
  late NavItem
      _selected;
  String
      _searchQuery =
      '';

  late final NavItem
      _homeItem;
  late final List<NavGroup>
      _groups;

  @override
  void
      initState() {
    super
        .initState();

    _homeItem = NavItem(
        label: 'Home',
        icon: Icons.home_outlined,
        page: const HomeOverviewPage());

    _groups =
        [
      NavGroup(title: 'Inputs', items: [
        NavItem(label: 'SButton', icon: Icons.smart_button_outlined, page: const SButtonPage()),
        NavItem(label: 'SCheckbox', icon: Icons.check_box_outlined, page: const CheckboxPage()),
        NavItem(label: 'SSwitch', icon: Icons.toggle_on_outlined, page: const SwitchDemoPage()),
        NavItem(label: 'SInput', icon: Icons.text_fields_outlined, page: const InputDemoPage()),
        NavItem(label: 'SDropdown', icon: Icons.arrow_drop_down_circle_outlined, page: const DropdownMenuPage()),
        NavItem(label: 'SSelect', icon: Icons.list_alt_outlined, page: const SelectPage()),
        NavItem(label: 'SRate', icon: Icons.star_outline, page: const RateDemoPage()),
        NavItem(label: 'SDatePicker', icon: Icons.calendar_today_outlined, page: const DatePickerPage()),
        NavItem(label: 'STimePicker', icon: Icons.access_time_outlined, page: const STimePickerPage()),
      ]),
      NavGroup(title: 'Display', items: [
        NavItem(label: 'SAvatar', icon: Icons.account_circle_outlined, page: const SAvatarPage()),
        NavItem(label: 'SSlider', icon: Icons.tune_outlined, page: const SSliderDemoPage()),
        NavItem(label: 'SSteps', icon: Icons.format_list_numbered_outlined, page: const StepsPage()),
        NavItem(label: 'SQRCode', icon: Icons.qr_code_outlined, page: const QRCodeDemoPage()),
      ]),
      NavGroup(title: 'Feedback', items: [
        NavItem(label: 'SAlert', icon: Icons.warning_amber_rounded, page: const SAlertPage()),
        NavItem(label: 'SDialog', icon: Icons.chat_bubble_outline, page: const SModalPage()),
        NavItem(label: 'SToast', icon: Icons.announcement_outlined, page: const ToastPage()),
        NavItem(label: 'SSonner', icon: Icons.notifications_active_outlined, page: const SonnerPage()),
        NavItem(label: 'SProgress', icon: Icons.pie_chart_outline, page: const SProgressDemoPage()),
        NavItem(label: 'SProgressBar', icon: Icons.linear_scale_outlined, page: const ProgressIndicatorPage()),
      ]),
      NavGroup(title: 'Layout', items: [
        NavItem(label: 'SCard', icon: Icons.chrome_reader_mode_outlined, page: const SCardDemoPage()),
        NavItem(label: 'SListTile', icon: Icons.list_outlined, page: const ListTilePage()),
        NavItem(label: 'STabs', icon: Icons.tab_outlined, page: const TabsDemoV3Page()),
        NavItem(label: 'SPagination', icon: Icons.first_page_outlined, page: const SPaginationPage()),
        NavItem(label: 'SScaffold', icon: Icons.web_asset_outlined, page: const BaseScaffoldPage()),
        NavItem(label: 'SScaffold Slivers', icon: Icons.view_quilt_outlined, page: const ScaffoldPage()),
        NavItem(label: 'SBottom Navigation', icon: Icons.call_to_action_outlined, page: const BottomNavigationPage()),
        NavItem(label: 'SCard (Basic)', icon: Icons.dashboard_outlined, page: const CardPage()),
      ]),
      NavGroup(title: 'Overlays', items: [
        NavItem(label: 'SFloatingPanel', icon: Icons.layers_outlined, page: const SFloatingPanelPage()),
      ]),
    ];

    _selected =
        _homeItem;
  }

  @override
  Widget build(
      BuildContext
          context) {
    // Initialize overlays once
    final overlayState =
        Overlay.of(context);
    SFloatingPanel.initialize(
        overlayState);
    SSonner
        .instance
        .initialize(overlayState);
    SToast.initialize(
        overlayState);

    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar:
          AppBar(
        elevation: 0,
        scrolledUnderElevation: 1,
        title: const Text(
          'SDesign Gallery',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        actions: [
          // Theme toggle
          Tooltip(
            message: isDark ? 'Switch to light mode' : 'Switch to dark mode',
            child: IconButton(
              icon: Icon(isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
              onPressed: () {
                widget.onThemeChanged(
                  isDark ? ThemeMode.light : ThemeMode.dark,
                );
              },
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      // Responsive: drawer on mobile, sidebar on desktop
      drawer: MediaQuery.of(context).size.width < 700
          ? Drawer(
              child: NavSidebar(
                groups: _groups,
                homeItem: _homeItem,
                selected: _selected,
                searchQuery: _searchQuery,
                onSearchChanged: (q) => setState(() => _searchQuery = q),
                onSelected: (item) {
                  setState(() => _selected = item);
                  Navigator.of(context).pop();
                },
              ),
            )
          : null,
      body:
          LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 700;
          if (isWide) {
            return Row(
              children: [
                NavSidebar(
                  groups: _groups,
                  homeItem: _homeItem,
                  selected: _selected,
                  searchQuery: _searchQuery,
                  onSearchChanged: (q) => setState(() => _searchQuery = q),
                  onSelected: (item) => setState(() => _selected = item),
                ),
                // Vertical divider
                VerticalDivider(
                  width: 1,
                  color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.4),
                ),
                // Content pane
                Expanded(key: ValueKey(_selected.label), child: _selected.page),
              ],
            );
          } else {
            // Mobile: full-width content with drawer
            return _selected.page;
          }
        },
      ),
    );
  }
}
