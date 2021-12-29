import 'package:flutter/material.dart';

class RiwayatTilang extends StatefulWidget {
  @override
  _RiwayatTilangState createState() => _RiwayatTilangState();
}

class _RiwayatTilangState extends State<RiwayatTilang> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.all(24),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                elevation: 8,
                child: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => News(
                    //               ind: index,
                    //             )));
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
                          //No referensi di ambil dari db
                          title: Text(
                            "No Referensi: 123456",
                            style: TextStyle(fontSize: 16),
                            // textAlign: TextAlign.justify
                          ),
                          subtitle: Container(
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(16.0),
                                color: Colors.green,
                              ),
                              margin: EdgeInsets.only(right: 140, top: 10),
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Center(
                                //status di ambil dari db
                                child: Text(
                                  "Status: Sudah Bayar",
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
