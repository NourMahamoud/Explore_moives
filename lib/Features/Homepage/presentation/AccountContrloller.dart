import 'package:flutter/Material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AcountController extends GetxController {
  List<String> cardTitle = [
    'My account',
    'Languages and Setting',
    'My Lists',
    'Setting',
    'Privacy Policy',
    'FAQ',
  ];

  List<IconData> cardIcon = [
    Icons.account_circle_outlined,
    Icons.translate,
    Icons.credit_card_sharp,
    Icons.settings,
    Icons.article_outlined,
    Icons.info_outline,
  ];
}