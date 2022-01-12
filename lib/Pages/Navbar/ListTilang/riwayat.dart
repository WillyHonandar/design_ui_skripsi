import 'package:aplikasi_tilang_training/Model/pelanggaran.dart';
import 'package:aplikasi_tilang_training/runner/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

List<Pelanggaran> dataPelanggaran;
int totalRiwayatPelanggaran;
String user = FirebaseAuth.instance.currentUser.uid;

class RiwayatTilang extends StatefulWidget {
  @override
  _RiwayatTilangState createState() => _RiwayatTilangState();
}

class _RiwayatTilangState extends State<RiwayatTilang> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: FutureBuilder<List<Pelanggaran>>(
          future: getRiwayatPelanggaran(),
          builder: (context, AsyncSnapshot<List<Pelanggaran>> snapshot) {
            if (snapshot.hasData == false) {
              return Center(child: CircularProgressIndicator());
            }
            dataPelanggaran = snapshot.data;
            totalRiwayatPelanggaran = snapshot.data.length;
            // if (totalPelanggaran == 0) {
            //   return KendaraanKosong();
            // }
            return RiwayatTilangAda();
          }),
    );
  }
}

class RiwayatTilangAda extends StatefulWidget {
  @override
  _RiwayatTilangAdaState createState() => _RiwayatTilangAdaState();
}

class _RiwayatTilangAdaState extends State<RiwayatTilangAda> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24, left: 24, right: 24),
      child: ListView(
        children: dataPelanggaran
            .map((pelanggaran) => Container(
                  // child: InkWell(
                  //   onTap: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             //Nanti dipilih berdasarkan index
                  //             builder: (context) => KonfirmasiTilang()));
                  //   },
                  child: Card(
                    elevation: 5,
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: InkWell(
                        // onTap: () {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           //Nanti dipilih berdasarkan index
                        //           builder: (context) => KonfirmasiTilang()));
                        // },
                        child: ListTile(
                            leading: Icon(
                              Icons.car_rental,
                              size: 50,
                            ),
                            title: Text(
                              pelanggaran.noTilang,
                              style: TextStyle(fontSize: 16),
                            ),
                            subtitle: Container(
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(16.0),
                                color: Colors.green,
                              ),
                              margin: EdgeInsets.only(right: 80, top: 10),
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Center(
                                //Status di ambil dari database
                                child: Text(pelanggaran.status,
                                    style: TextStyle(fontSize: 12)),
                              ),
                            )),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
    // return Container(
    //   child: Container(
    //     margin: EdgeInsets.all(24),
    //     child: ListView.builder(
    //         scrollDirection: Axis.vertical,
    //         itemCount: 5,
    //         itemBuilder: (context, index) {
    //           return Card(
    //             elevation: 8,
    //             child: InkWell(
    //               onTap: () {
    //                 // Navigator.push(
    //                 //     context,
    //                 //     MaterialPageRoute(
    //                 //         builder: (context) => News(
    //                 //               ind: index,
    //                 //             )));
    //               },
    //               splashColor: Colors.blue.withAlpha(30),
    //               child: Column(
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: <Widget>[
    //                   Container(
    //                     margin:
    //                         EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    //                     child: ListTile(
    //                       // leading: Text("Halo"),
    //                       //No referensi di ambil dari db
    //                       title: Text(
    //                         "No Referensi: 123456",
    //                         style: TextStyle(fontSize: 16),
    //                         // textAlign: TextAlign.justify
    //                       ),
    //                       subtitle: Container(
    //                           decoration: new BoxDecoration(
    //                             borderRadius: new BorderRadius.circular(16.0),
    //                             color: Colors.green,
    //                           ),
    //                           margin: EdgeInsets.only(right: 140, top: 10),
    //                           padding: EdgeInsets.symmetric(vertical: 5),
    //                           child: Center(
    //                             //status di ambil dari db
    //                             child: Text(
    //                               "Status: Sudah Bayar",
    //                             ),
    //                           )),
    //                     ),
    //                     // subtitle: Text(newsDesc[index],
    //                     //     textAlign: TextAlign.justify)),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           );
    //         }),
    //   ),
    // );
  }
}

Future<List<Pelanggaran>> getRiwayatPelanggaran() async {
  final response = await client
      .rpc("getRiwayatPelanggaran", params: {'currentUser': user}).execute();

  final dataList = response.data as List;
  return dataList.map((map) => Pelanggaran.fromJson(map)).toList();
}
