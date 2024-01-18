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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.amber.shade50,
        expansionTileTheme: const ExpansionTileThemeData(
          shape: OutlineInputBorder(borderSide: BorderSide.none)
        )
      ),

      home: const Home()
    );
  }
}
