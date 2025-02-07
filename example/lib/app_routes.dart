import 'package:example/pages/base_scaffold.dart';
import 'package:example/pages/bottom_navigation.dart';
import 'package:example/pages/card.dart';
import 'package:example/pages/check_box.dart';
import 'package:example/pages/dropdown_menu.dart';
import 'package:example/pages/inputs_page.dart';
import 'package:example/pages/list_tile_page.dart';
import 'package:example/pages/s_modal_page.dart';
import 'package:example/pages/sbutton.dart';
import 'package:example/pages/sonner_page.dart';
import 'package:example/pages/toast_page.dart';
import 'package:example/pages/progress_indicator_page.dart';
import 'package:example/pages/tab_page.dart';
import 'package:example/pages/slider_page.dart';
import 'package:example/pages/switch_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final List<GetPage<dynamic>> routes = [
    GetPage(name: '/button_page', page: () => const ButtonPage()),
    GetPage(name: '/card_page', page: () => const CardPage()),
    GetPage(
      name: '/check_box_page',
      page: () => const CheckboxPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/dropdown_menu_page',
      page: () => const DropdownMenuPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/inputs_page',
      page: () => const InputFieldPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/modal_page',
      page: () => const DialogPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/toast_page',
      page: () => const ToastPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/sonner_page',
      page: () => const SonnerPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/progress_indicator_page',
      page: () => const ProgressIndicatorPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/tab_page',
      page: () => const TabsPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/bottom_navigation_page',
      page: () => const BottomNavigationPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/slider_page',
      page: () => const SliderPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/switch_page',
      page: () => const SwitchPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/base_scaffold_page',
      page: () => const BaseScaffoldPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/list_tile_page',
      page: () => const ListTilePage(),
      transition: Transition.rightToLeft,
    ),
  ];
}
