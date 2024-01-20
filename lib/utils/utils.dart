import 'package:flutter_desktop/components/tab_sample.dart';
import 'package:flutter_desktop/models/navigation.dart';

class Utils{
  static final List<Navigation> navigations=[
    Navigation(title: 'dashboard',tab: const TabSample(title: 'Dashboard',)),
    Navigation(title: 'users',tab: const TabSample(title: 'users',), selected: true),
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
}