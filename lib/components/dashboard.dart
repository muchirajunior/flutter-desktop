import 'package:flutter/material.dart';

TextEditingController controller = TextEditingController(text:  "Enter dash" );

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
 
  @override
  Widget build(BuildContext context) {
    return Center(
      key: GlobalKey(debugLabel: 'dashboard'),
      child: Column(
        children: [
          TextFormField(
            controller: controller
          )
        ],
      ),
    );
  }
}