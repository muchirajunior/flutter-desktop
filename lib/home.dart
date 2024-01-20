import 'package:flutter/material.dart';
import 'package:flutter_desktop/layout/main_area/main_area.dart';
import 'package:flutter_desktop/layout/side_navbar/side_navbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool displayMenu=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Desktop Demo"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => setState(() => displayMenu = !displayMenu),
          icon: const Icon(Icons.menu),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Row(
          children: [
            Visibility(
              visible: displayMenu,
              child: Container(
                height: MediaQuery.of(context).size.height,
                constraints:const  BoxConstraints( maxWidth: 300),
                child: const SideNavBar(),
              ),
            ),
            const Expanded(child: MainArea())
          ],
        )
      ),
    );
  }
}