import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/Pembayaran/pembayaran.dart';
import 'package:flutter/material.dart';

class DetailInformasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Detail Informasi", style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Column(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Anda sedang menjalani proses denda tilang, harap simak alur berikut :",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Container(
                  height: 400,
                  child: Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: ListTile(
                                title: Text("KETENTUAN\n"),
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
              ],
            ),
            SizedBox(height: 20),
            Column(
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
                                        '- Struk ATM asli diserahkan ke penindak untuk ditukarkan dengan barang bukti yang disita\n',
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
                    builder: (context) => Pembayaran()));
          },
          color: Colors.blue,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "Selanjutnya",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
