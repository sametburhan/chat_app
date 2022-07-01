import 'package:chat_app/structure/tema.dart';
import 'package:flutter/material.dart';

class constantColor extends StatefulWidget {
  const constantColor({Key? key}) : super(key: key);

  @override
  State<constantColor> createState() => _constantColorState();
}

class _constantColorState extends State<constantColor> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Color colorSelectorLight(int sayi2) {
  if (sayi2 == 0) {
    return Color(0xff6c63ff);
  } else if (sayi2 == 1) {
    return Color(0xff9F6CEC);
  } else if (sayi2 == 2) {
    return Color(0xff59a9ad);
  } else if (sayi2 == 3) {
    return Color(0xffF1818A);
  }
  return Color(0xff6c63ff);
}

// ikinci aşamada switch ile bir dark mode eklenecek
Color colorSelectorDark(int sayi3) {
  if (sayi3 == 0) {
    return Color(0xff322B9A);
  } else if (sayi3 == 1) {
    return Color(0xff663AA9);
  } else if (sayi3 == 2) {
    return Color(0xff1E7A7E);
  } else if (sayi3 == 3) {
    return Color(0xffB6575F);
  }
  return Color(0xff322B9A);
}

Color whiteColor = Color(0xfff5f5f5);

Color blackColor = Color(0xff2B353E);

Color greenColor = Color(0xff25a920);

Color redColor = Color(0xffc92222);

late Color temaColor = tema().temaColor;
