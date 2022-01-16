import 'package:aplikasi_tilang_training/Kendaraan/vehicle_registration.dart';
import 'package:aplikasi_tilang_training/Model/kendaraan.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/homepage.dart';
import 'package:aplikasi_tilang_training/runner/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisteredVehicles extends StatefulWidget {
  @override

  // final String displayName = FirebaseAuth.instance.currentUser.displayName;

  _RegisteredVehiclesState createState() => _RegisteredVehiclesState();
}

class _RegisteredVehiclesState extends State<RegisteredVehicles> {
  List<int> list = [1, 2, 3, 4, 5];
  String user = FirebaseAuth.instance.currentUser.uid;
  int totalKendaraan = 0;
  //lempar data

  List<Kendaraan> dataKendaraan;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: FutureBuilder<List<Kendaraan>>(
          future: getKendaraan(user),
          builder: (context, AsyncSnapshot<List<Kendaraan>> snapshot) {
            if (snapshot.hasData == false) {
              return Center(child: CircularProgressIndicator());
            }
            dataKendaraan = snapshot.data;
            totalKendaraan = snapshot.data.length;
            if (totalKendaraan == 0) {
              return KendaraanKosong();
            }
            return KendaraanAda(dataKendaraan: dataKendaraan);
          }),
    );
  }
}

class KendaraanAda extends StatefulWidget {
  final List<Kendaraan> dataKendaraan;

  KendaraanAda({this.dataKendaraan});

  @override
  _KendaraanAdaState createState() =>
      _KendaraanAdaState(dataKendaraan: dataKendaraan);
}

class _KendaraanAdaState extends State<KendaraanAda> {
  List<Kendaraan> dataKendaraan;

  _KendaraanAdaState({this.dataKendaraan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("List Kendaraan"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FirebaseAuth.instance.currentUser.displayName,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "Anda Memiliki total .. kendaraan!",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 24),
                      child: Column(
                        children: dataKendaraan
                            .map((kendaraan) => Container(
                                  child: Builder(builder: (context) {
                                    if (kendaraan.jenisKendaraan == "Mobil") {
                                      return Card(
                                        child: ListTile(
                                          leading: Icon(
                                            MaterialCommunityIcons.car,
                                            size: 50,
                                            color: Colors.black,
                                          ),
                                          title: Text(kendaraan.noPlat),
                                          subtitle: Text(kendaraan.noMesin),
                                          trailing: InkWell(
                                              onTap: () {
                                                deleteKendaraan(
                                                        kendaraan.idKendaraan)
                                                    .then((value) {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          //Nanti dipilih berdasarkan index
                                                          builder: (context) =>
                                                              RegisteredVehicles()));
                                                  // Fluttertoast.showToast(
                                                  //     msg:
                                                  //         "Sukses Menghapus Kendaraan!");
                                                  // setState(() {});
                                                });

                                                // setState(() {});
                                              },
                                              // onTap: () => deleteKendaraan(
                                              //     kendaraan.idKendaraan),
                                              // Fluttertoast.showToast(
                                              //     msg: "Sukses Hapus Kendaraan!");

                                              // onTap: () => deleteKendaraan(
                                              //     kendaraan.idKendaraan),
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              )),
                                        ),
                                      );
                                    } else {
                                      return Card(
                                        child: ListTile(
                                          leading: Icon(
                                            MaterialCommunityIcons.motorbike,
                                            size: 50,
                                            color: Colors.black,
                                          ),
                                          title: Text(kendaraan.noPlat),
                                          subtitle: Text(kendaraan.noMesin),
                                          trailing: InkWell(
                                              onTap: () {
                                                deleteKendaraan(
                                                        kendaraan.idKendaraan)
                                                    .then((value) {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          //Nanti dipilih berdasarkan index
                                                          builder: (context) =>
                                                              RegisteredVehicles()));
                                                  // Fluttertoast.showToast(
                                                  //     msg:
                                                  //         "Sukses Menghapus Kendaraan!");
                                                  // setState(() {});
                                                });

                                                // setState(() {});
                                              },
                                              // onTap: () => deleteKendaraan(
                                              //     kendaraan.idKendaraan),
                                              // Fluttertoast.showToast(
                                              //     msg: "Sukses Hapus Kendaraan!");

                                              // onTap: () => deleteKendaraan(
                                              //     kendaraan.idKendaraan),
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              )),
                                        ),
                                      );
                                    }
                                  }),
                                ))
                            .toList(),
                      ),
                      // child: Scrollbar(
                      //   child: ListView.builder(
                      //       scrollDirection: Axis.vertical,
                      //       itemCount: totalKendaraan,
                      //       padding: EdgeInsets.only(top: 10),
                      //       itemBuilder: (context, index) {
                      //         return Container(
                      //           padding: EdgeInsets.only(left: 15),
                      //           margin: EdgeInsets.only(
                      //               bottom: 10, left: 10, right: 10),
                      //           height: 80,
                      //           width: 300,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(5),
                      //             border: Border.all(
                      //                 width: 2.0, color: Colors.blue[800]),
                      //           ),
                      //           child: Row(
                      //             children: [
                      //               Row(
                      //                 children: [
                      //                   Container(
                      //                     height: 60,
                      //                     width: 60,
                      //                     decoration: BoxDecoration(
                      //                         border: Border.all(
                      //                             width: 1, color: Colors.purple),
                      //                         color: Colors.white,
                      //                         borderRadius:
                      //                             BorderRadius.circular(10)),
                      //                   ),
                      //                   SizedBox(
                      //                     width: 13,
                      //                   ),
                      //                   Container(
                      //                     padding: EdgeInsets.only(top: 20),
                      //                     child: Column(
                      //                       mainAxisAlignment:
                      //                           MainAxisAlignment.start,
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children:
                      //                     ),
                      //                   )
                      //                 ],
                      //               )
                      //             ],
                      //           ),
                      //         );
                      //       }),
                      // ),
                    ),
                  ],
                ),
              ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.0),
        child: MaterialButton(
          minWidth: double.infinity,
          height: 60,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    //Nanti dipilih berdasarkan index
                    builder: (context) => RegisKendaraan()));
          },
          color: Colors.blue,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "Tambah Kendaraan +",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class KendaraanKosong extends StatefulWidget {
  @override
  _KendaraanKosongState createState() => _KendaraanKosongState();
}

class _KendaraanKosongState extends State<KendaraanKosong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("List Kendaraan"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FirebaseAuth.instance.currentUser.displayName,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "Anda Memiliki total 0 kendaraan!",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: ListView(
                      shrinkWrap: true,
                      padding:
                          EdgeInsets.symmetric(horizontal: 36, vertical: 24),
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 16),
                          child: Center(
                            child: Icon(
                              Icons.car_rental_sharp,
                              size: 200,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: Text(
                            "Anda belum mendaftarkan kendaraan, segera daftar sekarang juga!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ]),
                ),
              ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.0),
        child: MaterialButton(
          minWidth: double.infinity,
          height: 60,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    //Nanti dipilih berdasarkan index
                    builder: (context) => RegisKendaraan()));
          },
          color: Colors.blue,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "Tambah Kendaraan +",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// Future<List<Kendaraan>> getKendaraan() async {
//   final response = await client
//       .from('m_kendaraan')
//       .select('noPlat, noMesin')
//       // .order('nameUser', ascending: true)
//       .execute();

//   final dataList = response.data as List;
//   return dataList.map((map) => Kendaraan.fromJson(map)).toList();
// }

Future<List<Kendaraan>> getKendaraan(String user) async {
  final response =
      await client.rpc("getKendaraan", params: {'currentUser': user}).execute();

  final dataList = response.data as List;
  return dataList.map((map) => Kendaraan.fromJson(map)).toList();
}

Future deleteKendaraan(int idKendaraan) async {
  var response = await client
      .from("m_kendaraan")
      .delete()
      .eq('idKendaraan', idKendaraan)
      .execute();
  if (response.error == null) {
    Fluttertoast.showToast(msg: "Sukses Menghapus Kendaraan!");
  } else {
    Fluttertoast.showToast(
        msg:
            "Gagal Menghapus Kendaraan! Kendaraan anda masih dalam proses tilang!");
  }
  print(response.error);
}
