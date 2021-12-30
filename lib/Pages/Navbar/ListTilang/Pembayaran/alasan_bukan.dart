import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/Pembayaran/sukses_bukan_kendaraan.dart';
import 'package:flutter/material.dart';

class AlasanBukan extends StatefulWidget {
  @override
  _AlasanBukanState createState() => _AlasanBukanState();
}

class _AlasanBukanState extends State<AlasanBukan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Konfirmasi Tilang", style: TextStyle(color: Colors.black)),
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    //Nanti dipilih berdasarkan index
                    builder: (context) => SuksesBukanKendaraan()));
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
