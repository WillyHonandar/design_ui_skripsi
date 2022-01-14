import 'package:aplikasi_tilang_training/Pages/Navbar/homepage.dart';
import 'package:flutter/material.dart';

class SuksesMelakukanPembayaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 36, vertical: 24),
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 16),
                child: Center(
                  child: Icon(
                    Icons.check,
                    size: 200,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Terimakasih Sudah Melakukan Pembayaran !",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Proses pembayaran akan diproses dalam kurun waktu 2x24 jam! Mohon untuk mengecek status pembayaran Anda secara berkala pada menu List Tilang.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
            ]),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24),
        child: MaterialButton(
          minWidth: double.infinity,
          height: 60,
          onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         //Nanti dipilih berdasarkan index
            //         builder: (context) => MyHomePage()));
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
                (route) => false);
          },
          color: Colors.blue,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "Tutup",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
