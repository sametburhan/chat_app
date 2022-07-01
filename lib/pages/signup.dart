import 'package:chat_app/pages/signin.dart';
import 'package:chat_app/structure/accounts.dart';
import 'package:chat_app/structure/constant.dart';
import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
      backgroundColor: whiteColor,
    );
  }

  TextEditingController userInput1 = TextEditingController();
  TextEditingController userInput2 = TextEditingController();
  TextEditingController userInput3 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  late String errorText = "";

  Widget content() {
    var i = -1;
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          child: ClipRect(
            child: Image.asset(
              "assets/Scroll Group 3.png",
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
                      "Hesap Aç",
                      style: TextStyle(color: temaColor, fontSize: 40),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * .01,
                    ),
                    Text(
                      "Yazışmaya Başla",
                      style: TextStyle(color: temaColor, fontSize: 21),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .15,
                ),
                inputName(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .05,
                ),
                inputPassword1(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .05,
                ),
                inputPassword2(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .2,
                ),
                signupButton(i, errorText),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .01,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(_createRoute());
                    },
                    child: Text(
                      "Giriş Yap",
                      style: TextStyle(color: temaColor, fontSize: 17),
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

  Container signupButton(int i, String errorText) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.width * .13,
      decoration: BoxDecoration(
        color: temaColor,
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: temaColor, onPrimary: whiteColor),
          onPressed: () {
            if (_formKey.currentState!.validate()) {}
            if (_formKey2.currentState!.validate()) {}
            if (_formKey3.currentState!.validate()) {}

            if (userInput3.text == userInput2.text &&
                userInput1.text != "" &&
                userInput2.text != "" &&
                userInput3.text != "" &&
                userInput3.text.length >= 8 &&
                userInput1.text.length > 3) {
              i++;
              name.insertAll(i, [userInput1.text]);
              sifre.insertAll(i, [userInput3.text]);
              print(sifre);
              print(name);

              CoolAlert.show(
                context: context,
                type: CoolAlertType.success,
                text: 'Hesap oluşturma başarılı',
                autoCloseDuration: Duration(seconds: 2600),
              );

              Future.delayed(const Duration(milliseconds: 2700), () {
                Navigator.of(context).push(_createRoute());
              });
              Future.delayed(const Duration(milliseconds: 2900), () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Giriş yapınız.")),
                );
              });
              errorText = "";
            }
            if (userInput2.text != userInput3.text) {
              errorText = "Şifreler eşleşmiyor.";
            }
            if (userInput1.text == "") {
              errorText = "Kullanıcı adı boş bırakılamaz.";
            }
            if (userInput1.text.length < 4 && userInput1.text.length > 0) {
              errorText = "Kullanıcı adı 3 karakterden fazla olmalıdır.";
            }
            if (userInput3.text.length < 8) {
              errorText = "Şifre 8 karakterden fazla olmalıdır.";
            }
          },
          child: Text(
            "Hesap Aç",
            style: TextStyle(fontSize: 19, color: whiteColor),
          )),
    );
  }

  Container inputPassword2() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Form(
        key: _formKey,
        child: TextFormField(
          obscureText: true,
          validator: (value) {
            if (value == "") {
              return "Şİfre boş bırakılamaz.";
            } else if (userInput2.text != userInput3.text) {
              return 'Şifreler eşleşmiyor.';
            } else if (userInput3.text.length < 8) {
              return "Şifre 8 karakterden fazla olmalıdır.";
            }
            return null;
          },
          controller: userInput3,
          onSaved: (value) {
            userInput3.text = value.toString();
          },
          style: TextStyle(
            color: temaColor,
          ),
          cursorColor: temaColor,
          keyboardType: TextInputType.visiblePassword,
          decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff6c63ff)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff6c63ff)),
              ),
              labelText: 'Şifre Tekrar',
              labelStyle: TextStyle(
                color: Color(0xff6c63ff),
              )),
        ),
      ),
    );
  }

  Container inputPassword1() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Form(
        key: _formKey2,
        child: TextFormField(
          obscureText: true,
          validator: (value) {
            if (value == "") {
              return 'Şifre boş bırakılamaz.';
            } else if (userInput2.text != userInput3.text) {
              return 'Şifreler eşleşmiyor.';
            } else if (userInput3.text.length < 8) {
              return "Şifre 8 karakterden fazla olmalıdır.";
            }
            return null;
          },
          controller: userInput2,
          onSaved: (value) {
            userInput2.text = value.toString();
          },
          style: TextStyle(
            color: temaColor,
          ),
          cursorColor: temaColor,
          keyboardType: TextInputType.visiblePassword,
          decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff6c63ff)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff6c63ff)),
              ),
              labelText: 'Şifre',
              labelStyle: TextStyle(
                color: Color(0xff6c63ff),
              )),
        ),
      ),
    );
  }

  Container inputName() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Form(
        key: _formKey3,
        child: TextFormField(
          validator: (value) {
            if (value == "") {
              return 'Kullanıcı adı boş bırakılamaz.';
            } else if (userInput1.text.length < 4 &&
                userInput1.text.length > 0) {
              return "Kullanıcı adı 3 karakterden fazla olmalıdır.";
            }
            return null;
          },
          controller: userInput1,
          onSaved: (value) {
            userInput1.text = value.toString();
          },
          style: TextStyle(
            color: temaColor,
          ),
          cursorColor: temaColor,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff6c63ff)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff6c63ff)),
              ),
              labelText: 'Kullanıcı Adı',
              labelStyle: TextStyle(
                color: Color(0xff6c63ff),
              )),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const signIn(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
