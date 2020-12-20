import "package:flutter/material.dart";

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userName;
  String password;

  final _formVal = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Giriş"),
            ),
            resizeToAvoidBottomPadding: false,
            body: Form(
              key: _formVal,
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Kullanıcı Adı",
                            border: OutlineInputBorder()),
                        onSaved: (val) {
                          userName = val;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Şifre", border: OutlineInputBorder()),
                        onSaved: (val) {
                          password = val;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/sifremiunuttum');
                            },
                            child: Text("Şifremi Unuttum"),
                          ),
                          RaisedButton(
                            onPressed: () {
                              _formVal.currentState.save();
                              if (userName == "demo" && password == "demo") {
                                Navigator.pushNamed(context, '/anasayfa');
                              } else {
                                debugPrint(
                                    "Hatalı kullanıcı bilgisi. Kullanıcı Adı ve şifre değerlerini \"demo\" olarak giriniz.");
                              }
                            },
                            child: Text("Giriş"),
                            highlightColor: Colors.blue,
                            color: Colors.lightBlueAccent,
                            textColor: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/uyeol');
                            },
                            child: Text("Üye Ol"),
                            highlightColor: Colors.indigo,
                            color: Colors.indigo,
                            textColor: Colors.white,
                          ))
                    ],
                  )),
            )));
  }
}
