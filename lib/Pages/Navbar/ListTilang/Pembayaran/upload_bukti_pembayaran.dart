import 'dart:io';

import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/Pembayaran/sukses_melakukan_pembayaran.dart';
import 'package:aplikasi_tilang_training/main.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class UploadBuktiPembayaran extends StatefulWidget {
  final int idPelanggaran;
  final String status;
  UploadBuktiPembayaran(this.status, this.idPelanggaran);

  @override
  State<StatefulWidget> createState() {
    return _UploadBuktiPembayaranState(this.status, this.idPelanggaran);
  }
}

class _UploadBuktiPembayaranState extends State<UploadBuktiPembayaran> {
  int idPelanggaran;
  String status;
  _UploadBuktiPembayaranState(this.status, this.idPelanggaran);
  File image;
  bool _isLoading = false;

  Future<String> uploadImageToFirebase(BuildContext context) async {
    String fileName = basename(image.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('buktiPembayaran/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  dataLoadFunction() async {
    setState(() {
      _isLoading = true; // your loader has started to load
    });
    // fetch you data over here
    setState(() {
      _isLoading = false; // your loder will stop to finish after the data fetch
    });
  }

  @override
  void initState() {
    super.initState();
    dataLoadFunction(); // this function gets called
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Upload Bukti Pembayaran",
            style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      ),
      body: Container(
          margin: EdgeInsets.all(24),
          child: Center(
            child: Column(
              children: [
                image != null
                    ? Image.file(image,
                        width: 320, height: 320, fit: BoxFit.cover)
                    : FlutterLogo(size: 320),
                SizedBox(height: 24),
                MaterialButton(
                  // minWidth: double.infinity,
                  height: 30,
                  onPressed: () {
                    pickImage(ImageSource.gallery);
                  },
                  color: Colors.grey,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "Upload Image From Gallery",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
                MaterialButton(
                  // minWidth: double.infinity,
                  height: 30,
                  onPressed: () {
                    pickImage(ImageSource.camera);
                  },
                  color: Colors.grey,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "Upload Image From Camera",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          )),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24),
        child: MaterialButton(
          minWidth: double.infinity,
          height: 60,
          onPressed: () {
            if (image == null) {
              Fluttertoast.showToast(msg: "Anda belum mengupload gambar!");
            } else
              //Function Update Status menjadi Menunggu Konfirmasi

              _isLoading
                  ? CircularProgressIndicator() // this will show when loading is true
                  : updateStatus(idPelanggaran, 4);
            uploadImageToFirebase(context).then((buktiPembayaran) => {
                  addBuktiPembayaran(idPelanggaran, buktiPembayaran),
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         //Nanti dipilih berdasarkan index
                  //         builder: (context) => SuksesMelakukanPembayaran()));
                  Fluttertoast.showToast(
                      msg: "Sukses Upload Bukti Pembayaran!"),
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SuksesMelakukanPembayaran()),
                      (route) => false)
                });
          },
          color: Colors.blue,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "Upload Bukti Pembayaran",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

updateStatus(int idPelanggaran, int idStatus) async {
  var response = client
      .from("m_pelanggaran")
      .update({'idStatus': idStatus})
      .eq('idPelanggaran', idPelanggaran)
      .execute();
  print(response);
}

addBuktiPembayaran(int idPelanggaran, String buktiPembayaran) async {
  var response = await client.from("m_pembayaran").insert({
    'idPelanggaran': idPelanggaran,
    'buktiPembayaran': buktiPembayaran,
  }).execute();
  print(response);
}
