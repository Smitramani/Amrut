import 'package:amrut/auth/main_page.dart';
import 'package:amrut/pages/home_page.dart';
import 'package:amrut/pages/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:amrut/splashes/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessageReceived);

  runApp(const MyApp());
}

Future _firebaseBackgroundMessageReceived(RemoteMessage message) async {
  print(
      "Notification : ${message.notification?.title} - ${message.notification?.body}");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
