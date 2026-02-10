import 'package:get/get.dart';

import 'pages/S_floating_panel_page.dart';
import 'pages/bottom_navigation.dart';
import 'pages/card.dart';
import 'pages/check_box.dart';
import 'pages/dropdown_menu.dart';
import 'pages/inputs_page.dart';
import 'pages/list_tile_page.dart';
import 'pages/progress_indicator_page.dart';
import 'pages/s_modal_page.dart';
import 'pages/sbutton.dart';
import 'pages/slider_page.dart';
import 'pages/sonner_page.dart';
import 'pages/sscaffold/base_scaffold.dart';
import 'pages/switch_page.dart';
import 'pages/tab_page.dart';
import 'pages/toast_page.dart';

class AppRoutes {
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<dynamic>(name: '/button_page', page: () => const ButtonPage()),
    GetPage<dynamic>(name: '/card_page', page: () => const CardPage()),
    GetPage<dynamic>(
      name: '/check_box_page',
      page: () => const CheckboxPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: '/dropdown_menu_page',
      page: () => const DropdownMenuPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: '/inputs_page',
      page: () => const InputFieldPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: '/modal_page',
      page: () => const DialogPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: '/toast_page',
      page: () => const ToastPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: '/sonner_page',
      page: () => const SonnerPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: '/progress_indicator_page',
      page: () => const ProgressIndicatorPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: '/tab_page',
      page: () => const TabsPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: '/bottom_navigation_page',
      page: () => const BottomNavigationPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: '/slider_page',
      page: () => const SliderPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: '/switch_page',
      page: () => const SwitchPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: '/base_scaffold_page',
      page: () => const BaseScaffoldPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: '/s_floating_panel_page',
      page: () => const SFloatingPanelPage(),
      transition: Transition.rightToLeft,
    ),
    // GetPage<dynamic>(
    //   name: '/useSafe_scaffold_page',
    //   page: () => const SafeAreaScaffoldPage(),
    //   transition: Transition.rightToLeft,
    // ),
    GetPage<dynamic>(
      name: '/list_tile_page',
      page: () => const ListTilePage(),
      transition: Transition.rightToLeft,
    ),
  ];
}
