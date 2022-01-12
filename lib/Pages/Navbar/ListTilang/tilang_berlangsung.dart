import 'package:aplikasi_tilang_training/Model/pelanggaran.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/Pembayaran/konfirmasi_tilang.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/detail_status.dart';
import 'package:aplikasi_tilang_training/runner/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

List<Pelanggaran> dataPelanggaran;
int totalPelanggaran;
String user = FirebaseAuth.instance.currentUser.uid;

class TilangBerlangsung extends StatefulWidget {
  @override
  _TilangBerlangsungState createState() => _TilangBerlangsungState();
}

class _TilangBerlangsungState extends State<TilangBerlangsung> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: FutureBuilder<List<Pelanggaran>>(
          future: getListPelanggaran(),
          builder: (context, AsyncSnapshot<List<Pelanggaran>> snapshot) {
            if (snapshot.hasData == false) {
              return Center(child: CircularProgressIndicator());
            }
            dataPelanggaran = snapshot.data;
            totalPelanggaran = snapshot.data.length;
            // if (totalPelanggaran == 0) {
            //   return KendaraanKosong();
            // }
            return ListPelanggaranAda();
          }),
    );
  }
}

class ListPelanggaranAda extends StatefulWidget {
  @override
  _ListPelanggaranAdaState createState() => _ListPelanggaranAdaState();
}

class _ListPelanggaranAdaState extends State<ListPelanggaranAda> {
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  //Nanti dipilih berdasarkan index
                                  builder: (context) => KonfirmasiTilang()));
                        },
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
                                color: Colors.yellow,
                              ),
                              margin: EdgeInsets.only(right: 60, top: 10),
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
    //         itemCount: 3,
    //         itemBuilder: (context, index) {
    //           return Card(
    //             elevation: 5,
    //             // child: InkWell(
    //             //
    //             child: Column(
    //               mainAxisSize: MainAxisSize.min,
    //               children: <Widget>[
    //                 Container(
    //                   margin:
    //                       EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    //                   child: InkWell(
    //                     onTap: () {
    //                       Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                               //Nanti dipilih berdasarkan index
    //                               builder: (context) => KonfirmasiTilang()));
    //                     },
    //                     splashColor: Colors.blue.withAlpha(30),
    //                     child: ListTile(
    //                       // leading: Text("Halo"),
    //                       title: Text(
    //                         "No Referensi: 123456",
    //                         style: TextStyle(fontSize: 16),
    //                         // textAlign: TextAlign.justify
    //                       ),
    //                       subtitle: Container(
    //                           decoration: new BoxDecoration(
    //                             borderRadius: new BorderRadius.circular(16.0),
    //                             color: Colors.yellow,
    //                           ),
    //                           margin: EdgeInsets.only(right: 60, top: 10),
    //                           padding: EdgeInsets.symmetric(vertical: 5),
    //                           child: Center(
    //                             //Status di ambil dari database
    //                             child: Text(
    //                               "Status: Pemberitahuan Informasi",
    //                               style: TextStyle(fontSize: 12),
    //                             ),
    //                           )),
    //                       trailing: IconButton(
    //                         icon: new Icon(
    //                           Icons.info,
    //                           size: 35,
    //                         ),
    //                         highlightColor: Colors.pink,
    //                         onPressed: () {
    //                           Navigator.push(
    //                               context,
    //                               MaterialPageRoute(
    //                                   //Nanti dipilih berdasarkan index
    //                                   builder: (context) => StepperPage()));
    //                         },
    //                       ),
    //                     ),
    //                   ),
    //                   // subtitle: Text(newsDesc[index],
    //                   //     textAlign: TextAlign.justify)),
    //                 ),
    //               ],
    //             ),
    //           );
    //         }),
    //   ),
    // );
  }
}

Future<List<Pelanggaran>> getListPelanggaran() async {
  final response = await client
      .rpc("getListPelanggaran", params: {'currentUser': user}).execute();

  final dataList = response.data as List;
  return dataList.map((map) => Pelanggaran.fromJson(map)).toList();
}
