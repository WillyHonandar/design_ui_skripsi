import 'package:aplikasi_tilang_training/Model/pelanggaran.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/detail_status.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/stepper.dart';
import 'package:aplikasi_tilang_training/runner/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

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
      child: ListView(
        padding: EdgeInsets.all(16),
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
                  child: Builder(builder: (context) {
                    if (pelanggaran.status == "Email telah dikirim") {
                      return Card(
                        elevation: 5,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: InkWell(
                            // onTap: () {
                            //   // Navigator.push(
                            //   //     context,
                            //   //     MaterialPageRoute(
                            //   //         //Nanti dipilih berdasarkan index
                            //   //         builder: (context) => KonfirmasiTilang()));
                            // },
                            child: ListTile(
                              leading: Icon(MaterialCommunityIcons.email_check,
                                  size: 60, color: Colors.green),
                              title: Text(
                                "No. Tilang: " + pelanggaran.noTilang,
                                style: TextStyle(fontSize: 14),
                              ),
                              subtitle: Container(
                                decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.circular(16.0),
                                  color: Colors.green,
                                ),
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Center(
                                  //Status di ambil dari database
                                  child: Text(pelanggaran.status,
                                      style: TextStyle(fontSize: 10)),
                                ),
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => StepperPage(
                                  //         pelanggaran.status,
                                  //         pelanggaran.idPelanggaran)));
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DetailStatus(
                                          pelanggaran.status,
                                          pelanggaran.idPelanggaran)));
                                },
                                child: Icon(
                                    MaterialCommunityIcons.information_variant),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else if (pelanggaran.status == "Pembayaran di tolak") {
                      return Card(
                        elevation: 5,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: InkWell(
                            // onTap: () {
                            //   // Navigator.push(
                            //   //     context,
                            //   //     MaterialPageRoute(
                            //   //         //Nanti dipilih berdasarkan index
                            //   //         builder: (context) => KonfirmasiTilang()));
                            // },
                            child: ListTile(
                              leading: Icon(MaterialCommunityIcons.close_box,
                                  size: 60, color: Colors.red),
                              title: Text(
                                "No. Tilang: " + pelanggaran.noTilang,
                                style: TextStyle(fontSize: 14),
                              ),
                              subtitle: Container(
                                decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.circular(16.0),
                                  color: Colors.red,
                                ),
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Center(
                                  //Status di ambil dari database
                                  child: Text(pelanggaran.status,
                                      style: TextStyle(fontSize: 10)),
                                ),
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => StepperPage(
                                  //         pelanggaran.status,
                                  //         pelanggaran.idPelanggaran)));
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DetailStatus(
                                          pelanggaran.status,
                                          pelanggaran.idPelanggaran)));
                                },
                                child: Icon(
                                    MaterialCommunityIcons.information_variant),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else if (pelanggaran.status == "Selesai") {
                      return Card(
                        elevation: 5,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: InkWell(
                            // onTap: () {
                            //   // Navigator.push(
                            //   //     context,
                            //   //     MaterialPageRoute(
                            //   //         //Nanti dipilih berdasarkan index
                            //   //         builder: (context) => KonfirmasiTilang()));
                            // },
                            child: ListTile(
                              leading: Icon(MaterialCommunityIcons.check_bold,
                                  size: 60, color: Colors.green),
                              title: Text(
                                "No. Tilang: " + pelanggaran.noTilang,
                                style: TextStyle(fontSize: 14),
                              ),
                              subtitle: Container(
                                decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.circular(16.0),
                                  color: Colors.green,
                                ),
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Center(
                                  //Status di ambil dari database
                                  child: Text(pelanggaran.status,
                                      style: TextStyle(fontSize: 10)),
                                ),
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => StepperPage(
                                  //         pelanggaran.status,
                                  //         pelanggaran.idPelanggaran)));
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DetailStatus(
                                          pelanggaran.status,
                                          pelanggaran.idPelanggaran)));
                                },
                                child: Icon(
                                    MaterialCommunityIcons.information_variant),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Card();
                    }
                  }),
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
                          child: Image(
                            image: AssetImage(
                                "assets/icon/list_tilang_kosong.png"),
                            height: 300,
                            width: 300,
                          ),
                        ),
                      ),
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
                              "Tetap patuhi peraturan lalu lintas saat mengemudi/berkendara",
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
