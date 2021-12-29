import 'package:flutter/material.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/Content/content.dart';

// int currentIndex = 0;

class News extends StatelessWidget {
  News({Key key, @required this.ind}) : super(key: key);

  int ind = 0;

  final List<Widget> pages = [
    Berita1(),
    Berita2(),
    Berita3(),
    Berita4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[ind],
    );
  }
}

class Berita1 extends StatelessWidget {
  Berita1({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('News')),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 30),
                alignment: Alignment.center,
                child: Text(
                    "Tilang Manual, ETLE, dan Tilang Elektronik Mobile, Apa Bedanya?",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 25),
                child: Center(
                  child: Image(
                    image: AssetImage("assets/berita/berita1.jpeg"),
                    height: 200,
                    width: 300,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: ListTile(
                                  title: Text('', textAlign: TextAlign.center),
                                  subtitle: Text(
                                      'Jakarta - Polri telah menerapkan tilang elektronik atau electronic traffic law enforcement (ETLE). Bahkan, di beberapa daerah telah diterapkan ETLE mobile yang bisa menjangkau ruas jalan lebih banyak lagi. Salah satunya di Jawa Timur yang disebut dengan Incar.\n\n'
                                      'Direktur Lalu Lintas Polda Jawa Timur Kombes Pol Latif Usman membandingkan penerapan tilang manual, ETLE dengan tilang elektronik mobile Incar ini. Berikut perbandingannya seperti disampaikan Latif dalam webinar Implementasi Penegakan Hukum Lalu Lintas Secara Online Melalui Inovasis Sistem ETLE-Incar yang diadakan Ditlantas Polda Jawa Timur, Selasa (31/8/2021).',
                                      textAlign: TextAlign.justify)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class Berita2 extends StatelessWidget {
  Berita2({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('News')),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 30),
                alignment: Alignment.center,
                child: Text(
                    "Polda Metro Tindak Pelanggar Ganjil Genap di Jakarta Lewat ETLE dan Tilang Manual",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 25),
                child: Center(
                  child: Image(
                    image: AssetImage("assets/berita/berita2.jpeg"),
                    height: 200,
                    width: 300,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: ListTile(
                                  title: Text(''),
                                  subtitle: Text(
                                      'Liputan6.com, Jakarta - Direktorat Lalu Lintas Polda Metro Jaya memberikan sanksi tilang bagi pelanggar kebijakan ganjil genap di Jakarta mulai hari ini, Rabu (1/9/2021).\n\n'
                                      'Pembatasan kendaraan roda empat dengan sistem ganjil genap kembali diberlakukan beriringan dengan perpanjangan kebijakan PPKM Level 3 di DKI Jakarta.\n\n'
                                      'Direktur Lalu Lintas Polda Metro Jaya, Kombes Pol Sambodo Purnomo Yogo menjelaskan, ada dua cara yang dilakukan kepolisian dalam menindak pelanggar ganjil genap yakni penilangan secara manual dan memanfaatkan ETLE atau tilang elektronik.\n\n'
                                      '"Tindakan hukum yang kita lakukan ini tentu nanti akan dilakukan dengan dua cara yaitu dengan menggunakan ETLE dan dengan tilang secara manual," kata dia di Bundaran Senayan, Rabu (1/9/2021).\n\n'
                                      'Sambodo menerangkan, kepolisian dalam hal ini lebih mengutamakan tilang manual. Alasannya, kamera ETLE yang terpasang di ruas jalan ganjil genap saat ini masih minim.',
                                      textAlign: TextAlign.justify)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class Berita3 extends StatelessWidget {
  Berita3({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('News')),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 30),
                alignment: Alignment.center,
                child: Text(
                    "Ini Jenis Pelanggaran ETLE yang Paling Banyak Dilanggar Masyarakat",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 25),
                child: Center(
                  child: Image(
                    image: AssetImage("assets/berita/berita3.jpeg"),
                    height: 200,
                    width: 300,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: ListTile(
                                  title: Text(''),
                                  subtitle: Text(
                                      'Liputan6.com, Jakarta - Penerapan tilang elektronik atau Electronic Traffic Law Enforcement (ETLE) sudah resmi diberlakukan sejumlah Polda. Berdasarkan data yang dirilis, sebanyak 12 Polda sudah menerapkan tilang elektronik bagi para pelanggar lalu lintas.\n\n'
                                      'Dari 12 Polda yang sudah menerapkan tilang elektronik, Polda Banten, sudah mulai melakukan penindakan atas pelanggaran yang terjadi di jalan raya. Menurut data Kasubdit Gakkum Ditlantas Polda Banten, AKBP Hamdani, pihaknya mengatakan kebanyakan yang tertangkap tilang elektronik adalah pengemudi mobil.\n\n'
                                      'Dalam informasi resminya, pihak Polda Banten sudah mengantongi sebanyak 50 pelanggar tersebut per Jumat (1/4/2021) lantaran tidak menggunakan seatbelt dalam berkendara.\n\n'
                                      '"Kemarin kita sudah kirim kurang lebih sekitar 50 surat tilang elektronik bagi pengendara mobil yang tidak menggunakan sabuk pengamana (seatbelt). Sementara ini tidak ada pelanggaran dari pengguna sepeda motor," ujarnya.',
                                      textAlign: TextAlign.justify)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class Berita4 extends StatelessWidget {
  Berita4({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('News')),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 30),
                alignment: Alignment.center,
                child: Text("Tak Berkutik dengan Tilang Elektronik",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 25),
                child: Center(
                  child: Image(
                    image: AssetImage("assets/berita/berita4.jpeg"),
                    height: 200,
                    width: 300,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: ListTile(
                                title: Text(''),
                                subtitle: Text(
                                    'Liputan6.com, Jakarta - Tilang elektronik atau Electronic Traffic Law Enforcement (ETLE) telah diluncurkan secara nasional sejak Maret 2021. Karena ETLE sudah diterapkan di 12 wilayah kepolisian daerah dengan 244 kamera tilang elektronik, para pelanggar lalu lintas kini tak bisa berkutik lagi.\n\n'
                                    '12 wilayah itu yakni Polda Metro Jaya, Polda Banten, Polda Jawa Barat, Polda Jawa Tengah, Polda Daerah Istimewa Yogyakarta, Polda Jawa Timur, Polda Riau, Polda Jambi, Polda Lampung, Polda Sumatera Barat, Polda Sulawesi Utara, dan Polda Sulawesi Selatan.\n\n'
                                    'Bagaimana cara kerja tilang elektronik nasional ini? Berikut ini adalah mekanisme tilang menggunakan metode ETLE, seperti dikutip dari laman Korlantas Polri, Jumat (9/4/2021):',
                                    textAlign: TextAlign.justify),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: ListTile(
                                  title: Text('Tahap 1\n'),
                                  subtitle: Text(
                                      'Perangkat ETLE secara otomatis menangkap pelanggaran lalu lintas yang dimonitor dan mengirimkan media barang bukti pelanggaran ke Back Office ETLE di RTMC Polda setempat.',
                                      textAlign: TextAlign.justify)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: ListTile(
                                  title: Text('Tahap 2\n'),
                                  subtitle: Text(
                                      'Petugas mengidentifikasi Data Kendaraan menggunakan Electronic Registration & Identifikasi (ERI) sebagai sumber data kendaraan.',
                                      textAlign: TextAlign.justify)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: ListTile(
                                  title: Text('Tahap 3\n'),
                                  subtitle: Text(
                                      'Petugas mengirimkan surat konfirmasi ke alamat publik kendaraan bermotor untuk permohonan konfirmasi atas pelanggaran yang terjadi. Surat konfirmasi adalah langkah awal dari penindakan, yang mana pemilik kendaraan wajib mengonfirmasi tentang kepemilikan kendaraan dan pengemudi kendaraan pada saat terjadinya pelanggaran.\n\n'
                                      'Jika kendaraan yang dimaksud sudah bukan menjadi kendaraan milik orang yang mendapat surat konfirmasi, maka hal itu harus segera dikonfirmasikan.',
                                      textAlign: TextAlign.justify)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: ListTile(
                                  title: Text('Tahap 4\n'),
                                  subtitle: Text(
                                      'Penerima surat memiliki batas waktu sampai dengan 8 hari dari terjadinya pelanggaran untuk melakukan konfirmasi melalui website atau datang langsung ke kantor Sub Direktorat Penegakan Hukum.',
                                      textAlign: TextAlign.justify)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: ListTile(
                                  title: Text('Tahap 5\n'),
                                  subtitle: Text(
                                      'Setelah pelanggaran terkonfirmasi, petugas menerbitkan tilang dengan metode pembayaran via BRI Virtual Account (BRIVA) untuk setiap pelanggaran yang telah terverifikasi untuk penegakan hukum.\n\n'
                                      'Sebagai catatan, kegagalan pemilik kendaraan untuk mengonfirmasi pelanggaran, akan mengakibatkan blokir STNK sementara. Baik itu ketika telah pindah alamat, telah dijual, maupun kegagalan membayar denda.',
                                      textAlign: TextAlign.justify)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
