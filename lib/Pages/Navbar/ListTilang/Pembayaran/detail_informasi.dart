import 'package:aplikasi_tilang_training/Model/pelanggaran.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/Pembayaran/Sidang/lakukan_sidang.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/Pembayaran/pembayaran.dart';
import 'package:aplikasi_tilang_training/main.dart';
import 'package:flutter/material.dart';

class DetailInformasi extends StatefulWidget {
  final int idPelanggaran;
  final String jumlahPembayaran, status;
  DetailInformasi(this.jumlahPembayaran, this.status, this.idPelanggaran);

  @override
  State<StatefulWidget> createState() {
    return _DetailInformasiState(
        this.jumlahPembayaran, this.status, this.idPelanggaran);
  }
}

class _DetailInformasiState extends State<DetailInformasi> {
  int idPelanggaran;
  String status, jumlahPembayaran;
  _DetailInformasiState(this.jumlahPembayaran, this.status, this.idPelanggaran);
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
                  height: 300,
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
                                    title: Text("Langsung Bayar\n"),
                                    subtitle: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'Anda akan membayar tagihan sebesar: ',
                                            textAlign: TextAlign.justify),
                                        Text(
                                          jumlahPembayaran,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            'Silahkan menekan tombol "Langsung Bayar" untuk menyelesaikan transaksi\n',
                                            textAlign: TextAlign.justify)
                                      ],
                                    )),
                                ListTile(
                                    title: Text("Lakukan Sidang\n"),
                                    subtitle: Text(
                                        'Anda diharuskan datang ke pengadilan untuk mengurus penilangan, Silahkan menekan tombol "Lakukan Sidang" untuk dilanjutkan ke sidang',
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
            SizedBox(height: 20),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        printidPelanggaran(idPelanggaran);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                //Nanti dipilih berdasarkan index
                                builder: (context) =>
                                    Pembayaran(status, idPelanggaran)));
                      },
                      color: Colors.blue,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Langsung Bayar",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 20),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        printidPelanggaran(idPelanggaran);
                        // updateStatus(idPelanggaran, 2);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         //Nanti dipilih berdasarkan index
                        //         builder: (context) =>
                        //             AlasanBukan()));

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                //Nanti dipilih berdasarkan index
                                builder: (context) =>
                                    DetailSidang(status, idPelanggaran)));
                      },
                      color: Colors.red,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Lakukan Sidang",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ))
          ]),
        ),
      ),

      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.all(24.0),
      //   child: MaterialButton(
      //     minWidth: double.infinity,
      //     height: 60,
      //     onPressed: () {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               //Nanti dipilih berdasarkan index
      //               builder: (context) => Pembayaran()));
      //     },
      //     color: Colors.blue,
      //     elevation: 0,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(10),
      //     ),
      //     child: Text(
      //       "Selanjutnya",
      //       style: TextStyle(
      //           fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
      //     ),
      //   ),
      // ),
    );
  }
}

printidPelanggaran(int idPelanggaran) {
  print(idPelanggaran);
}

updateStatus(int idPelanggaran, int idStatus) async {
  print(idPelanggaran);
  var response = client
      .from("m_pelanggaran")
      .update({'idStatus': idStatus})
      .eq('idPelanggaran', idPelanggaran)
      .execute();
  print(response);
}
