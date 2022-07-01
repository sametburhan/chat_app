import 'package:chat_app/pages/contacts.dart';
import 'package:chat_app/pages/messages.dart';
import 'package:chat_app/structure/constant.dart';
import 'package:chat_app/structure/tema.dart';
import 'package:flutter/material.dart';
import '../pages/profile.dart';

class pagePicker extends StatefulWidget {
  const pagePicker({Key? key}) : super(key: key);
  @override
  State<pagePicker> createState() => _pagePickerState();
}

class _pagePickerState extends State<pagePicker> {
  late Color color1 = blackColor;
  late Color color2 = whiteColor;
  late Color color3 = whiteColor;
  late double index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: temaColor,
      floatingActionButton: Container(
        height: MediaQuery.of(context).size.width * .18,
        width: MediaQuery.of(context).size.width * .18,
        child: FloatingActionButton(
          onPressed: () => {},
          backgroundColor: temaColor,
          child: Icon(Icons.add), // content picker yazılacak
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        children: [
          Expanded(flex: 1, child: SizedBox()),
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * .20,
                      height: MediaQuery.of(context).size.width * .14,
                      decoration: BoxDecoration(
                          color: color1,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              index = 0;
                              colorpicker(index);
                            });
                          },
                          icon: Icon(
                            Icons.message_outlined,
                            color: temaColor,
                          ))),
                  Container(
                      width: MediaQuery.of(context).size.width * .20,
                      height: MediaQuery.of(context).size.width * .14,
                      decoration: BoxDecoration(
                        color: color2,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              index = 1;
                              colorpicker(index);
                            });
                          },
                          icon: Icon(
                            Icons.group,
                            color: temaColor,
                          ))),
                  Container(
                      height: MediaQuery.of(context).size.width * .14,
                      width: MediaQuery.of(context).size.width * .20,
                      decoration: BoxDecoration(
                        color: color3,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              index = 2;
                              colorpicker(index);
                            });
                          },
                          icon: Icon(
                            Icons.phone,
                            color: temaColor,
                          ))),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: whiteColor,
                    child: CircleAvatar(
                      radius: 35,
                      child: IconButton(
                        icon: Icon(Icons.abc_outlined),
                        color: color1.withOpacity(0),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const profilePage()),
                          );
                        },
                      ),
                      backgroundColor: whiteColor,
                      backgroundImage: NetworkImage(
                          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg"),
                    ),
                  ),
                ],
              )),
          Expanded(
            flex: 10,
            child: Container(
              child: pageSelect(index),
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(50))),
            ),
          ),
        ],
      ),
    );
  }

  pageSelect(index) {
    if (index == 0) {
      return messagePage();
    } else if (index == 1) {
      return Container(
        margin: EdgeInsets.only(top: 250),
        child: Image.asset(
          "assets/Group 24.png",
          scale: 1.7,
        ),
      );
    } else if (index == 2) {
      return contactsPage();
    }
  }

  colorpicker(index) {
    if (index == 0) {
      setState(() {
        color1 = blackColor;
        color2 = whiteColor;
        color3 = whiteColor;
      });
    } else if (index == 1) {
      setState(() {
        color2 = blackColor;
        color3 = whiteColor;
        color1 = whiteColor;
      });
    } else if (index == 2) {
      setState(() {
        color3 = blackColor;
        color2 = whiteColor;
        color1 = whiteColor;
      });
    }
  }
}
