import 'package:flutter/material.dart';
import 'package:flutter_desktop/utils/utils.dart';

class SideNavBar extends StatefulWidget {
  const SideNavBar({super.key});

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: double.infinity,
      child: Card(
        child: Column(
          children: [
            const ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 2),
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text("User Name"),
              subtitle: Text("user.name@company.com"),
            ),
            const Divider(),
            Expanded(
              child: ListView(
                children: Utils.navigations.map((nav) {
                  if(nav.children==null){
                    return ListTile(
                      leading: const Icon(Icons.sort),
                      title: Text(nav.title),
                      onTap: () => Utils.addTab(nav),
                    );
                  }else{
                    return ExpansionTile(
                      title: Text(nav.title),
                      leading: const Icon(Icons.sort) ,
                      maintainState: true,
                      childrenPadding: const EdgeInsets.only(left: 10),
                      children: nav.children!.map((childNav) {
                        if(childNav.children==null){
                          return ListTile(
                            leading: const Icon(Icons.policy_rounded),
                            title: Text(childNav.title),
                            onTap: () =>Utils.addTab(childNav),
                          );
                        }else{
                          return ExpansionTile(
                            childrenPadding: const EdgeInsets.only(left: 15),
                            title: Text(childNav.title),
                            leading: const Icon(Icons.policy),
                            children: childNav.children!.map((subNav) => ListTile(
                              onTap: () => Utils.addTab(subNav),
                              title: Text(subNav.title,),
                              leading: const Icon(Icons.label_important_outline),
                            )).toList(),
                            );
                        }
                      }).toList(),
                      );
                  }
                }).toList(),
              ),
            ),

            const ListTile(
              title: Text("some footing here", style: TextStyle(fontSize: 14),),
              trailing: Icon(Icons.arrow_back_ios,size: 15,),
            )
          ],
        ),
      )
    );
  }
}