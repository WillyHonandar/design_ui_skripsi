import 'package:aplikasi_tilang_training/Model/user.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/Home/homepage.dart';
import 'package:aplikasi_tilang_training/net/firebase.dart';
import 'package:aplikasi_tilang_training/Authentication/login.dart';
import 'package:aplikasi_tilang_training/Authentication/otp.dart';
import 'package:aplikasi_tilang_training/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            // height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, top: 50, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Halaman Registrasi",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "Harap isi semua data - data dengan benar!",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      inputFile(
                          label: "Nama Lengkap",
                          controller: _usernameController),
                      inputFile(label: "Email", controller: _emailController),
                      inputFile(
                          label: "Password",
                          controller: _passwordController,
                          obscureText: true),
                      inputFile(
                          label: "Konfirmasi Password",
                          controller: _confirmPasswordController,
                          obscureText: true),
                      inputPhoneNum(
                          label: "Nomor Handphone",
                          controller: _phoneNumberController)
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(top: 3, left: 3, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          if (_passwordController.text.trim() ==
                              _confirmPasswordController.text.trim()) {
                            try {
                              // UserCredential user = await FirebaseAuth.instance
                              //     .createUserWithEmailAndPassword(
                              //         email: _emailController.text,
                              //         password: _passwordController.text);

                              //ini ambil data dri firebase setelah regist
                              // addUserSupabase(
                              //     user.user.uid,
                              //     _usernameController.text,
                              //     _emailController.text,
                              //     _phoneNumberController.text);
                              // User updateUser =
                              //     FirebaseAuth.instance.currentUser;
                              // updateUser
                              //     .updateDisplayName(_usernameController.text);

                              // userSetup(_usernameController.text);
                              //nanti disini untuk insert ke supabasenya (hanya data yg diperlukan)
                              setState(() {
                                Fluttertoast.showToast(
                                    msg: "succesffuly signed up!");
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OTPScreen(
                                          _usernameController.text,
                                          _emailController.text,
                                          _phoneNumberController.text,
                                          _passwordController.text)),
                                );
                                // Navigator.pushReplacement(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => MyHomePage()),
                                // );
                              });
                            } catch (e) {
                              Fluttertoast.showToast(msg: "Error! $e");
                            }
                          } else {
                            Fluttertoast.showToast(
                                msg: "Error! Passwords doesn't match");
                          }
                        }
                      },
                      color: Colors.blue,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Daftar",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Sudah mempunyai akun?"),
                        InkWell(
                          child: Text(
                            " Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.blue),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                        )
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

Widget inputFile({label, controller, obscureText = false, value}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
            height: 1),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: TextFormField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          ),
          validator: validateText,
        ),
      )
    ],
  );
}

String validateText(String formText) {
  if (formText.isEmpty) return "Tidak boleh kosong!";
}

Widget inputPhoneNum({label, controller, obscureText = false}) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 9.0),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
                height: 1),
          ),
        ),
        SizedBox(
          height: 60,
          child: TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              fillColor: Colors.blue,
              prefix: Text("+62 "),
              border: UnderlineInputBorder(),
            ),
            validator: validateText,
            keyboardType: TextInputType.number,
          ),
        )
      ]);
}

addUserSupabase(
    String uid, String namaUser, String emailUser, String noTelpUser) async {
  var response = await client.from("m_user").insert({
    'idUser': uid,
    'namaUser': namaUser,
    'emailUser': emailUser,
    'noTelpUser': noTelpUser
  }).execute();
  print(response);
}
