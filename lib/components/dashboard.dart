import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      key: GlobalKey(debugLabel: 'dashboard'),
      child: Column(
        children: [
          TextFormField(
            controller: TextEditingController(text: "Enter dash"),
          )
        ],
      ),
    );
  }
}