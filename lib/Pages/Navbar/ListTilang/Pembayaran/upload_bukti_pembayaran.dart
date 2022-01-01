import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class UploadBuktiPembayaran extends StatefulWidget {
  @override
  _UploadBuktiPembayaranState createState() => _UploadBuktiPembayaranState();
}

class _UploadBuktiPembayaranState extends State<UploadBuktiPembayaran> {
  File image;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Upload Bukti Pembayaran",
            style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      ),
      body: Container(
          child: Column(
        children: [
          Spacer(),
          // image != null ? Image.file(
          //   image!,
          //   width: 160,
          //   height: 160,
          //   fit: BoxFit.cover
          //   )
          //   : FlutterLogo(size: 160),
          const SizedBox(height: 24),
        ],
      )),
    );
  }
}
