import 'package:aplikasi_tilang_training/Pages/Intro/intro_pages.dart';
import 'package:aplikasi_tilang_training/Pages/Intro/vehicle_registration.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/Settings/my_profile.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/Settings/regis_kendaraan.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 64),
                alignment: Alignment.center,
                child: Text(
                  "Halo!\nWilly Honandar",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyProfile()));
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.person),
                              title: Text('My Profile'),
                              // subtitle:
                              //     Text('Setting Username, Email, Password, dkk'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisKendaraan()));
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.album),
                              title: Text('Registrasi Kendaraan'),
                              // subtitle:
                              //     Text('Registrasi Nomor Plat, Nomor Mesin, dkk'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Card(
                      child: InkWell(
                        onTap: () async {
                          print("User Logged Out");
                          await FirebaseAuth.instance.signOut();
                          setState(() {
                            Fluttertoast.showToast(msg: "You are logged out!");
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => App()),
                                (route) => false);
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                                leading: Icon(Icons.logout),
                                title: Text(
                                  'Log Out',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w700),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: 36, vertical: 24),
            child: Text(
              "Version 1.0.0",
              textAlign: TextAlign.center,
            )));
  }
}
