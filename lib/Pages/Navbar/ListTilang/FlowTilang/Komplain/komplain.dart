import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/FlowTilang/Komplain/sukses_komplain.dart';
import 'package:aplikasi_tilang_training/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Komplain extends StatefulWidget {
  final String status;
  final int idPelanggaran;

  Komplain(this.status, this.idPelanggaran);

  @override
  State<StatefulWidget> createState() {
    return _KomplainState(this.status, this.idPelanggaran);
  }
}

class _KomplainState extends State<Komplain> {
  final TextEditingController _alasanBukanController = TextEditingController();
  String status;
  int idPelanggaran;

  _KomplainState(this.status, this.idPelanggaran);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Komplain", style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Stack(
          children: [
            ListView(
              children: [
                //Buat isi nomor, platKendaraan, dan mesinKendaraan dari db
                Text(
                  "Berikan Alasan Anda:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _alasanBukanController,
                  maxLines: 16,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    hintText: 'Alasan anda...',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.0),
        child: MaterialButton(
          minWidth: double.infinity,
          height: 60,
          onPressed: () {
            if (_alasanBukanController.text == "") {
              Fluttertoast.showToast(
                  msg: "Komplain tidak boleh kosong, harap di isi!");
            } else {
              addAlasanBukan(idPelanggaran, _alasanBukanController.text);
              updateStatus(idPelanggaran, 7);
              // updateStatus(idPelanggaran, idStatus)
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         //Nanti dipilih berdasarkan index
              //         builder: (context) => SuksesBukanKendaraan()));

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SuksesBukanKendaraan()),
                  (route) => false);
              Fluttertoast.showToast(msg: "Berhasil mengirim komplain!");
            }
          },
          color: Colors.blue,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "Kirim",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

addAlasanBukan(int idPelanggaran, String alasanBukan) async {
  try {
    print(idPelanggaran);

    print(alasanBukan);

    var response = await client.from("m_komplain").insert({
      'idPelanggaran': idPelanggaran,
      'alasanBukan': alasanBukan,
    }).execute();
    print("sudah benar");
  } catch (e) {
    print("ini Error" + e);
  }
}

updateStatus(int idPelanggaran, int idStatus) async {
  var response = client
      .from("m_pelanggaran")
      .update({'idStatus': idStatus})
      .eq('idPelanggaran', idPelanggaran)
      .execute();
  print(response);
}
