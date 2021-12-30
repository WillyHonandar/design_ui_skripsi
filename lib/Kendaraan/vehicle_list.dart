import 'package:aplikasi_tilang_training/Kendaraan/vehicle_registration.dart';
import 'package:aplikasi_tilang_training/Model/kendaraan.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/homepage.dart';
import 'package:flutter/material.dart';

class RegisteredVehicles extends StatefulWidget {
  @override
  _RegisteredVehiclesState createState() => _RegisteredVehiclesState();
}

class _RegisteredVehiclesState extends State<RegisteredVehicles> {
  bool hasError = false;
  String currentText = "";

  int totalKendaraan = 0;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController _nomorMesinKendaraanController =
      TextEditingController();

  Widget _buildChild() {
    totalKendaraan = 1;
    if (totalKendaraan != 0) {
      return KendaraanAda();
    } else {
      return KendaraanKosong();
    }
  }

  List<int> list = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return new Container(child: _buildChild());
  }
}

class KendaraanAda extends StatefulWidget {
  @override
  _KendaraanAdaState createState() => _KendaraanAdaState();
}

class _KendaraanAdaState extends State<KendaraanAda> {
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
                      "Halo Alessandro",
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
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 24),
                  height: 400,
                  child: Scrollbar(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 6,
                        padding: EdgeInsets.only(top: 10),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(left: 15),
                            margin: EdgeInsets.only(
                                bottom: 10, left: 10, right: 10),
                            height: 80,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 2.0, color: Colors.blue[800]),
                            ),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Colors.purple),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    SizedBox(
                                      width: 13,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Plat Nomor"),
                                          Text("Nomor Mesin Kendaraan")
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
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
                      "Halo Alessandro",
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
