import 'package:cloud_firestore/cloud_firestore.dart';

class UserRegister {
  String idUser;
  String email;
  String displayName;
  String phoneNumber;
  Timestamp accountCreated;

  UserRegister(
      {this.idUser,
      this.email,
      this.displayName,
      this.phoneNumber,
      this.accountCreated});
}

UserRegister userRegister;

class MyUser {
  String idUser;
  String namaUser;
  String emailUser;
  String noTelpUser;

  MyUser({this.idUser, this.namaUser, this.emailUser, this.noTelpUser});

  factory MyUser.fromJson(Map<String, dynamic> map) {
    return MyUser(
        idUser: map['idUser'],
        namaUser: map['namaUser'],
        emailUser: map['emailUser'],
        noTelpUser: map['noTelpUser']);
    // passwordUser: map['passwordUser'],
    // phoneUser: map['phoneUser']);
  }
}
