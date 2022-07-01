import 'package:chat_app/structure/tema.dart';
import 'package:flutter/material.dart';

class messagePage extends StatefulWidget {
  const messagePage({Key? key}) : super(key: key);

  @override
  State<messagePage> createState() => _messagePageState();
}

class _messagePageState extends State<messagePage> {
  @override
  Widget build(BuildContext context) {
    return content();
  }

  Widget content() {
    return Center(
      child: Image.asset(
        "assets/Group 25.png",
        scale: MediaQuery.of(context).size.width * .004,
      ),
    );
  }
}
