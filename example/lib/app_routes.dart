import 'package:example/pages/card.dart';
import 'package:example/pages/check_box.dart';
import 'package:example/pages/dropdown_menu.dart';
import 'package:example/pages/inputs_page.dart';
import 'package:example/pages/sbutton.dart';
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
  ];
}
