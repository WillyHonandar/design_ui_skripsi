import 'package:aplikasi_tilang_training/Model/pelanggaran.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/Pembayaran/Sidang/sukses_lakukan_sidang.dart';
import 'package:aplikasi_tilang_training/runner/main.dart';
import 'package:flutter/material.dart';

class LakukanSidang extends StatefulWidget {
  final int idPelanggaran;
  final String status;
  LakukanSidang(this.status, this.idPelanggaran);
  @override
  State<StatefulWidget> createState() {
    return _LakukanSidangState(this.status, this.idPelanggaran);
  }
}

class _LakukanSidangState extends State<LakukanSidang> {
  int idPelanggaran;
  String status;
  _LakukanSidangState(this.status, this.idPelanggaran);

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
              height: 380,
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
                          child: Column(
                            children: [
                              ListTile(
                                  title:
                                      Text("Langkah-langkah ke persidangan\n"),
                                  subtitle: Text(
                                      '- Login aplikasi BRI Mobile\n'
                                      '- Pilih menu Mobile Banking BRI > Pembayaran > BRIVA\n'
                                      '- Masukkan 15 angka Nomor Pembayaran Tilang\n'
                                      '- Masukkan nominal pembayaran sesuai jumlah denda yang harus dibayarkan, Transaksi akan ditolak jika pembayaran tidak sesuai dengan jumlah denda titipan\n'
                                      '- Masukkan PIN\n'
                                      '- Simpan notifikasi SMS sebagai bukti pembayaran\n'
                                      '- Tunjukkan notifikasi SMS ke penindak untuk ditukarkan dengan barang bukti yang disita\n',
                                      textAlign: TextAlign.justify)),
                            ],
                          ),
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
