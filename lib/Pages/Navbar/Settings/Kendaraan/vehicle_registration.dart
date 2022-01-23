import 'dart:async';
import 'dart:developer';
import 'package:aplikasi_tilang_training/Pages/Navbar/Settings/Kendaraan/sukses_tambah_kendaraan.dart';
import 'package:aplikasi_tilang_training/net/firebase.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/Home/homepage.dart';
import 'package:aplikasi_tilang_training/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class RegisKendaraan extends StatefulWidget {
  @override
  _RegisKendaraanState createState() => _RegisKendaraanState();
}

class _RegisKendaraanState extends State<RegisKendaraan> {
  int _counter = 0;

  String _chosenValue;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController _nomorMesinKendaraanController =
      TextEditingController();
  final TextEditingController _jumlahKendaraan = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("Registrasi Kendaraan"),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 36, vertical: 24),
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Registrasi Kendaraan",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Pastikan semua kendaraan yang anda isi merupakan kepemilikan anda! ",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 64),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jenis Kendaraan",
                              style: TextStyle(fontFamily: 'Lato'),
                            ),
                            DropdownButton<String>(
                              focusColor: Colors.white,
                              value: _chosenValue,
                              //elevation: 5,
                              style: TextStyle(color: Colors.white),
                              iconEnabledColor: Colors.black,
                              items: <String>[
                                'Mobil',
                                'Motor'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              hint: Text(
                                "Pilih Jenis Kendaraan",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              onChanged: (String value) {
                                setState(() {
                                  _chosenValue = value;
                                  print(value);
                                });
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 24),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Plat Nomor Kendaraan"),
                                  Form(
                                    key: formKey,
                                    child: Padding(
                                        padding: const EdgeInsets.only(top: 12),
                                        child: PinCodeTextField(
                                          appContext: context,
                                          pastedTextStyle: TextStyle(
                                            color: Colors.blue.shade300,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          length: 9,
                                          obscureText: false,
                                          animationType: AnimationType.fade,
                                          validator: (v) {
                                            if (v.length < 3) {
                                              return "Harap isi plat nomor anda dengan benar!";
                                            } else {
                                              return null;
                                            }
                                          },
                                          pinTheme: PinTheme(
                                            shape: PinCodeFieldShape.box,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            fieldHeight: 40,
                                            fieldWidth: 30,
                                            activeFillColor: hasError
                                                ? Colors.orange
                                                : Colors.white,
                                          ),
                                          cursorColor: Colors.black,
                                          animationDuration:
                                              Duration(milliseconds: 300),
                                          textStyle: TextStyle(
                                              fontSize: 20, height: 1.6),
                                          enableActiveFill: false,
                                          errorAnimationController:
                                              errorController,
                                          controller: textEditingController,
                                          onCompleted: (v) {
                                            print("Completed");
                                          },
                                          // onTap: () {
                                          //   print("Pressed");
                                          // },
                                          onChanged: (value) {
                                            print(value);
                                            setState(() {
                                              currentText = value;
                                            });
                                            currentText =
                                                textEditingController.text;
                                          },
                                          beforeTextPaste: (text) {
                                            print("Allowing to paste $text");
                                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                            return true;
                                          },
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Nomor mesin kendaraan"),
                                  Form(
                                      child: TextFormField(
                                    controller: _nomorMesinKendaraanController,
                                    // onChanged: (value) {
                                    //   print(value);
                                    //   setState(() {
                                    //     currentText = value;
                                    //   });
                                    //   currentText =
                                    //       _nomorMesinKendaraanController.text;
                                    // },
                                  ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    padding: EdgeInsets.only(top: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () async {
                        if (_chosenValue == null ||
                            _nomorMesinKendaraanController.text == "" ||
                            textEditingController.text == "") {
                          Fluttertoast.showToast(
                              msg: "Harap isi semua data kendaraan!");
                        } else {
                          addKendaraanSupabase(
                              FirebaseAuth.instance.currentUser.uid,
                              _chosenValue,
                              _nomorMesinKendaraanController.text,
                              textEditingController.text);
                          _incrementCounter();
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => SuksesTambahKendaraan()));
                          setState(() {
                            // User updateUser = FirebaseAuth.instance.currentUser;
                            // updateUser.uid;

                            Fluttertoast.showToast(
                                msg: "Sukses Menambahkan Kendaraan");

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SuksesTambahKendaraan()),
                                (route) => false);
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             SuksesTambahKendaraan()));

                            //add Supabase

                            // vechicleSetup(_chosenValue, textEditingController.text,
                            //     _nomorMesinKendaraanController.text);
                          });
                        }
                      },
                      color: Colors.blue,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Tambah Kendaraan",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: InkWell(
                      child: Text(
                        "Lewati registrasi kendaraan",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.grey.shade500),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                      },
                    ),
                  )
                ]),
          ),
        ));
  }
}

addKendaraanSupabase(String uid, String jenisKendaraan, String noMesinKendaraan,
    String noPlatKendaraan) async {
  try {
    print(uid);
    print(jenisKendaraan);
    print(noMesinKendaraan);
    print(noPlatKendaraan);

    var response = await client.from("m_kendaraan").insert({
      'idUser': uid,
      'jenisKendaraan': jenisKendaraan,
      'noMesin': noMesinKendaraan,
      'noPlat': noPlatKendaraan
    }).execute();
    print("sudah benar");
  } catch (e) {
    print("ini Error" + e);
  }
}
