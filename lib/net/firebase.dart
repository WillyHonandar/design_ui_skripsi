import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firestoreinstance = FirebaseFirestore.instance;

Future<void> userSetup(String displayName) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  FirebaseAuth auth = FirebaseAuth.instance;

  String uid = auth.currentUser.uid.toString();

  users.add({'UID': uid, 'Nama Lengkap': displayName});

  return;
}

Future<void> vechicleSetup(
    String vehicleType, String platNomor, String nomorMesinKendaraan) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  users.add({
    'Tipe Kendaraan': vehicleType,
    'Plat Nomor': platNomor,
    'Nomor Mesin Kendaraan': nomorMesinKendaraan
  });

  return;
}
