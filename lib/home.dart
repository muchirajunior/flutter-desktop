import 'package:flutter/material.dart';
import 'package:flutter_desktop/layout/main_area/main_area.dart';
import 'package:flutter_desktop/layout/side_navbar/side_navbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Desktop Demo"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              constraints:const  BoxConstraints( maxWidth: 300),
              child: const SideNavBar(),
            ),
            const Expanded(child: MainArea())
          ],
        )
      ),
    );
  }
}