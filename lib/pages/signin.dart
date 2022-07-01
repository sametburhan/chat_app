import 'package:chat_app/pages/signup.dart';
import 'package:chat_app/structure/accounts.dart';
import 'package:chat_app/structure/constant.dart';
import 'package:chat_app/structure/pagePicker.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/structure/global.dart' as global;

class signIn extends StatefulWidget {
  const signIn({Key? key}) : super(key: key);

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
      backgroundColor: temaColor,
    );
  }

  TextEditingController userInput4 = TextEditingController();
  TextEditingController userInput5 = TextEditingController();

  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();

  Widget content() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          child: ClipRect(
            child: Image.asset(
              "assets/Scroll Group 2.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * .1,
                ),
                Column(
                  children: [
                    Text(
                      "Giriş Yap",
                      style: TextStyle(color: whiteColor, fontSize: 40),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * .01,
                    ),
                    Text(
                      "Yazışmaya Başla",
                      style: TextStyle(color: whiteColor, fontSize: 21),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .15,
                ),
                inputName(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .1,
                ),
                inputPassword(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .2,
                ),
                signinButton(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .01,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(_createRoute());
                    },
                    child: Text(
                      "Hesap Aç",
                      style: TextStyle(color: whiteColor, fontSize: 17),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .2,
                ),
              ]),
            ),
          ],
        ),
      ],
    );
  }

  Container signinButton() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.width * .13,
      decoration: BoxDecoration(
        color: whiteColor,
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: whiteColor, onPrimary: temaColor),
          onPressed: () {
            if (_formKey4.currentState!.validate()) {}
            if (_formKey5.currentState!.validate()) {}

            if (name.indexOf(userInput4.text) ==
                    sifre.indexOf(userInput5.text) &&
                name.indexOf(userInput4.text) != -1) {
              Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const pagePicker(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return child;
                  }));
              setState(() {
                global.signinTrue = true;
              });
              Future.delayed(const Duration(milliseconds: 200), () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Giriş başarılı.")),
                );
              });
            }
          },
          child: Text(
            "Giriş Yap",
            style: TextStyle(fontSize: 19, color: temaColor),
          )),
    );
  }

  Container inputPassword() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Form(
        key: _formKey5,
        child: TextFormField(
          obscureText: true,
          validator: (value) {
            if (sifre.indexOf(num.tryParse(userInput5.text)) == -1) {
              return "Kullanıcı adı ve şifre eşleşmiyor";
            }
            return null;
          },
          onSaved: (value) {
            setState(() {
              userInput5.text = value.toString();
            });
          },
          controller: userInput5,
          style: TextStyle(
            color: whiteColor,
          ),
          cursorColor: whiteColor,
          keyboardType: TextInputType.visiblePassword,
          decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xfff5f5f5)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xfff5f5f5)),
              ),
              labelText: 'Şifre',
              labelStyle: TextStyle(
                color: Color(0xfff5f5f5),
              )),
        ),
      ),
    );
  }

  Container inputName() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Form(
        key: _formKey4,
        child: TextFormField(
          onSaved: (value) {
            setState(() {
              userInput4.text = value.toString();
            });
          },
          controller: userInput4,
          validator: (value) {
            if (name.indexOf(userInput4.text) == -1) {
              return "Kullanıcı adı ve şifre eşleşmiyor";
            }
            return null;
          },
          style: TextStyle(
            color: whiteColor,
          ),
          cursorColor: whiteColor,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xfff5f5f5)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xfff5f5f5)),
            ),
            labelText: 'Kullanıcı Adı',
            labelStyle: TextStyle(
              color: Color(0xfff5f5f5),
            ),
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const signUp(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
