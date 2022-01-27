import 'package:aplikasi_tilang_training/Model/Pelanggaran.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/FlowTilang/Komplain/komplain.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/FlowTilang/detail_informasi.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/tilang_berlangsung.dart';
import 'package:aplikasi_tilang_training/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class KonfirmasiTilang extends StatefulWidget {
  @override
  final int idPelanggaran;
  final String status;
  KonfirmasiTilang(this.status, this.idPelanggaran);
  @override
  State<StatefulWidget> createState() {
    return _KonfirmasiTilangState(this.status, this.idPelanggaran);
  }
}

class _KonfirmasiTilangState extends State<KonfirmasiTilang> {
  int idPelanggaran;
  String status;
  _KonfirmasiTilangState(this.status, this.idPelanggaran);

  List<Pelanggaran> dataPelanggaran;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Pelanggaran>>(
          future: getKonfirmasiTilang(idPelanggaran),
          builder: (context, AsyncSnapshot<List<Pelanggaran>> snapshot) {
            if (snapshot.hasData == false) {
              return Center(child: CircularProgressIndicator());
            }
            dataPelanggaran = snapshot.data;

            return DetailPelanggaran(
                dataPelanggaran: dataPelanggaran,
                idPelanggaran: idPelanggaran,
                status: status);
          }),
    );
  }
}

class DetailPelanggaran extends StatefulWidget {
  List<Pelanggaran> dataPelanggaran;
  int idPelanggaran;
  String status;
  DetailPelanggaran({this.dataPelanggaran, this.idPelanggaran, this.status});

  @override
  _DetailPelanggaranState createState() =>
      _DetailPelanggaranState(dataPelanggaran: dataPelanggaran, status: status);
}

class _DetailPelanggaranState extends State<DetailPelanggaran> {
  List<Pelanggaran> dataPelanggaran;
  String status;
  _DetailPelanggaranState({this.dataPelanggaran, this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Konfirmasi Tilang", style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
            children: dataPelanggaran
                .map((pelanggaran) => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 16, top: 16),
                                child: Center(
                                  child: Image(
                                    image: AssetImage("assets/logo-polri.png"),
                                    height: 80,
                                    width: 80,
                                  ),
                                ),
                              ),
                              Text(
                                "KEPOLISIAN DAERAH METROJAYA",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "DIREKTORAT LALU LINTAS",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Jl. Jenderal Sudirman No. 55, Jakarta, 12190",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Buat isi nomor, platKendaraan, dan mesinKendaraan dari db
                                Row(
                                  children: [
                                    Text(
                                      "Nomor Penilangan: ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      pelanggaran.noTilang,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Text(
                                      "Perihal: ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Surat Konfirmasi ETLE",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Tanggal Penilangan : ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      pelanggaran.tanggalPelanggaran,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Buat isi jenisKendaraan, perihal, dan tempat/tanggal dari db
                                Text(
                                  "Detail Informasi",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      "Jenis Kendaraan: ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      pelanggaran.jenisKendaraan,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "No. Plat Kendaraan: ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      pelanggaran.noPlat,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "No. Mesin Kendaraan: ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      pelanggaran.noMesin,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Buat isi jenisKendaraan, perihal, dan tempat/tanggal dari db
                                Text(
                                  "Detail Pelanggaran",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                SizedBox(height: 5),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Jenis Pelanggaran: ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      pelanggaran.jenisPelanggaran,
                                      maxLines: 10,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Deskripsi Pelanggaran: ",
                                      maxLines: 20,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      pelanggaran.deskripsiPelanggaran,
                                      maxLines: 10,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Jumlah Pembayaran: ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      pelanggaran.jumlahPembayaran,
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "No. Virtual Account BRI: ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      pelanggaran.noVirtualAccount,
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Foto Bukti Pelanggaran",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Center(
                              child: Image.network(
                                  pelanggaran.fotoBuktiPelanggaran,
                                  width: 300,
                                  height: 300),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 20, bottom: 16),
                              child: Column(
                                children: [
                                  MaterialButton(
                                    minWidth: double.infinity,
                                    height: 60,
                                    onPressed: () {
                                      printidPelanggaran(
                                          pelanggaran.idPelanggaran);
                                      print(status);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              //Nanti dipilih berdasarkan index
                                              builder: (context) =>
                                                  DetailInformasi(
                                                      pelanggaran
                                                          .jumlahPembayaran,
                                                      status,
                                                      pelanggaran
                                                          .idPelanggaran)));
                                    },
                                    color: Colors.blue,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      "Ya, saya sebagai pelanggar",
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
                                      print(status + "asdasd");
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         //Nanti dipilih berdasarkan index
                                      //         builder: (context) =>
                                      //             AlasanBukan()));

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => Komplain(
                                                  pelanggaran.status,
                                                  pelanggaran.idPelanggaran)));
                                    },
                                    color: Colors.red,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      "Saya bukan sebagai pelanggar",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ))
                        ]))
                .toList()),
      ),
    );
  }
}

Future<List<Pelanggaran>> getKonfirmasiTilang(int idPelanggaran) async {
  final response = await client.rpc("getDetailPelanggaran",
      params: {'currentPelanggaran': idPelanggaran}).execute();

  print(idPelanggaran);

  final dataList = response.data as List;
  return dataList.map((map) => Pelanggaran.fromJson(map)).toList();
}

printidPelanggaran(int idPelanggaran) {
  print(idPelanggaran);
}
