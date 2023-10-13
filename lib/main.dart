import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:iotbasedparking/homepage.dart';
// import 'package:iotbasedparking/parkingspace.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
