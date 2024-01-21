import 'package:flutter/material.dart';
import 'package:flutter_desktop/models/tab_model.dart';

class NavController{
  int currentTabIndex;
  List<TabModel> tabs;
  ScrollController scrollController;

  NavController({required this.currentTabIndex, required this.tabs, required this.scrollController});
}
