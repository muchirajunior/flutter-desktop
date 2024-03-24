import 'package:flutter_desktop/models/tab_model.dart';

class NavController{
  int currentTabIndex;
  List<TabModel> tabs;

  NavController({required this.currentTabIndex, required this.tabs});
}
