import 'package:cloud_firestore/cloud_firestore.dart';

class OurUser {
  String uid;
  String email;
  String fullname;
  Timestamp accountCreated;

  OurUser({this.uid, this.email, this.fullname, this.accountCreated});
}

class User {
  String namaUser;
  String emailUser;
  String phoneUser;

  User({this.namaUser, this.emailUser, this.phoneUser});

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
        namaUser: map['namaUser'],
        emailUser: map['emailUser'],
        phoneUser: map['phoneUser']);
    // passwordUser: map['passwordUser'],
    // phoneUser: map['phoneUser']);
  }
}
