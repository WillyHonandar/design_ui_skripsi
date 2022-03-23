import 'package:aplikasi_tilang_training/Model/MyUser.dart';
import 'package:aplikasi_tilang_training/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Profile", style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: FutureBuilder<MyUser>(
            future: getProfile(),
            builder: (context, snapshot) {
              if (snapshot.hasData == false) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                children: [
                  ListTile(
                    title: Text('Nama Lengkap',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    subtitle: Text(snapshot.data.namaUser,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                  ),
                  ListTile(
                    title: Text('Email',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    subtitle: Text(snapshot.data.emailUser,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                  ),
                  ListTile(
                    title: Text('Nomor Handphone',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    subtitle: Text("+62" + snapshot.data.noTelpUser,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                  )
                ],
              );
            }),
      ),
    );
  }
}

Future<MyUser> getProfile() async {
  final response = await client
      .from('m_user')
      .select()
      .eq('idUser', FirebaseAuth.instance.currentUser.uid)
      .single()
      .execute();

  final user = MyUser.fromJson(response.data);
  print(user is MyUser);

  return user;
}
