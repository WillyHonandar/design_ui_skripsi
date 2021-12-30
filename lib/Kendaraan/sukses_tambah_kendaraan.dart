import 'package:aplikasi_tilang_training/Pages/Navbar/homepage.dart';
import 'package:flutter/material.dart';

class SuksesTambahKendaraan extends StatelessWidget {
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
                  "Sukses menambahkan kendaraan!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Anda dapat mengecek kendaraan anda di halaman List Kendaraan pada menu Settings.",
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    //Nanti dipilih berdasarkan index
                    builder: (context) => MyHomePage()));
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
