import 'package:example/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_design/s_design.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final STheme _sTheme = STheme();

    final myOverlays = [
      OverlayEntry(
        builder: (overlayContext) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final overlay = Overlay.of(overlayContext);

            SSonner.instance.initialize(overlay);

            /// You can initialize other instance here as well
            SToast.initialize(overlay);
          });
          return const SizedBox.shrink();
        },
      ),
      // You could add more overlay entries here, if needed:
      // OverlayEntry(builder: ...),
    ];

    return GetMaterialApp(
      title: 'SDesign Demo',
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      theme: _sTheme.getLightTheme(),
      darkTheme: _sTheme.getDarkTheme(),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'SDesign '),
      builder: sOverlayBuilder(overlays: myOverlays),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const List<Map<String, String>> _widgets = [
    {'title': 'S Scaffold', 'page': '/base_scaffold_page'},
    {'title': 'Buttons', 'page': '/button_page'},
    {'title': 'Inputs', 'page': '/inputs_page'},
    {'title': 'Sonner', 'page': '/sonner_page'},
    {'title': 'Toasts', 'page': '/toast_page'},
    {'title': 'Cards', 'page': '/card_page'},
    {'title': 'Check Boxes', 'page': '/check_box_page'},
    {'title': 'DropDown Menu', 'page': '/dropdown_menu_page'},
    {'title': 'Progress Indicators', 'page': '/progress_indicator_page'},
    {'title': 'Dialog', 'page': '/modal_page'},
    {'title': 'Tabs', 'page': '/tab_page'},
    // {'title': 'Bottom Navigation', 'page': '/bottom_navigation_page'},
    // {'title': 'Sliders', 'page': '/slider_page'},
    {'title': 'Switches', 'page': '/switch_page'},
  ];

  @override
  Widget build(BuildContext context) {
    return SScaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      renderBody: ((context){
        return ListView(
          children: [
            for (final widget in _widgets)
              ListTile(
                title: Text(widget['title']!),
                onTap: () => Get.toNamed(widget['page']!),
              ),
          ],
        );
      }),
    );
  }
}
