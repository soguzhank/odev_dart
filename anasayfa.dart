import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

List<int> KirmiziKutuluSayilar = new List<int>();

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    var ekranBoyutu = MediaQuery.of(context).size;

    final double yukseklik =
        (ekranBoyutu.height - MediaQuery.of(context).padding.top) / 5;
    final double genislik = ekranBoyutu.width / 4;

    final String ogrNo = "192855077";

    int ogrNoToplam = 0;
    for (int i = 0; i < ogrNo.length; i++) {
      if (!KirmiziKutuluSayilar.contains(int.parse(ogrNo[i]))) {
        KirmiziKutuluSayilar.add(int.parse(ogrNo[i]));
      }
      ogrNoToplam += int.parse(ogrNo[i]);
    }
    if (ogrNoToplam % 20 < 10) {
      int modu = (ogrNoToplam % 20 + 10).round();
      KirmiziKutuluSayilar.add(modu);
      KirmiziKutuluSayilar.add(modu + 1);
      KirmiziKutuluSayilar.add(modu - 1);
      debugPrint(ogrNoToplam.toString() +
          "--" +
          (ogrNoToplam % 20 + 10).toString() +
          " -- " +
          (modu).toString());
      debugPrint("+" + (modu + 1).toString());
      debugPrint("-" + (modu - 1).toString());
    }

    List<int> sayilar = new List<int>();
    for (int i = 1; i <= 20; i++) {
      sayilar.add(i);
    }

    return MaterialApp(
        home: Scaffold(
            body: new GridView.count(
                crossAxisCount: 4,
                childAspectRatio: (genislik / yukseklik),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: sayilar.map((int value) {
                  return new Stack(
                    children: <Widget>[
                      Container(
                        color: renk(value),
                        width: genislik / 1,
                        height: yukseklik / 1,
                        alignment: konumbul(value),
                      ),
                      Container(
                        width: genislik / 1,
                        height: yukseklik / 1,
                        alignment: Alignment.bottomRight,
                        child: Text(
                          value.toString(),
                          style:
                              new TextStyle(fontSize: 20, color: Colors.green),
                        ),
                      ),
                    ],
                  );
                }).toList())));
  }
}

bool kirmiziSayilar(int value) {
  if (KirmiziKutuluSayilar.contains(value)) {
    return true;
  } else {
    return false;
  }
}

Alignment konumbul(int value) {
  if (kirmiziSayilar(value) == true) {
    return Alignment.bottomLeft;
  } else {
    return Alignment.centerLeft;
  }
}

Color renk(int value) {
  if (kirmiziSayilar(value) == true) {
    return Colors.red;
  } else {
    return Colors.white;
  }
}

// Container ekle() {
//   return Container(
//     color: Color(6600),
//   );
// }
