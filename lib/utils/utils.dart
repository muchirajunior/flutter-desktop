import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_desktop/components/dashboard.dart';
import 'package:flutter_desktop/components/tab_sample.dart';
import 'package:flutter_desktop/components/users.dart';
import 'package:flutter_desktop/models/nav_controller.dart';
import 'package:flutter_desktop/models/navigation.dart';
import 'package:flutter_desktop/models/tab_model.dart';

class Utils{
  static final navKey = GlobalKey<NavigatorState>();
  static final List<Navigation> navigations=[
    Navigation(title: 'Dashboard',tab: const Dashboard()),
    Navigation(title: 'Users',tab: const Users()),
    Navigation(
      title: 'Sales',
      tab: const TabSample(title: 'Sales',),
      children: [
        Navigation(title: 'Orders',tab: const TabSample(title: 'Orders',),selected: true),
        Navigation(title: 'Invoice',tab: const TabSample(title: 'Invoices',))
      ]
    ),
     Navigation(
      title: 'Items',
      tab: const TabSample(title: 'Items',),
      children: [
        Navigation(title: 'Itemdata',tab: const TabSample(title: 'Items tab',)),
        Navigation(
          title: 'Documents',
          tab: const TabSample(title: 'docs',),
          children: [
            Navigation(title: 'Transfer Request',tab: const TabSample(title: 'Request tab',)),
            Navigation(title: 'Inventory Transfer',tab: const TabSample(title: 'Transfer tab',)),
            Navigation(title: 'Inventory Request',tab: const TabSample(title: 'Transfer tab',)),
            Navigation(title: 'Inventory Posting',tab: const TabSample(title: 'Transfer tab',)),
            Navigation(title: 'Inventory Update',tab: const TabSample(title: 'Transfer tab',)),
          ]
          )
      ]
    ),
    Navigation(title: 'Settings',tab: const TabSample(title: 'Settings tab',)),
  ];

  static final ScrollController scrollController = ScrollController();

  static final navigationController = ValueNotifier<NavController>(NavController(
      currentTabIndex: -1,
      tabs: [],
    ));

  static void addTab(Navigation navigation){
    var results=navigationController.value.tabs.where((element) => element.title==navigation.title);
    if(results.isNotEmpty){
      log("A similar tab exist");
      navigationController.value.currentTabIndex = navigationController.value.tabs.indexOf(results.first);
      navigationController.value = NavController(
        currentTabIndex: navigationController.value.tabs.indexOf(results.first),
        tabs: navigationController.value.tabs, 
      );
      return;
    }
    scrollController.position.maxScrollExtent;
    navigationController.value=NavController(
      currentTabIndex: navigationController.value.tabs.length,
      tabs: [...navigationController.value.tabs, TabModel(title: navigation.title, tab: navigation.tab)],
    );

    scrollController.jumpTo(scrollController.position.maxScrollExtent+200);
    
  }

  static void removeTab(TabModel tabModel){
    int index= navigationController.value.tabs.indexOf(tabModel);
    int currentIndex=navigationController.value.currentTabIndex;
    navigationController.value.tabs.remove(tabModel);
    int length = navigationController.value.tabs.length;
    navigationController.value = NavController(
        currentTabIndex: index==0 && length>0 ? 0 : index == currentIndex ? index-1 : index<currentIndex ? currentIndex -1 : currentIndex,
        tabs: navigationController.value.tabs,
    );
  }

}