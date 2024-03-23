import 'package:flutter/material.dart';
import 'package:flutter_desktop/models/nav_controller.dart';
import 'package:flutter_desktop/utils/utils.dart';

class MainArea extends StatefulWidget {
  const MainArea({super.key});

  @override
  State<MainArea> createState() => _MainAreaState();
}

class _MainAreaState extends State<MainArea>  {
  PageController controller = PageController();

  // @override
  // bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // super.build(context);
     
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
                  controller: nav.scrollController,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    controller: nav.scrollController,
                    children: nav.tabs.map((tab) => Container(
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
                          onTap: () {
                            Utils.navigationController.value =  NavController(currentTabIndex: nav.tabs.indexOf(tab), tabs: nav.tabs, scrollController: nav.scrollController);
                            controller.jumpToPage(nav.currentTabIndex);
                          }
                        )
                      ),
                    )).toList(),
                  ),
                )
              ),
            
              Expanded(
                child: PageView(
                  pageSnapping: true,
                  allowImplicitScrolling: true,
                  scrollDirection: Axis.vertical,
                  controller: controller,
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