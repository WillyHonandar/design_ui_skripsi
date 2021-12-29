import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/Pembayaran/konfirmasi_tilang.dart';
import 'package:flutter/material.dart';

class TilangBerlangsung extends StatefulWidget {
  @override
  _TilangBerlangsungState createState() => _TilangBerlangsungState();
}

class _TilangBerlangsungState extends State<TilangBerlangsung> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            //Nanti dipilih berdasarkan index
                            builder: (context) => KonfirmasiTilang()));
                  },
                  splashColor: Colors.blue.withAlpha(30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: ListTile(
                          // leading: Text("Halo"),
                          title: Text(
                            "No Referensi: 123456",
                            style: TextStyle(fontSize: 16),
                            // textAlign: TextAlign.justify
                          ),
                          subtitle: Container(
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(16.0),
                                color: Colors.yellow,
                              ),
                              margin: EdgeInsets.only(right: 60, top: 10),
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Center(
                                //Status di ambil dari database
                                child: Text(
                                  "Status: Pemberitahuan Informasi",
                                ),
                              )),
                        ),
                        // subtitle: Text(newsDesc[index],
                        //     textAlign: TextAlign.justify)),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
