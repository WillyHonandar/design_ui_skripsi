import 'package:aplikasi_tilang_training/Model/pelanggaran.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/Pembayaran/Sidang/sukses_lakukan_sidang.dart';
import 'package:aplikasi_tilang_training/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailSidang extends StatefulWidget {
  final int idPelanggaran;
  final String status;
  DetailSidang(this.status, this.idPelanggaran);
  @override
  State<StatefulWidget> createState() {
    return _DetailSidangState(this.status, this.idPelanggaran);
  }
}

class _DetailSidangState extends State<DetailSidang> {
  int idPelanggaran;
  String status;
  _DetailSidangState(this.status, this.idPelanggaran);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title:
            Text("Detail Persidangan", style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mohon membaca alur berikut berikut :",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              height: 400,
              child: Card(
                child: SingleChildScrollView(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: ListTile(
                              title: Text("Alur Sidang\n"),
                              subtitle: Text(
                                  '1.Datang ke pengadilan negeri setempat sesuai jadwal yang telah ditentukan.\n\n'
                                  '2.Mengambil nomor antrian sidang dan menunggu waktu sidangnya.\n\n'
                                  '3.Mengikuti sidang, hakim akan membacakan pelanggaran sesuai urutannya. \n\n'
                                  '4.Pelanggar diminta menjawab pertanyaan dari hakim.\n\n'
                                  '5.Jika terbukti bersalah, pelanggar diwajibkan membayar denda di kasir pengadilan.\n\n'
                                  '6.Mengambil STNK atau SIM yang disita polisi.',
                                  textAlign: TextAlign.justify)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
            printidPelanggaran(idPelanggaran);
            updateStatus(idPelanggaran, 2);
            Fluttertoast.showToast(msg: "Sukses memilih alur sidang!");
            Navigator.push(
                context,
                MaterialPageRoute(
                    //Nanti dipilih berdasarkan index
                    builder: (context) => SuksesLakukanSidang()));
          },
          color: Colors.blue,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "Lanjut",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

updateStatus(int idPelanggaran, int idStatus) async {
  print("ini id nya di bawah");
  print(idPelanggaran);
  var response = client
      .from("m_pelanggaran")
      .update({'idStatus': idStatus})
      .eq('idPelanggaran', idPelanggaran)
      .execute();
  print(response);
}

printidPelanggaran(int idPelanggaran) {
  print(idPelanggaran);
}
