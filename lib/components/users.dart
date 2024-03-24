import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  int count = 0;
  var controller = TextEditingController(text: "Enter user");

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
      children: [
        TextFormField(
          controller: controller,
        ),
    
        const SizedBox(height: 100,),
        Center(child: Text("Count is $count")),
        const SizedBox(height:  300),
        Center(child: FilledButton(onPressed: ()=>setState(() => count++ ), child:const Icon(Icons.add))),
        const SizedBox(height:  400),
        Center(child: Text("This is the footer message. \t Count is $count")),
    
      ],
    );
  }
}