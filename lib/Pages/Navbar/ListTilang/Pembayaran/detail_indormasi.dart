import 'package:flutter/material.dart';

class DetailInformasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Detail Informasi", style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Anda sedang menjalani proses denda tilang, harap simak alur berikut :",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              height: 380,
              child: Card(
                child: SingleChildScrollView(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: ListTile(
                              title: Text("KETENTUAN\n"),
                              subtitle: Text(
                                  '1.Datang ke pengadilan negeri setempat sesuai jadwal yang telah ditentukan.\n\n'
                                  '2.Mengambil nomor antrian sidang dan menunggu waktu sidangnya.\n\n'
                                  '3.Mengikuti sidang, hakim akan membacakan pelanggaran sesuai urutannya. \n\n'
                                  '4.Pelanggar diminta menjawab pertanyaan dari hakim.\n\n'
                                  '5.Jika terbukti bersalah, pelanggar diwajibkan membayar denda di kasir pengadilan.\n\n'
                                  '6.Mengambil STNK atau SIM yang disita polisi.',
                                  textAlign: TextAlign.justify)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.0),
        child: MaterialButton(
          minWidth: double.infinity,
          height: 60,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    //Nanti dipilih berdasarkan index
                    builder: (context) => DetailInformasi()));
          },
          color: Colors.blue,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "Lanjutkan ke Pembayaran",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
