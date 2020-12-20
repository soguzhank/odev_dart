import 'package:flutter/material.dart';
import 'package:odev/anasayfa.dart';
import 'package:odev/login.dart';
import 'package:odev/sifremiUnuttum.dart';
import 'package:odev/uyeol.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Giriş Yap",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      initialRoute: "home",
      routes: {
        "home": (context) => LoginPage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> veri = settings.name.split("/");
        if (veri[1] == "loginpage") {
          return MaterialPageRoute(builder: (context) => LoginPage());
        } else if (veri[1] == "uyeol") {
          return MaterialPageRoute(builder: (context) => Uyeol());
        } else if (veri[1] == "sifremiunuttum") {
          return MaterialPageRoute(builder: (context) => SifremiUnuttum());
        } else if (veri[1] == "anasayfa") {
          return MaterialPageRoute(builder: (context) => Anasayfa());
        } else {
          return MaterialPageRoute(builder: (context) => LoginPage());
        }
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) => Uyeol());
      },
    );
  }
}
