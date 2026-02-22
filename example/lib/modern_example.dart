import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

import 'pages/bottom_navigation.dart';
import 'pages/card.dart';
import 'pages/card_demo.dart';
import 'pages/check_box.dart';
import 'pages/date_picker_page.dart';
import 'pages/dropdown_menu.dart';
import 'pages/input_demo_page.dart';
import 'pages/inputs_page.dart';
import 'pages/list_tile_page.dart';
import 'pages/progress_demo.dart';
import 'pages/progress_indicator_page.dart';
import 'pages/s_floating_panel_page.dart';
import 'pages/s_modal_page.dart';
import 'pages/sbutton.dart';
import 'pages/scaffold_page.dart';
import 'pages/select_page.dart';
import 'pages/slider_demo.dart';
import 'pages/slider_page.dart';
import 'pages/sonner_page.dart';
import 'pages/sscaffold/base_scaffold.dart';
import 'pages/steps_page.dart';
import 'pages/switch_demo.dart';
import 'pages/switch_page.dart';
// import 'pages/tab_page.dart';
import 'pages/rate_demo_page.dart';
import 'pages/tabs_demo_v3.dart';
import 'pages/toast_page.dart';
import 'pages/qrcode_demo_page.dart';
import 'pages/s_alert_page.dart';
import 'pages/s_avatar_page.dart';
import 'pages/s_pagination_page.dart';
import 'pages/s_time_picker_page.dart';

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
          _buildListTile(context, 'SSelect (New)', const SelectPage(), Icons.list_alt),
          _buildListTile(context, 'SScaffold (Slivers)', const ScaffoldPage(), Icons.view_quilt),
          const Divider(),
          _buildListTile(context, 'Slider', const SliderPage(), Icons.linear_scale),
          _buildSectionHeader('Layout & Surfaces', colorScheme),
          _buildListTile(context, 'Card', const CardPage(), Icons.dashboard),
          _buildListTile(context, 'List Tile', const ListTilePage(), Icons.list),
          _buildListTile(context, 'SScaffold', const BaseScaffoldPage(), Icons.web_asset),
          _buildSectionHeader('Navigation', colorScheme),
          _buildListTile(context, 'Tabs', const TabsDemoV3Page(), Icons.tab),
          _buildListTile(context, 'Bottom Navigation', const BottomNavigationPage(), Icons.call_to_action),
          _buildSectionHeader('Feedback & Overlays', colorScheme),
          _buildListTile(context, 'Dialog / Modal', const DialogPage(), Icons.chat_bubble_outline),
          _buildListTile(context, 'Floating Panel', const SFloatingPanelPage(), Icons.layers),
          _buildListTile(context, 'Toast', const ToastPage(), Icons.announcement),
          _buildListTile(context, 'Sonner', const SonnerPage(), Icons.notifications_active),
          _buildListTile(context, 'Progress Indicator', const ProgressIndicatorPage(), Icons.refresh),
          _buildListTile(context, 'SProgressBar (Old)', const ModernExamplePage(), Icons.linear_scale),
          _buildListTile(context, 'SProgress (New)', const SProgressDemoPage(), Icons.pie_chart),
          _buildListTile(context, 'SCard', const SCardDemoPage(), Icons.chrome_reader_mode),
          _buildListTile(context, 'SSlider', const SSliderDemoPage(), Icons.tune),
          _buildListTile(context, 'SSwitch', const SSwitchDemoPage(), Icons.toggle_on),
          _buildListTile(context, 'SSteps', const StepsPage(), Icons.format_list_numbered),
          _buildListTile(context, 'SDatePicker', const DatePickerPage(), Icons.calendar_today),
          _buildListTile(context, 'SRate', const RatePage(), Icons.star_rate_rounded),
          _buildListTile(context, 'SInput', const InputDemoPage(), Icons.input),
          _buildListTile(context, 'SQRCode', const QRCodeDemoPage(), Icons.qr_code),
          _buildListTile(context, 'SAlert', const SAlertPage(), Icons.warning_amber_rounded),
          _buildSectionHeader('Data Display', colorScheme),
          _buildListTile(context, 'SAvatar', const SAvatarPage(), Icons.account_circle),
          _buildListTile(context, 'SPagination', const SPaginationPage(), Icons.first_page_rounded),
          _buildListTile(context, 'STimePicker', const STimePickerPage(), Icons.access_time_rounded),
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

class ModernExamplePage
    extends StatefulWidget {
  const ModernExamplePage(
      {super.key});

  @override
  State<ModernExamplePage>
      createState() =>
          _ModernExamplePageState();
}

class _ModernExamplePageState
    extends State<
        ModernExamplePage> {
  double
      _progressValue =
      0.3;
  bool
      _isTileSelected =
      true;

  @override
  Widget build(
      BuildContext
          context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Modern SProgressBar & Card Example')),
      body:
          SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Default Progress Bar', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SProgressBar(value: _progressValue),
            const SizedBox(height: 24),
            const Text('Buffered Progress Bar', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SProgressBar(
              value: _progressValue,
              bufferValue: _progressValue + 0.2,
              progressColor: Colors.blue,
              bufferColor: Colors.blue.withOpacity(0.3),
            ),
            const SizedBox(height: 24),
            const Text('Indeterminate Progress', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const SProgressBar(
              indeterminate: true,
              progressColor: Colors.purple,
            ),
            const SizedBox(height: 24),
            const Text('Custom styled with Config', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SProgressBar(
              value: 0.7,
              config: SProgressBarConfig(
                height: 20,
                borderRadius: BorderRadius.circular(10),
                progressColor: Colors.orange,
                backgroundColor: Colors.orange.withOpacity(0.2),
                label: const Text('70%', style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Vertical Progress', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SizedBox(
              height: 150,
              child: Row(
                children: [
                  const SProgressBar(
                    value: 0.4,
                    vertical: true,
                    width: 12,
                    progressColor: Colors.green,
                  ),
                  const SizedBox(width: 20),
                  SProgressBar(
                    value: 0.8,
                    vertical: true,
                    width: 24,
                    borderRadius: BorderRadius.circular(12),
                    progressColor: Colors.red,
                    backgroundColor: Colors.red.withOpacity(0.1),
                    bufferValue: 0.9,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            SButton(
              onPressed: () {
                setState(() {
                  _progressValue += 0.1;
                  if (_progressValue > 1.0) {
                    _progressValue = 0.0;
                  }
                });
              },
              child: const Text('Increase Progress'),
            ),
            const SizedBox(height: 48),

            // SCard Demo
            const Text('Enhanced SCard Examples', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                // standard card with divider
                SCard(
                  title: 'Card with Divider',
                  description: 'Separates header, body,',
                  showDivider: true,
                  width: 300,
                  body: const Text('This is the body content.'),
                  footer: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: () {}, child: const Text('Action')),
                    ],
                  ),
                ),
                // loading state
                const SCard(
                  title: 'Loading Card',
                  description: 'Simulates data fetching.',
                  isLoading: true,
                  width: 300,
                  height: 150,
                  body: Text('Content hidden by loader'),
                ),
                // selectable card
                StatefulBuilder(
                  builder: (context, setState) {
                    bool isSelected = false;
                    return SCard(
                      title: 'Selectable Card',
                      description: 'Tap to toggle selection.',
                      width: 300,
                      isSelected: isSelected,
                      onSelectionChanged: (value) {
                        setState(() => isSelected = value);
                      },
                      body: const Text('Click me!'),
                    );
                  },
                ),
                // header trailing
                SCard(
                  title: 'Header Slot',
                  description: 'Custom trailing widget.',
                  width: 300,
                  headerTrailing: IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                  body: const Text('Flexible header layout.'),
                ),
              ],
            ),

            const SizedBox(height: 32),
            const Text('Advanced "Future-Ready" Cards', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                // Filled Variant
                const SCard(
                  title: 'Filled Variant',
                  description: 'Flat background style.',
                  variant: SCardVariant.filled,
                  width: 300,
                  body: Text('Uses surface container color.'),
                ),
                // Outlined Variant
                const SCard(
                  title: 'Outlined Variant',
                  description: 'Transparent with border.',
                  variant: SCardVariant.outlined,
                  width: 300,
                  body: Text('Clean and minimal look.'),
                ),
                // Frosted Glass
                Stack(
                  children: [
                    Container(height: 150, width: 300, color: Colors.purple.withOpacity(0.5)),
                    const SCard(
                      title: 'Frosted Glass',
                      description: 'Blur effect on background.',
                      variant: SCardVariant.frosted,
                      width: 300,
                      body: Text('Renders on top of content.'),
                    ),
                  ],
                ),
                // Horizontal Card with Media
                SCard(
                  title: 'Horizontal Product',
                  description: '\$299.00',
                  axis: Axis.horizontal,
                  width: 400,
                  height: 150,

                  mediaWidth: 120, // Content takes remaining width
                  body: const Text('Great product description goes here.'),
                  footer: Row(
                    children: [
                      SButton(onPressed: () {}, child: const Text('Buy Now')),
                    ],
                  ),
                ),
                // Card with Badge
                SCard(
                  title: 'Media & Badge',
                  width: 300,
                  media: Container(
                    height: 120,
                    color: Colors.orangeAccent,
                    child: const Center(child: Icon(Icons.image, color: Colors.white, size: 48)),
                  ),
                  badge: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(12)),
                    child: const Text('NEW', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                  body: const Text('Card with top media and badge overlay.'),
                ),
              ],
            ),

            const SizedBox(height: 48),
            // SListTile Demo
            const Divider(),
            const SizedBox(height: 24),
            const Text('Advanced SListTile Examples', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 16),
            Column(
              children: [
                const SListTile(
                  title: Text('Standard Tile'),
                  subtitle: Text('Default transparent variant.'),
                  leading: Icon(Icons.star_border),
                  trailing: Icon(Icons.chevron_right),
                ),
                const SizedBox(height: 8),
                const SListTile(
                  title: Text('Filled Variant'),
                  subtitle: Text('Solid background style.'),
                  variant: SListTileVariant.filled,
                  leading: Icon(Icons.folder),
                  trailing: Icon(Icons.more_horiz),
                ),
                const SizedBox(height: 8),
                const SListTile(
                  title: Text('Outlined Variant'),
                  subtitle: Text('With border, transparent bg.'),
                  variant: SListTileVariant.outlined,
                  leading: Icon(Icons.info_outline),
                ),
                const SizedBox(height: 8),
                const SListTile(
                  title: Text('Elevated Variant'),
                  subtitle: Text('With subtle shadow.'),
                  variant: SListTileVariant.elevated,
                  leading: Icon(Icons.layers),
                ),
                const SizedBox(height: 8),

                // SListTileGroup Header
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Grouped Tiles', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('A collection of related items.', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ),
                // SListTileGroup
                SListTileGroup(
                  children: [
                    SListTile(
                      title: const Text('Item One'),
                      leading: const Icon(Icons.looks_one),
                      onTap: () {},
                    ),
                    SListTile(
                      title: const Text('Item Two'),
                      leading: const Icon(Icons.looks_two),
                      onTap: () {},
                    ),
                    SListTile(
                      title: const Text('Item Three'),
                      leading: const Icon(Icons.looks_3),
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                const SListTile(
                  title: Text('Rich Metadata'),
                  subtitle: Text('With overline text above.'),
                  overline: Text('CATEGORY'),
                  variant: SListTileVariant.filled,
                  leading: Icon(Icons.label),
                ),
                const SizedBox(height: 8),
                SListTile(
                  title: const Text('Selection Toggle'),
                  subtitle: const Text('Tap to toggle selection state.'),
                  variant: SListTileVariant.outlined,
                  selected: _isTileSelected,
                  leading: Icon(_isTileSelected ? Icons.check_circle : Icons.circle_outlined),
                  onTap: () => setState(() => _isTileSelected = !_isTileSelected),
                ),
              ],
            ),
            const SizedBox(height: 48),
            const Divider(),
            const SizedBox(height: 24),
            const Text('SSonner Examples', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                SButton(
                  onPressed: () => SSonner.instance.show(message: 'Default Toast Information'),
                  child: const Text('Default'),
                ),
                SButton(
                  onPressed: () => SSonner.instance.show(
                    message: 'Operation Successful!',
                    variant: SSonnerVariant.success,
                  ),
                  child: const Text('Success'),
                ),
                SButton(
                  onPressed: () => SSonner.instance.show(
                    message: 'Something went wrong.',
                    variant: SSonnerVariant.error,
                  ),
                  child: const Text('Error'),
                ),
                SButton(
                  onPressed: () => SSonner.instance.show(
                    message: 'Warning: Battery Low',
                    variant: SSonnerVariant.warning,
                  ),
                  child: const Text('Warning'),
                ),
                SButton(
                  onPressed: () => SSonner.instance.show(
                    message: 'Item deleted.',
                    action: InkWell(
                      onTap: () => debugPrint('Undo tapped'),
                      child: const Text('Undo', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  child: const Text('With Action'),
                ),
                SButton(
                  onPressed: () => SSonner.instance.show(
                    message: 'This toast can be dismissed by clicking the X.',
                    showCloseButton: true,
                    duration: const Duration(seconds: 10),
                  ),
                  child: const Text('With Close Button'),
                ),
                SButton(
                  onPressed: () => SSonner.instance.show(
                    config: const SSonnerConfig(
                      message: 'Detailed description of the event that just happened.',
                      title: 'Event Triggered',
                      position: SSonnerPosition.top,
                      icon: Icons.notifications_active,
                    ),
                  ),
                  child: const Text('Rich Content (Top)'),
                ),
                SButton(
                  onPressed: () {
                    for (int i = 0; i < 3; i++) {
                      Future.delayed(Duration(milliseconds: i * 300), () {
                        SSonner.instance.show(
                          message: 'Stacked Toast ${i + 1}',
                        );
                      });
                    }
                  },
                  child: const Text('Show Stacked (3)'),
                ),
                SButton(
                  onPressed: () {
                    final id = SSonner.instance.show(
                      message: 'Dismissing in 3 seconds...',
                      duration: const Duration(seconds: 10), // Long duration
                    );

                    Future.delayed(const Duration(seconds: 3), () {
                      SSonner.instance.dismiss(id);
                    });
                  },
                  child: const Text('Programmatic Dismiss'),
                ),
                SButton(
                  onPressed: () => SSonner.instance.show(
                    message: 'Swipe me away! ->',
                    duration: const Duration(seconds: 5),
                  ),
                  child: const Text('Swipe to Dismiss'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
