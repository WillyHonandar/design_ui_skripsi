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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 70),
            child: Center(
              child: CircleAvatar(
                radius: 80,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            alignment: Alignment.center,
            child: Text(
              "Halo! Willy Honandar",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyProfile()));
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
          Container(
            margin: EdgeInsets.only(top: 30),
            alignment: Alignment.bottomCenter,
            child: Text("Version 1.0.0"),
          ),
        ],
      ),
    );
  }
}
