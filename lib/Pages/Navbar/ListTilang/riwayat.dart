import 'package:aplikasi_tilang_training/Model/pelanggaran.dart';
import 'package:aplikasi_tilang_training/runner/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

List<Pelanggaran> dataPelanggaran;
int totalRiwayatPelanggaran;

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
            if (totalRiwayatPelanggaran == 0) {
              return RiwayatKosong();
            }
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
      margin: EdgeInsets.only(top: 16, left: 16, right: 16),
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

class RiwayatKosong extends StatefulWidget {
  @override
  _RiwayatKosongState createState() => _RiwayatKosongState();
}

class _RiwayatKosongState extends State<RiwayatKosong> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 36, vertical: 24),
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: Center(
                          child: Icon(
                            Icons.car_rental_sharp,
                            size: 200,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              "Anda belum pernah terindikasi dalam melakukan pelanggaran!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Segera Melakukan Pelanggaran",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ]),
      ),
    );
  }
}

Future<List<Pelanggaran>> getRiwayatPelanggaran() async {
  final response = await client.rpc("getRiwayatPelanggaran",
      params: {'currentUser': FirebaseAuth.instance.currentUser.uid}).execute();

  final dataList = response.data as List;
  return dataList.map((map) => Pelanggaran.fromJson(map)).toList();
}
