import 'package:aplikasi_tilang_training/Model/Pelanggaran.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/FlowTilang/Sidang/detail_sidang.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/FlowTilang/konfirmasi_tilang.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/detail_status.dart';
import 'package:aplikasi_tilang_training/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

List<Pelanggaran> dataPelanggaran;
int totalPelanggaran;

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
            if (totalPelanggaran == 0) {
              return ListPelanggaranKosong();
            }
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
  int idPelanggaran = pelanggaran.idPelanggaran;
  String status = pelanggaran.status;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.all(16),
        children: dataPelanggaran
            .map((pelanggaran) => Container(child: Builder(builder: (context) {
                  if (pelanggaran.status == "Pemberitahuan Informasi") {
                    return Card(
                      elevation: 5,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: InkWell(
                          onTap: () {
                            print(pelanggaran.status);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => KonfirmasiTilang(
                                    pelanggaran.status,
                                    pelanggaran.idPelanggaran)));
                          },
                          child: ListTile(
                            leading: Icon(
                              MaterialCommunityIcons.information,
                              size: 60,
                              color: Colors.orange,
                            ),
                            title: Text(
                              "No. Tilang: " + pelanggaran.noTilang,
                              style: TextStyle(fontSize: 14),
                            ),
                            subtitle: Container(
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(16.0),
                                color: Colors.orange,
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
                  } else if (pelanggaran.status == "Segera Lakukan Sidang") {
                    return Card(
                      elevation: 5,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: InkWell(
                          child: ListTile(
                            leading: Icon(
                              MaterialCommunityIcons.clock,
                              size: 60,
                              color: Colors.yellow,
                            ),
                            title: Text(
                              pelanggaran.noTilang,
                              style: TextStyle(fontSize: 14),
                            ),
                            subtitle: Container(
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(16.0),
                                color: Colors.yellow,
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
                  } else if (pelanggaran.status ==
                      "Segera Lakukan Pembayaran") {
                    return Card(
                      elevation: 5,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: InkWell(
                          onTap: () {
                            print(pelanggaran.status);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    //Nanti dipilih berdasarkan index
                                    builder: (context) =>
                                        DetailPembayaranSidang(
                                            pelanggaran.status,
                                            pelanggaran.idPelanggaran)));
                          },
                          child: ListTile(
                            leading: Icon(
                              MaterialCommunityIcons.information,
                              size: 60,
                              color: Colors.orange,
                            ),
                            title: Text(
                              "No. Tilang: " + pelanggaran.noTilang,
                              style: TextStyle(fontSize: 14),
                            ),
                            subtitle: Container(
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(16.0),
                                color: Colors.orange,
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
                  } else if (pelanggaran.status ==
                      "Menunggu Konfirmasi Pembayaran") {
                    return Card(
                      elevation: 5,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: InkWell(
                          child: ListTile(
                            leading: Icon(
                              MaterialCommunityIcons.clock,
                              size: 60,
                              color: Colors.yellow,
                            ),
                            title: Text(
                              "No. Tilang: " + pelanggaran.noTilang,
                              style: TextStyle(fontSize: 14),
                            ),
                            subtitle: Container(
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(16.0),
                                color: Colors.yellow,
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
                  } else if (pelanggaran.status == "Tunggu Email") {
                    return Card(
                      elevation: 5,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: InkWell(
                          child: ListTile(
                            leading: Icon(
                              MaterialCommunityIcons.email_alert,
                              size: 60,
                              color: Colors.yellow,
                            ),
                            title: Text(
                              "No. Tilang: " + pelanggaran.noTilang,
                              style: TextStyle(fontSize: 14),
                            ),
                            subtitle: Container(
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(16.0),
                                color: Colors.yellow,
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
                  } else if (pelanggaran.status ==
                      "Menunggu Konfirmasi Pembayaran Sidang") {
                    return Card(
                      elevation: 5,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: InkWell(
                          child: ListTile(
                            leading: Icon(
                              MaterialCommunityIcons.clock,
                              size: 60,
                              color: Colors.yellow,
                            ),
                            title: Text(
                              "No. Tilang: " + pelanggaran.noTilang,
                              style: TextStyle(fontSize: 14),
                            ),
                            subtitle: Container(
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(16.0),
                                color: Colors.yellow,
                              ),
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Center(
                                //Status di ambil dari database
                                child: Text(pelanggaran.status,
                                    style: TextStyle(fontSize: 9)),
                              ),
                            ),
                            trailing: InkWell(
                              onTap: () {
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
                    return null;
                  }
                })))
            .toList(),
      ),
    );
  }
}

class ListPelanggaranKosong extends StatefulWidget {
  @override
  _ListPelanggaranKosongState createState() => _ListPelanggaranKosongState();
}

class _ListPelanggaranKosongState extends State<ListPelanggaranKosong> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(children: [
              Container(
                child: Center(
                  child: Image(
                    image: AssetImage("assets/icon/list_tilang_kosong.png"),
                    height: 300,
                    width: 300,
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 36, vertical: 24),
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
              ),
            ]),
          ]),
    );
  }
}

Future<List<Pelanggaran>> getListPelanggaran() async {
  final response = await client.rpc("getTilangBerlangsung",
      params: {'currentUser': FirebaseAuth.instance.currentUser.uid}).execute();
  print(pelanggaran.idPelanggaran);
  print(pelanggaran.status);
  final dataList = response.data as List;
  return dataList.map((map) => Pelanggaran.fromJson(map)).toList();
}

Widget status2() {}
