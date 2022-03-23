import 'package:aplikasi_tilang_training/Pages/Navbar/Home/homepage.dart';
import 'package:aplikasi_tilang_training/main.dart';
import 'package:flutter/material.dart';

class SuksesLakukanSidang extends StatelessWidget {
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
                  "Segera ke pengadilan terdekat!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Anda diharuskan untuk pergi ke pengadilan terdekat untuk melakukan sidang",
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
