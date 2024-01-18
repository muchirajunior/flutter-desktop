import 'package:flutter/material.dart';

class TabSample extends StatelessWidget {
  const TabSample({super.key, this.title="Sample Tab"});
  final String title;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(title),
    );
  }
}