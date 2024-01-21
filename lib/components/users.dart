import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      key: GlobalKey(debugLabel: "users"),
      child: Column(
        children: [
          TextFormField(
            controller: TextEditingController(text: "Enter user"),
          )
        ],
      ),
    );
  }
}