import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_design/s_design.dart';

import 'app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final STheme sTheme = STheme();

    final List<OverlayEntry> myOverlays = <OverlayEntry>[
      OverlayEntry(
        builder: (BuildContext overlayContext) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final OverlayState overlay = Overlay.of(overlayContext);

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
      theme: sTheme.getLightTheme(),
      darkTheme: sTheme.getDarkTheme(),
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
  static const List<Map<String, String>> _widgets = <Map<String, String>>[
    <String, String>{'title': 'S Scaffold', 'page': '/base_scaffold_page'},
    <String, String>{'title': 'Buttons', 'page': '/button_page'},
    <String, String>{'title': 'Inputs', 'page': '/inputs_page'},
    <String, String>{'title': 'Sonner', 'page': '/sonner_page'},
    <String, String>{'title': 'Toasts', 'page': '/toast_page'},
    <String, String>{'title': 'Cards', 'page': '/card_page'},
    <String, String>{'title': 'Check Boxes', 'page': '/check_box_page'},
    <String, String>{'title': 'DropDown Menu', 'page': '/dropdown_menu_page'},
    <String, String>{
      'title': 'Progress Indicators',
      'page': '/progress_indicator_page'
    },
    <String, String>{'title': 'Dialog', 'page': '/modal_page'},
    <String, String>{'title': 'Tabs', 'page': '/tab_page'},
    // {'title': 'SFloating Action Button', 'page': '/s_fab_page'},
    <String, String>{'title': 'Switches', 'page': '/switch_page'},
    <String, String>{'title': 'TextTile', 'page': '/list_tile_page'},
  ];

  @override
  Widget build(BuildContext context) {
    return SScaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      renderBody: (BuildContext context) {
        return ListView(
          children: <Widget>[
            for (final Map<String, String> widget in _widgets)
              ListTile(
                title: Text(widget['title']!),
                onTap: () => Get.toNamed<dynamic>(widget['page']!),
              ),
          ],
        );
      },
    );
  }
}
