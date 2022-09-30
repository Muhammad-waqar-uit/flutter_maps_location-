import 'package:flutter/material.dart';
import 'package:fluttermapsboths/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Maps',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal
      ),
      home: const Home_Screen(),
    );
  }
}
