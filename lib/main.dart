// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
////파란 줄을 없애기 위한 빠른 수정

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart'; //파이어베이스DB
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDSpe4swtoP3Yj6BCkwhVXqBYwueiMkdas',
      appId: '1:781983802194:android:a9e27819be416fe04cd08b',
      messagingSenderId: '781983802194',
      projectId: 'testsnslogin-d3f6a',
      databaseURL:
          'https://testsnslogin-d3f6a-default-rtdb.asia-southeast1.firebasedatabase.app/',
    ),
  );
  //await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 우측 상단 debug 띠 제거
      title: 'Testing App Bar',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Testing Thomas Home Page'),
    );
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  dispose() async {
    super.dispose();

  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

