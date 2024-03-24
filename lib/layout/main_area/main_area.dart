import 'package:flutter/material.dart';
import 'package:flutter_desktop/models/nav_controller.dart';
import 'package:flutter_desktop/utils/utils.dart';

class MainArea extends StatefulWidget {
  const MainArea({super.key});

  @override
  State<MainArea> createState() => _MainAreaState();
}

class _MainAreaState extends State<MainArea>  {

  bool showDragHandles =false;
  
  @override
  Widget build(BuildContext context) {
     
    return ValueListenableBuilder(
      valueListenable: Utils.navigationController,
      builder: (context,nav,_) {
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
                // width: 400,
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Scrollbar(
                  controller: Utils.scrollController,
                  child: ReorderableListView(
                    scrollDirection: Axis.horizontal,
                    scrollController: Utils.scrollController,
                    buildDefaultDragHandles: showDragHandles,
                    onReorder: (oldIndex, newIndex) {
                      var tab = nav.tabs[oldIndex];
                      nav.tabs.removeAt(oldIndex);
                      if(newIndex>=nav.tabs.length){
                        nav.tabs.add(tab);
                        newIndex-=1;
                      }else if(newIndex<oldIndex){
                        nav.tabs.insert(newIndex, tab);
                      }else{
                        nav.tabs.insert(newIndex, tab);
                        newIndex = newIndex-1;
                      }
                     
                      Utils.navigationController.value =  NavController(currentTabIndex: newIndex, tabs: nav.tabs,);
                      setState(()=>showDragHandles= false );
                    },
                    children: nav.tabs.map((tab) => Container(
                      key: ValueKey(tab.title),
                      width: tab.title.length*22,
                      constraints: const BoxConstraints(
                        minWidth: 150,
                        maxWidth: 300
                      ),
                      child: Card(
                        elevation: nav.tabs.indexOf(tab) == nav.currentTabIndex ? 3 : 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        margin: const EdgeInsets.all(1),
                        child: ListTile(
                          contentPadding: const EdgeInsets.only(left:10),
                          selected:  nav.tabs.indexOf(tab) == nav.currentTabIndex ,
                          leading: const Icon(Icons.file_copy, size: 15,),
                          title: Text(tab.title, maxLines: 1,overflow: TextOverflow.ellipsis,),
                          trailing:IconButton(
                            onPressed:()=> Utils.removeTab(tab) ,
                             icon: const Icon(Icons.close, size: 15,)
                             ),
                          onTap: () => Utils.navigationController.value =  NavController(currentTabIndex: nav.tabs.indexOf(tab), tabs: nav.tabs,),
                          onFocusChange: (value)=> setState(()=>showDragHandles= false ),
                          onLongPress:()=> setState(()=>showDragHandles= true ),
                          
                        )
                      ),
                    )).toList(),
                  ),
                )
              ),
            
              Expanded(
                child: IndexedStack(
                  index: nav.currentTabIndex,
                  children: nav.tabs.map((tab) => tab.tab).toList(),
                )
              )
            ],
          ),
        );
      }
    );
  }
}