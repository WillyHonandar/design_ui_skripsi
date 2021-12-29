import 'dart:async';

import 'package:aplikasi_tilang_training/pages/intro/vehicle_registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  final String phone, username;

  OTPScreen(this.phone, this.username);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationCode;

  int start = 60;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final _pinPutFocusNode = FocusNode();
  final _pinPutController = TextEditingController();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: Colors.white,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text("Verifikasi OTP"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: PinPut(
              fieldsCount: 6,
              withCursor: true,
              textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
              eachFieldWidth: 50.0,
              eachFieldHeight: 65.0,
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              submittedFieldDecoration: pinPutDecoration,
              selectedFieldDecoration: pinPutDecoration,
              followingFieldDecoration: pinPutDecoration,
              pinAnimationType: PinAnimationType.fade,
              onSubmit: (pin) async {
                try {
                  await _auth
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verificationCode, smsCode: pin))
                      .then((value) async {
                    if (value.user != null) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisKendaraan()),
                          (route) => false);
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  print(e);
                  Fluttertoast.showToast(msg: "Failed because of $e");
                }
              },
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Text(
                  "Silahkan masukkan kode verifikasi untuk nomor handphone 0${widget.phone}!",
                  style: TextStyle(fontSize: 17.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 17.0),
                children: <TextSpan>[
                  TextSpan(
                      text:
                          "Apabila anda tidak menerima pesan silahkan tekan "),
                  TextSpan(
                      text: "kirim ulang",
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            verifyPhoneNumber();
                          });
                        }),
                  TextSpan(text: " dalam waktu"),
                  TextSpan(
                      text: " $start detik.",
                      style: TextStyle(fontWeight: FontWeight.w700))
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  verifyPhoneNumber() async {
    startTimer();
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+62${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential).then((value) async {
            if (value.user != null) {
              Fluttertoast.showToast(msg: "Successfuly logged in!");
            } else {
              Fluttertoast.showToast(msg: "Errror Occured!");
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int forceResendingToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 60));
  }

  void startTimer() {
    start = 60;
    const onsec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        timer.cancel();
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    verifyPhoneNumber();
  }
}
