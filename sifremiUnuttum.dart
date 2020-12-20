import "package:flutter/material.dart";

class SifremiUnuttum extends StatefulWidget {
  @override
  _SifremiUnuttumState createState() => _SifremiUnuttumState();
}

class _SifremiUnuttumState extends State<SifremiUnuttum> {
  String emailAddress;

  final _formVal = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Şifremi Unuttum"),
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
                            labelText: "Eposta Adresiniz",
                            border: OutlineInputBorder()),
                        onSaved: (val) {
                          emailAddress = val;
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
                              Navigator.pushNamed(context, "/loginpage");
                            },
                            child: Text("Vazgeç"),
                          ),
                          RaisedButton(
                            onPressed: () {
                              _formVal.currentState.save();
                              debugPrint("Eposta " +
                                  emailAddress +
                                  " adresine gönderildi");
                              Navigator.pushNamed(context, "/loginpage");
                            },
                            child: Text("Giriş"),
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
