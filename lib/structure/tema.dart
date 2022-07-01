import 'package:chat_app/structure/constant.dart';
import 'package:flutter/material.dart';

class tema extends StatefulWidget {
  late Color temaColor = Color(0xff6c63ff);
  @override
  State<tema> createState() => _temaState();
}

class _temaState extends State<tema> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Temalar",
          ),
          Divider(color: temaColor, thickness: 2, endIndent: 20, indent: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          topLeft: Radius.circular(30)), // <-- Radius
                    ),
                    maximumSize: Size(90, 60),
                    primary: colorSelectorLight(0),
                  ),
                  onPressed: () {
                    setState(() {
                      indexer(1);
                    });
                  },
                  child: Center(
                    child: Icon(
                      Icons.circle_outlined,
                      color: whiteColor,
                    ),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            topLeft: Radius.circular(0)), // <-- Radius
                      ),
                      maximumSize: Size(90, 60),
                      primary: colorSelectorLight(1)),
                  onPressed: () {
                    setState(() {
                      indexer(2);
                    });
                  },
                  child: Center(
                    child: Icon(
                      Icons.circle_outlined,
                      color: whiteColor,
                    ),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            topLeft: Radius.circular(0)), // <-- Radius
                      ),
                      maximumSize: Size(90, 60),
                      primary: colorSelectorLight(2)),
                  onPressed: () {
                    setState(() {
                      indexer(3);
                    });
                  },
                  child: Center(
                    child: Icon(
                      Icons.circle_outlined,
                      color: whiteColor,
                    ),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            topRight: Radius.circular(30)), // <-- Radius
                      ),
                      maximumSize: Size(90, 60),
                      primary: colorSelectorLight(3)),
                  onPressed: () {
                    setState(() {
                      indexer(4);
                    });
                  },
                  child: Center(
                    child: Icon(
                      Icons.circle_outlined,
                      color: whiteColor,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  void indexer(int i) {
    if (i == 1) {
      setState(() {
        temaColor = Color(0xff6c63ff);
      });
    } else if (i == 2) {
      setState(() {
        temaColor = Color(0xff9F6CEC);
      });
    } else if (i == 3) {
      setState(() {
        temaColor = Color(0xff59a9ad);
      });
    } else if (i == 4) {
      setState(() {
        temaColor = Color(0xffF1818A);
      });
    }
    return null;
  }
}
