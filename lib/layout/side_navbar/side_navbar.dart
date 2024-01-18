import 'package:flutter/material.dart';

class SideNavBar extends StatefulWidget {
  const SideNavBar({super.key});

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 200,
      height: double.infinity,
      color: Colors.amber,
      child: const Text('hello'),
    );
  }
}