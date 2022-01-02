import 'package:aplikasi_tilang_training/net/firebase.dart';
import 'package:aplikasi_tilang_training/Authentication/login.dart';
import 'package:aplikasi_tilang_training/Authentication/otp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<MyProfile> {
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
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Profile", style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
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
                      children: [],
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
                      inputPhoneNum(
                          label: "Nomor Handphone",
                          controller: _phoneNumberController)
                    ],
                  ),
                  // Container(
                  //   padding: EdgeInsets.only(top: 3, left: 3),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(50),
                  //   ),
                  //   child: MaterialButton(
                  //     minWidth: double.infinity,
                  //     height: 60,
                  //     onPressed: () async {
                  //       if (_formKey.currentState.validate()) {
                  //         if (_passwordController.text.trim() ==
                  //             _confirmPasswordController.text.trim()) {
                  //           try {
                  //             await FirebaseAuth.instance
                  //                 .createUserWithEmailAndPassword(
                  //                     email: _emailController.text,
                  //                     password: _passwordController.text);
                  //             setState(() {
                  //               Fluttertoast.showToast(
                  //                   msg: "succesffuly signed up!");
                  //               Navigator.pushReplacement(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                     builder: (context) => OTPScreen(
                  //                         _phoneNumberController.text,
                  //                         _usernameController.text)),
                  //               );
                  //               User updateUser =
                  //                   FirebaseAuth.instance.currentUser;
                  //               updateUser.updateDisplayName(
                  //                   _usernameController.text);
                  //               userSetup(_usernameController.text);
                  //             });
                  //           } catch (e) {
                  //             Fluttertoast.showToast(msg: "Error! $e");
                  //           }
                  //         } else {
                  //           Fluttertoast.showToast(
                  //               msg: "Error! Passwords doesn't match");
                  //         }
                  //       }
                  //     },
                  //     color: Colors.blue,
                  //     elevation: 0,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Text(
                  //       "Daftar",
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.w600,
                  //           fontSize: 18,
                  //           color: Colors.white),
                  //     ),
                  //   ),
                  // ),
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

//CODE AWAL PROFILEPAGE

// import 'package:aplikasi_tilang_training/model/user.dart';
// import 'package:aplikasi_tilang_training/runner/main.dart';
// import 'package:flutter/material.dart';

// class MyProfile extends StatelessWidget {
//   const MyProfile({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<User>>(
//           future: getUsers(),
//           builder: (context, AsyncSnapshot<List<User>> snapshot) {
//             if (snapshot.hasData == false) {
//               return Center(child: CircularProgressIndicator());
//             }
//             return ListView(
//               children: snapshot.data
//                   .map((user) => Container(
//                         child: Column(
//                           children: [
//                             Text(user.nameUser),
//                             Text(user.emailUser),
//                             // Text(user.passwordUser),
//                             Text(user.phoneUser)
//                           ],
//                         ),
//                       ))
//                   .toList(),
//             );
//           }),
//     );
//   }

//   Future<List<User>> getUsers() async {
//     final response = await client
//         .from('m_user')
//         .select()
//         // .order('nameUser', ascending: true)
//         .execute();

//     final dataList = response.data as List;
//     return dataList.map((map) => User.fromJson(map)).toList();
//   }
// }
