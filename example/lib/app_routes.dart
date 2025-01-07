import 'package:example/pages/card.dart';
import 'package:example/pages/check_box.dart';
import 'package:example/pages/sbutton.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final List<GetPage<dynamic>> routes = [
    GetPage(name: '/button_page', page: () => const ButtonPage()),
    GetPage(name: '/card_page', page: () => const CardPage()),
    GetPage(name: '/check_box_page', page: () => const CheckboxPage()),
  ];
}
