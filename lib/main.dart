import 'package:amrut/pages/cust_datastore_screen.dart';
import 'package:amrut/pages/home_page.dart';
import 'package:amrut/splashes/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homeScreen(),
    );
  }
}
