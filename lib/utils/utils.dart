import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_desktop/components/dashboard.dart';
import 'package:flutter_desktop/components/tab_sample.dart';
import 'package:flutter_desktop/components/users.dart';
import 'package:flutter_desktop/models/nav_controller.dart';
import 'package:flutter_desktop/models/navigation.dart';
import 'package:flutter_desktop/models/tab_model.dart';

class Utils{
  static final List<Navigation> navigations=[
    Navigation(title: 'dashboard',tab: const Dashboard()),
    Navigation(title: 'users',tab: const Users()),
    Navigation(
      title: 'Sales',
      tab: const TabSample(title: 'Sales',),
      children: [
        Navigation(title: 'orders',tab: const TabSample(title: 'Orders',),selected: true),
        Navigation(title: 'invoice',tab: const TabSample(title: 'Invoices',))
      ]
    ),
     Navigation(
      title: 'Items',
      tab: const TabSample(title: 'Items',),
      children: [
        Navigation(title: 'itemdata',tab: const TabSample(title: 'Items tab',)),
        Navigation(
          title: 'documents',
          tab: const TabSample(title: 'docs',),
          children: [
            Navigation(title: 'transfer request',tab: const TabSample(title: 'request tab',)),
            Navigation(title: 'inventory transfer',tab: const TabSample(title: 'transfer tab',)),
            Navigation(title: 'inventory request',tab: const TabSample(title: 'transfer tab',)),
            Navigation(title: 'inventory posting',tab: const TabSample(title: 'transfer tab',)),
            Navigation(title: 'inventory update',tab: const TabSample(title: 'transfer tab',)),
          ]
          )
      ]
    ),
    Navigation(title: 'settings',tab: const TabSample(title: 'settings',)),
  ];

  static final navigationController = ValueNotifier<NavController>(NavController(
      currentTabIndex: -1,
      tabs: [],
      scrollController: ScrollController()
    ));

  static void addTab(Navigation navigation){
    var results=navigationController.value.tabs.where((element) => element.title==navigation.title);
    if(results.isNotEmpty){
      log("an similar tab exist");
      navigationController.value.currentTabIndex = navigationController.value.tabs.indexOf(results.first);
      navigationController.value = NavController(
        currentTabIndex: navigationController.value.tabs.indexOf(results.first),
         tabs: navigationController.value.tabs, scrollController: ScrollController());
      return;
    }
    navigationController.value=NavController(
      currentTabIndex: navigationController.value.tabs.length,
      tabs: [...navigationController.value.tabs, TabModel(title: navigation.title, tab: navigation.tab)],
      scrollController: ScrollController(
        initialScrollOffset: navigationController.value.scrollController.position.maxScrollExtent
      )
    );
    
  }

  static void removeTab(TabModel tabModel){
    navigationController.value.tabs.remove(tabModel);
    navigationController.value = NavController(
        currentTabIndex: navigationController.value.tabs.length-1,
        tabs: navigationController.value.tabs,
        scrollController: ScrollController()
    );
  }

}