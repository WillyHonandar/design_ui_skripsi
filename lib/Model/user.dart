import 'package:cloud_firestore/cloud_firestore.dart';

class OurUser {
  String uid;
  String email;
  String fullname;
  Timestamp accountCreated;

  OurUser({this.uid, this.email, this.fullname, this.accountCreated});
}

class User {
  String nameUser;
  String emailUser;
  String passwordUser;
  String phoneUser;

  User({this.nameUser, this.emailUser, this.passwordUser, this.phoneUser});

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
        nameUser: map['nameUser'],
        emailUser: map['emailUser'],
        phoneUser: map['phoneUser']);
    // passwordUser: map['passwordUser'],
    // phoneUser: map['phoneUser']);
  }
}
