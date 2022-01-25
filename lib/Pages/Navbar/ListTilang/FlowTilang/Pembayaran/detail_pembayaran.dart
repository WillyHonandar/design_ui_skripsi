import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/FlowTilang/Pembayaran/sukses_melakukan_pembayaran.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/FlowTilang/Pembayaran/upload_bukti_pembayaran.dart';
import 'package:flutter/material.dart';

class DetailPembayaran extends StatelessWidget {
  final int idPelanggaran;
  final String status;
  DetailPembayaran(this.status, this.idPelanggaran);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Detail Pembayaran", style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Anda diharuskan untuk melanjutkan ke tahap pembayaran dengan petunjuk sebagai berikut :",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                height: 660,
                child: Card(
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
                                      Text("1. Melalui Mobile Banking BRI\n"),
                                  subtitle: Text(
                                      '- Login aplikasi BRI Mobile\n'
                                      '- Pilih menu Mobile Banking BRI > Pembayaran > BRIVA\n'
                                      '- Masukkan 15 angka Nomor Pembayaran Tilang\n'
                                      '- Masukkan nominal pembayaran sesuai jumlah denda yang harus dibayarkan, Transaksi akan ditolak jika pembayaran tidak sesuai dengan jumlah denda titipan\n'
                                      '- Masukkan PIN\n'
                                      '- Simpan notifikasi SMS sebagai bukti pembayaran\n'
                                      '- Tunjukkan notifikasi SMS ke penindak untuk ditukarkan dengan barang bukti yang disita\n',
                                      textAlign: TextAlign.justify)),
                              ListTile(
                                  title: Text("2. Melalui ATM BRI\n"),
                                  subtitle: Text(
                                      '- Masukkan Kartu Debit BRI dan PIN Anda\n'
                                      '- Pilih menu Transaksi Lain > Pembayaran > Lainnya > BRIVA\n'
                                      '- Masukkan 15 angka Nomor Pembayaran Tilang\n'
                                      '- Di halaman konfirmasi, pastikan detil pembayaran sudah sesuai seperti Nomor BRIVA, Nama Pelanggar dan Jumlah Pembayaran\n'
                                      '- Ikuti instruksi untuk menyelesaikan transaksi\n'
                                      '- Copy struk ATM sebagai bukti pembayaran yang sah dan disimpan\n'
                                      '- Struk ATM asli diserahkan ke penindak untuk ditukarkan dengan barang bukti yang disita',
                                      textAlign: TextAlign.justify)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.0),
        child: MaterialButton(
          minWidth: double.infinity,
          height: 60,
          onPressed: () {
            print(status);
            print(idPelanggaran);
            Navigator.push(
                context,
                MaterialPageRoute(
                    //Nanti dipilih berdasarkan index
                    builder: (context) =>
                        UploadBuktiPembayaran(status, idPelanggaran)));
          },
          color: Colors.blue,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "Lanjutkan ke pembayaran",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
