import 'package:flutter/material.dart';

// class uyeol extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Uye Ol"),
//       ),
//       body: Container(),
//     );
//   }
// }

// import 'package:flutter/material.dart';

class Uyeol extends StatelessWidget {
  String userName;
  String password;
  String password2;
  String nameSurname;

  final _formVal = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Üye Ol"),
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
                            labelText: "Adınız Soyadınız",
                            border: OutlineInputBorder()),
                        onSaved: (val) {
                          nameSurname = val;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
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
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Şifre (Tekrar)",
                            border: OutlineInputBorder()),
                        onSaved: (val) {
                          password2 = val;
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
                              Navigator.pushNamed(context, "/LoginPage");
                            },
                            child: Text("Vageç"),
                          ),
                          RaisedButton(
                            onPressed: () {
                              //Navigator.pushNamed(context, "/detay/baslik/id");
                              _formVal.currentState.save();
                              if (password != password2) {
                                showDialog(
                                    context: context,
                                    child: new AlertDialog(
                                      title: new Text("Hata"),
                                      content: new Text(
                                          "Girdiğiniz şifreler birbirinden farklı"),
                                    ));
                              } else {
                                debugPrint(userName +
                                    " " +
                                    nameSurname +
                                    " " +
                                    password);
                                Navigator.pushNamed(context, "/LoginPage");
                              }
                            },
                            child: Text("Kaydet"),
                            highlightColor: Colors.blue,
                            color: Colors.lightBlueAccent,
                            textColor: Colors.white,
                          )
                        ],
                      ),
                    ],
                  )),
            )));
  }
}
