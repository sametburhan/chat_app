import 'package:chat_app/pages/messages.dart';
import 'package:chat_app/structure/constant.dart';
import 'package:chat_app/structure/tema.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/structure/tema.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
      backgroundColor: temaColor,
      extendBody: true,
    );
  }

  Widget content() {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height * .87,
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .15,
                    height: MediaQuery.of(context).size.width * .20,
                    child: IconButton(
                      onPressed: () => {
                        Navigator.pop(context, true),
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_sharp,
                      ),
                      iconSize: 30,
                      color: temaColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
