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
import 'pages/progress_indicator_page.dart';
import 'pages/qrcode_demo_page.dart';
import 'pages/rate_demo_page.dart';
import 'pages/s_alert_page.dart';
import 'pages/s_avatar_page.dart';
import 'pages/s_floating_panel_page.dart';
import 'pages/s_modal_page.dart';
import 'pages/s_pagination_page.dart';
import 'pages/s_time_picker_page.dart';
import 'pages/s_tooltip_page.dart';
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
import 'widgets/s_design_logo.dart';

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
  Locale _currentLocale = const Locale(
      'en',
      'US');

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
      locale:
          _currentLocale,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('fr', 'FR'),
        Locale('ar', 'AE'),
        Locale('zh', 'CN'),
      ],
      localeResolutionCallback:
          (locale, supportedLocales) {
        for (final supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      theme:
          SThemeData.light(),
      darkTheme:
          SThemeData.dark(),
      home:
          GalleryShell(
        currentLocale: _currentLocale,
        onThemeChanged: (mode) => setState(() => _themeMode = mode),
        onLocaleChanged: (locale) => setState(() => _currentLocale = locale),
      ),
    );
  }
}

class GalleryShell
    extends StatefulWidget {
  const GalleryShell({
    super.key,
    required this.currentLocale,
    required this.onThemeChanged,
    required this.onLocaleChanged,
  });

  final Locale
      currentLocale;
  final ValueChanged<ThemeMode>
      onThemeChanged;
  final ValueChanged<Locale>
      onLocaleChanged;

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

  @override
  void
      initState() {
    super
        .initState();
    _selected =
        _getHomeItem(null);
  }

  NavItem _getHomeItem(
      BuildContext?
          context) {
    final l10n = context != null
        ? SLocalizations.ofContext(context)
        : null;
    return NavItem(
      id: 'home',
      label:
          l10n?.home ?? 'Home',
      icon:
          Icons.home_outlined,
      page:
          const HomeOverviewPage(),
    );
  }

  List<NavGroup>
      _getGroups(BuildContext context) {
    final l10n =
        SLocalizations.ofContext(context);
    return [
      NavGroup(title: l10n.inputs, items: [
        NavItem(id: 'button', label: l10n.compButton, icon: Icons.smart_button_outlined, page: const SButtonPage()),
        NavItem(id: 'checkbox', label: l10n.compCheckbox, icon: Icons.check_box_outlined, page: const CheckboxPage()),
        NavItem(id: 'switch', label: l10n.compSwitch, icon: Icons.toggle_on_outlined, page: const SwitchDemoPage()),
        NavItem(id: 'input', label: l10n.compInput, icon: Icons.text_fields_outlined, page: const InputDemoPage()),
        NavItem(id: 'dropdown', label: l10n.compDropdown, icon: Icons.arrow_drop_down_circle_outlined, page: const DropdownMenuPage()),
        NavItem(id: 'select', label: l10n.compSelect, icon: Icons.list_alt_outlined, page: const SelectPage()),
        NavItem(id: 'rate', label: l10n.compRate, icon: Icons.star_outline, page: const RateDemoPage()),
        NavItem(id: 'datepicker', label: l10n.compDatePicker, icon: Icons.calendar_today_outlined, page: const DatePickerPage()),
        NavItem(id: 'timepicker', label: l10n.compTimePicker, icon: Icons.access_time_outlined, page: const STimePickerPage()),
      ]),
      NavGroup(title: l10n.display, items: [
        NavItem(id: 'avatar', label: l10n.compAvatar, icon: Icons.account_circle_outlined, page: const SAvatarPage()),
        NavItem(id: 'slider', label: l10n.compSlider, icon: Icons.tune_outlined, page: const SSliderDemoPage()),
        NavItem(id: 'steps', label: l10n.compSteps, icon: Icons.format_list_numbered_outlined, page: const StepsPage()),
        NavItem(id: 'qrcode', label: l10n.compQRCode, icon: Icons.qr_code_outlined, page: const QRCodeDemoPage()),
        NavItem(id: 'tooltip', label: l10n.compTooltip, icon: Icons.info_outline, page: const STooltipPage()),
      ]),
      NavGroup(title: l10n.feedback, items: [
        NavItem(id: 'alert', label: l10n.compAlert, icon: Icons.warning_amber_rounded, page: const SAlertPage()),
        NavItem(id: 'dialog', label: l10n.compDialog, icon: Icons.chat_bubble_outline, page: const SModalPage()),
        NavItem(id: 'toast', label: l10n.compToast, icon: Icons.announcement_outlined, page: const ToastPage()),
        NavItem(id: 'sonner', label: l10n.compSonner, icon: Icons.notifications_active_outlined, page: const SonnerPage()),
        NavItem(id: 'floatingpanel', label: l10n.compFloatingPanel, icon: Icons.picture_in_picture_alt_outlined, page: const SFloatingPanelPage()),
        NavItem(id: 'progress', label: l10n.compProgress, icon: Icons.pie_chart_outline, page: const SProgressDemoPage()),
        NavItem(id: 'progressline', label: l10n.compProgressLine, icon: Icons.linear_scale_outlined, page: const ProgressIndicatorPage()),
      ]),
      NavGroup(title: l10n.layout, items: [
        NavItem(id: 'card', label: l10n.compCard, icon: Icons.chrome_reader_mode_outlined, page: const SCardDemoPage()),
        NavItem(id: 'listtile', label: l10n.compListTile, icon: Icons.list_outlined, page: const ListTilePage()),
        NavItem(id: 'tabs', label: l10n.compTabs, icon: Icons.tab_outlined, page: const TabsDemoV3Page()),
        NavItem(id: 'pagination', label: l10n.compPagination, icon: Icons.first_page_outlined, page: const SPaginationPage()),
        NavItem(id: 'scaffold', label: l10n.compScaffold, icon: Icons.web_asset_outlined, page: const BaseScaffoldPage()),
        NavItem(id: 'scaffoldslivers', label: l10n.compScaffoldSlivers, icon: Icons.view_quilt_outlined, page: const ScaffoldPage()),
        NavItem(id: 'bottomnav', label: l10n.compBottomNav, icon: Icons.call_to_action_outlined, page: const BottomNavigationPage()),
        NavItem(id: 'cardbasic', label: l10n.compCardBasic, icon: Icons.dashboard_outlined, page: const CardPage()),
      ]),
    ];
  }

  @override
  Widget build(
      BuildContext
          context) {
    final homeItem =
        _getHomeItem(context);
    final groups =
        _getGroups(context);

    final allItems =
        [
      homeItem,
      ...groups.expand((g) =>
          g.items)
    ];
    _selected =
        allItems.firstWhere(
      (it) =>
          it.id ==
          _selected.id,
      orElse: () =>
          homeItem,
    );

    final l10n =
        SLocalizations.ofContext(context);

    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return SScaffold(
      appBar:
          AppBar(
        elevation: 0,
        scrolledUnderElevation: 1,
        title: const SDesignLogo(
          size: 24,
          withText: true,
        ),
        actions: [
          Tooltip(
            message: isDark ? l10n.themeSwitchLight : l10n.themeSwitchDark,
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
          PopupMenuButton<Locale>(
            tooltip: l10n.languageSwitch,
            initialValue: widget.currentLocale,
            onSelected: widget.onLocaleChanged,
            icon: const Icon(Icons.language_outlined),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: const Locale('en', 'US'),
                child: Text(l10n.langEn),
              ),
              PopupMenuItem(
                value: const Locale('fr', 'FR'),
                child: Text(l10n.langFr),
              ),
              PopupMenuItem(
                value: const Locale('ar', 'AE'),
                child: Text(l10n.langAr),
              ),
              PopupMenuItem(
                value: const Locale('zh', 'CN'),
                child: Text(l10n.langZh),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      drawer: MediaQuery.of(context).size.width < 700
          ? Drawer(
              child: NavSidebar(
                groups: groups,
                homeItem: homeItem,
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
      renderBody: (context) =>
          LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 700;
          if (isWide) {
            return Row(
              children: [
                NavSidebar(
                  groups: groups,
                  homeItem: homeItem,
                  selected: _selected,
                  searchQuery: _searchQuery,
                  onSearchChanged: (q) => setState(() => _searchQuery = q),
                  onSelected: (item) => setState(() => _selected = item),
                ),
                VerticalDivider(
                  width: 1,
                  color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.4),
                ),
                Expanded(key: ValueKey(_selected.label), child: _selected.page),
              ],
            );
          } else {
            return _selected.page;
          }
        },
      ),
    );
  }
}
