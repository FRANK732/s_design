import 'package:example/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SDesign Demo',
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'SDesign '),
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
    {'title': 'Buttons', 'page': '/button_page'},
    {'title': 'Inputs', 'page': '/inputs_page'},
    {'title': 'Toasts', 'page': '/toast_page'},
    {'title': 'DropDown Menu', 'page': '/dropdown_menu_page'},
    {'title': 'Check bBoxes', 'page': '/check_box_page'},
    {'title': 'Progress Indicators', 'page': '/progress_indicator_page'},
    {'title': 'Cards', 'page': '/card_page'},
    {'title': 'Modals', 'page': '/modal_page'},
    {'title': 'Tabs', 'page': '/tab_page'},
    {'title': 'Bottom Navigation', 'page': '/bottom_navigation_page'},
    {'title': 'App Bars', 'page': '/app_bar_page'},
    {'title': 'Sliders', 'page': '/slider_page'},
    {'title': 'Switches', 'page': '/switch_page'},
    {'title': 'Date Pickers', 'page': '/date_picker_page'},
    {'title': 'Time Pickers', 'page': '/time_picker'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          for (final widget in _widgets)
            ListTile(
              title: Text(widget['title']!),
              onTap: () => Get.toNamed(widget['page']!),
            ),
        ],
      ),
    );
  }
}
