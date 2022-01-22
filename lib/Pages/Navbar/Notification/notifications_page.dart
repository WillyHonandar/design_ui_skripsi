import 'package:aplikasi_tilang_training/Model/notification.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/Pembayaran/konfirmasi_tilang.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/Pembayaran/pembayaran.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/tilang_berlangsung.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/homepage.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/list_tilang.dart';
import 'package:aplikasi_tilang_training/runner/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class NotificationsList extends StatefulWidget {
  @override
  _NotificationsListState createState() => _NotificationsListState();
}

class _NotificationsListState extends State<NotificationsList> {
  String user = FirebaseAuth.instance.currentUser.uid;
  List<Notifikasi> dataNotifikasi;
  int totalNotifikasi;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Notifikasi", style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      ),
      body: FutureBuilder<List<Notifikasi>>(
          future: getNotifikasi(user),
          builder: (context, AsyncSnapshot<List<Notifikasi>> snapshot) {
            if (snapshot.hasData == false) {
              return Center(child: CircularProgressIndicator());
            }
            dataNotifikasi = snapshot.data;
            totalNotifikasi = snapshot.data.length;
            if (totalNotifikasi == 0) {
              return Container();
            }
            return Builder(builder: (context) {
              return Container(
                child: ListView(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                    children: dataNotifikasi
                        .map((notifikasi) => Container(
                              child: Builder(builder: (context) {
                                if (notifikasi.statusNotifikasi ==
                                    "Belum dibuka") {
                                  return Card(
                                    color: Colors.amber,
                                    child: ListTile(
                                      leading:
                                          Icon(Icons.notifications_outlined),
                                      title: Text(notifikasi.jenisNotifikasi),
                                      subtitle:
                                          Text(notifikasi.dekripsiNotifikasi),
                                      onTap: () {
                                        if (notifikasi.status ==
                                            "Pemberitahuan Informasi") {
                                          updateStatusNotifikasi(
                                              notifikasi.idNotifikasi, 1);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  //Nanti dipilih berdasarkan index
                                                  builder: (context) =>
                                                      KonfirmasiPelanggaran(
                                                          notifikasi.status,
                                                          notifikasi
                                                              .idPelanggaran)));
                                        } else if (notifikasi.status ==
                                            "Segera Lakukan Pembayaran") {
                                          updateStatusNotifikasi(
                                              notifikasi.idNotifikasi, 1);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  //Nanti dipilih berdasarkan index
                                                  builder: (context) =>
                                                      Pembayaran(
                                                          notifikasi.status,
                                                          notifikasi
                                                              .idPelanggaran)));
                                        }
                                      },
                                    ),
                                  );
                                } else if (notifikasi.statusNotifikasi ==
                                    "Sudah dibuka") {
                                  return Card(
                                    child: ListTile(
                                      leading:
                                          Icon(Icons.notifications_outlined),
                                      title: Text(notifikasi.jenisNotifikasi),
                                      subtitle:
                                          Text(notifikasi.dekripsiNotifikasi),
                                      // onTap: () {},
                                    ),
                                  );
                                }
                                return null;
                              }),
                            ))
                        .toList()),
              );
            });
          }),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     iconTheme: IconThemeData(color: Colors.black),
    //     title: Text("Notifications", style: TextStyle(color: Colors.black)),
    //     backgroundColor: Color.fromRGBO(245, 245, 245, 1),
    //   ),
    //   body:
    // );
  }
}

class NotifikasiAda extends StatefulWidget {
  final List<Notifikasi> dataNotifikasi;

  NotifikasiAda({this.dataNotifikasi});

  @override
  _NotifikasiAdaState createState() =>
      _NotifikasiAdaState(dataNotifikasi: dataNotifikasi);
}

class _NotifikasiAdaState extends State<NotifikasiAda> {
  List<Notifikasi> dataNotifikasi;

  _NotifikasiAdaState({this.dataNotifikasi});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("List Kendaraan"),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Container(
          child: ListView(
              children: dataNotifikasi
                  .map((notifikasi) => Container(
                        child: ListTile(
                          title: Text(notifikasi.jenisNotifikasi),
                          subtitle: Text(notifikasi.dekripsiNotifikasi),
                        ),
                      ))
                  .toList()),
        )));
  }
}

Future<List<Notifikasi>> getNotifikasi(String user) async {
  final response = await client
      .rpc("getListNotifikasi", params: {'currentUser': user}).execute();

  final dataList = response.data as List;
  print(dataList);
  return dataList.map((map) => Notifikasi.fromJson(map)).toList();
}

updateStatusNotifikasi(int idNotifikasi, int idStatusNotifikasi) async {
  var response = client
      .from("m_notifikasi")
      .update({'idStatusNotifikasi': idStatusNotifikasi})
      .eq('idNotifikasi', idNotifikasi)
      .execute();
  print(response);
}
