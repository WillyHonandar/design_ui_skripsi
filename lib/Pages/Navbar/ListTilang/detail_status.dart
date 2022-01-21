import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DetailStatus extends StatefulWidget {
  final int idPelanggaran;
  final String status;
  DetailStatus(this.status, this.idPelanggaran);
  @override
  State<StatefulWidget> createState() {
    return _DetailStatusState(this.status, this.idPelanggaran);
  }
}

class _DetailStatusState extends State<DetailStatus> {
  int idPelanggaran;
  String status;
  _DetailStatusState(this.status, this.idPelanggaran);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("Detail Status", style: TextStyle(color: Colors.black)),
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Builder(
              builder: (context) {
                if (status == "Pemberitahuan Informasi") {
                  return Container(
                    margin: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detail Status: Pemberitahuan Informasi",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Card(
                            child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Column(
                                      children: [
                                        ListTile(
                                            leading: Icon(MaterialCommunityIcons
                                                .information),
                                            title: Text(
                                                "Pemberitahuan Informasi\n"),
                                            subtitle: Text(
                                                'Segera lakukan pembayaran/sidang untuk menyelesaikan proses sidang atau anda dapat melakukan komplain.',
                                                textAlign: TextAlign.justify)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (status == "Segera Lakukan Sidang") {
                  return Container(
                    margin: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detail Status: Segera Lakukan Sidang",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Card(
                            child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: Icon(MaterialCommunityIcons
                                              .information),
                                          title:
                                              Text("Pemberitahuan Informasi\n"),
                                        ),
                                        ListTile(
                                            leading: Icon(MaterialCommunityIcons
                                                .information),
                                            title:
                                                Text("Segera Lakukan Sidang\n"),
                                            subtitle: Text(
                                                'Anda diharuskan datang ke pengadilan untuk mengurus penilangan, Silahkan menekan tombol "Lakukan Sidang" untuk dilanjutkan ke sidang',
                                                textAlign: TextAlign.justify)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (status == "Segera Lakukan Pembayaran") {
                  return Container(
                    margin: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detail Status: Segera Lakukan Pembayaran",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Card(
                            child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: Icon(MaterialCommunityIcons
                                              .information),
                                          title:
                                              Text("Pemberitahuan Informasi\n"),
                                        ),
                                        ListTile(
                                          leading: Icon(MaterialCommunityIcons
                                              .information),
                                          title:
                                              Text("Segera Lakukan Sidang\n"),
                                        ),
                                        ListTile(
                                            leading: Icon(
                                                MaterialCommunityIcons.paypal),
                                            title: Text(
                                                "Segera Lakukan Pembayaran\n"),
                                            subtitle: Text(
                                                'Segera Lakukan Pembayaran di Mobile Banking BRI atau ATM BRI terdekat!',
                                                textAlign: TextAlign.justify)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (status == "Menunggu Konfirmasi Pembayaran") {
                  return Container(
                    margin: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detail Status: Menunggu Konfirmasi Pembayaran",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Card(
                            child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: Icon(MaterialCommunityIcons
                                              .information),
                                          title:
                                              Text("Pemberitahuan Informasi\n"),
                                        ),
                                        ListTile(
                                            leading: Icon(MaterialCommunityIcons
                                                .timelapse),
                                            title: Text(
                                                "Menunggu Konfirmasi Pembayaran\n"),
                                            subtitle: Text(
                                                'Silahkan menunggu konfirmasi pembayaran hingga status berubah!',
                                                textAlign: TextAlign.justify)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (status == "Selesai") {
                  return Container(
                    margin: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detail Status: Selesai",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Card(
                            child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: Icon(MaterialCommunityIcons
                                              .information),
                                          title:
                                              Text("Pemberitahuan Informasi\n"),
                                        ),
                                        ListTile(
                                          leading: Icon(
                                              MaterialCommunityIcons.timelapse),
                                          title: Text(
                                              "Menunggu Konfirmasi Pembayaran\n"),
                                        ),
                                        ListTile(
                                            leading: Icon(
                                                MaterialCommunityIcons.check),
                                            title: Text("Selesai\n"),
                                            subtitle: Text(
                                                'Terima kasih telah melakukan pembayaran!',
                                                textAlign: TextAlign.justify)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (status == "Pembayaran di tolak") {
                  return Container(
                    margin: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detail Status: Pembayaran di tolak",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Card(
                            child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: Icon(MaterialCommunityIcons
                                              .information),
                                          title:
                                              Text("Pemberitahuan Informasi\n"),
                                        ),
                                        ListTile(
                                          leading: Icon(
                                              MaterialCommunityIcons.timelapse),
                                          title: Text(
                                              "Menunggu Konfirmasi Pembayaran\n"),
                                        ),
                                        ListTile(
                                            leading: Icon(MaterialCommunityIcons
                                                .close_box),
                                            title: Text("Ditolak\n"),
                                            subtitle: Text(
                                                'Mohon maaf, Pembayaran anda ditolak, silahkan cek email yang terdaftar pada aplikasi untuk melihat lebih detail mengenai penolakan pembayaran anda!',
                                                textAlign: TextAlign.justify)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (status == "Tunggu Email") {
                  return Container(
                    margin: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detail Status: Tunggu Email",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Card(
                            child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: Icon(MaterialCommunityIcons
                                              .information),
                                          title:
                                              Text("Pemberitahuan Informasi\n"),
                                        ),
                                        ListTile(
                                            leading: Icon(MaterialCommunityIcons
                                                .email_alert),
                                            title: Text("Tunggu Email\n"),
                                            subtitle: Text(
                                                'Silahkan menunggu email dari pihak kepolisian untuk detail lebih lanjut seputar komplain!',
                                                textAlign: TextAlign.justify)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (status == "Email telah dikirim") {
                  return Container(
                    margin: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detail Status: Email telah dikirim",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Card(
                            child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: Icon(MaterialCommunityIcons
                                              .information),
                                          title:
                                              Text("Pemberitahuan Informasi\n"),
                                        ),
                                        ListTile(
                                          leading: Icon(MaterialCommunityIcons
                                              .email_alert),
                                          title: Text("Tunggu Email\n"),
                                        ),
                                        ListTile(
                                            leading: Icon(MaterialCommunityIcons
                                                .email_check),
                                            title: Text("Email Terkirim\n"),
                                            subtitle: Text(
                                                'Silahkan periksa email yang terdaftar pada aplikasi anda untuk informasi lebih lanjut seputar komplain!',
                                                textAlign: TextAlign.justify)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return null;
                }
              },
            ),
          ),
        ));
  }
}
