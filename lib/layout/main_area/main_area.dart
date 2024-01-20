import 'package:flutter/material.dart';
import 'package:flutter_desktop/components/tab_sample.dart';

class MainArea extends StatefulWidget {
  const MainArea({super.key});

  @override
  State<MainArea> createState() => _MainAreaState();
}

class _MainAreaState extends State<MainArea> {
  List<String> tabs=["dashboard","users","orders","settings "];
  String currentTab ='';

  @override
  void initState() {
    currentTab=tabs.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      // margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      child: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: tabs.map((tab) => Container(
                height: 40,
                constraints: const BoxConstraints(
                  minWidth: 150,
                  maxWidth: 200
                ),
                child: Card(
                  elevation: tab ==currentTab ? 1 : 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  margin: const EdgeInsets.all(1),
                  child: ListTile(
                    leading: const Icon(Icons.file_copy, size: 15,),
                    title: Text(tab),
                    trailing: const Icon(Icons.close, size: 15,),
                    onTap: () => setState(() => currentTab=tab),
                  )
                ),
              )).toList(),
            )
          ),
          const Expanded(child: TabSample())
        ],
      ),
    );
  }
}