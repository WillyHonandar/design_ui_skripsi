import 'package:cloud_firestore/cloud_firestore.dart';

// class OurUser {
//   String idUser;
//   String email;
//   String displayName;
//   String phoneNumber;
//   Timestamp accountCreated;

//   OurUser(
//       {this.idUser,
//       this.email,
//       this.displayName,
//       this.phoneNumber,
//       this.accountCreated});
// }

// OurUser ourUser;

class User2 {
  String namaUser;
  String emailUser;
  String phoneUser;

  User2({this.namaUser, this.emailUser, this.phoneUser});

  factory User2.fromJson(Map<String, dynamic> map) {
    return User2(
        namaUser: map['namaUser'],
        emailUser: map['emailUser'],
        phoneUser: map['phoneUser']);
    // passwordUser: map['passwordUser'],
    // phoneUser: map['phoneUser']);
  }
}
