import 'package:chat_app/pages/signin.dart';
import 'package:chat_app/structure/pagePicker.dart';
import 'package:flutter/material.dart';
import 'structure/tema.dart';
import 'structure/constant.dart';
import 'structure/global.dart' as global;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageSelector(),
      backgroundColor: temaColor,
      extendBody: true,
    );
  }

  pageSelector() {
    if (global.signinTrue == true) {
      return pagePicker();
    } else if (global.signinTrue == false) {
      return signIn();
    }
    return null;
  }
}
