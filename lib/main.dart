import 'package:flutter/material.dart';
import 'package:flutter_desktop/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.amber.shade50,
        expansionTileTheme:const ExpansionTileThemeData(
          shape: RoundedRectangleBorder(side: BorderSide.none ),
        ),
      ),

      darkTheme: ThemeData.dark().copyWith(
         expansionTileTheme:const ExpansionTileThemeData(
          shape: RoundedRectangleBorder(side: BorderSide.none ),
        ),
      ),

      themeMode: ThemeMode.light,

      home: const Home()
    );
  }
}
