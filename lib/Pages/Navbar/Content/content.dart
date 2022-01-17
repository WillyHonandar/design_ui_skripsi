import 'package:flutter/material.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/Content/content.dart';

// int currentIndex = 0;

class Content extends StatelessWidget {
  Content({Key key, @required this.ind}) : super(key: key);

  int ind = 0;

  final List<Widget> pages = [
    CekPengetahuan1(),
    CekPengetahuan2(),
    CekPengetahuan3(),
    CekPengetahuan4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[ind],
    );
  }
}

class CekPengetahuan1 extends StatelessWidget {
  CekPengetahuan1({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("Cek Pengetahuan", style: TextStyle(color: Colors.black)),
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: Image(
                    image: AssetImage("assets/etle-logo.png"),
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                alignment: Alignment.center,
                child: Text(
                  "Apa Itu ETLE?",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                                  title: Text('ETLE Polda Metro Jaya\n'),
                                  subtitle: Text(
                                      '     Electronic Traffic Law Enforcement di Direktorat Lalu Lintas Polda Metro Jaya adalah implementasi teknologi untuk mencatat pelanggaran - pelanggaran dalam berlalu lintas secara elektronik untuk mendukung keamanan, ketertiban, keselamatan dan ketertiban dalam berlalu lintas. Pemetaan data kecelakaan menunjukkan keterkaitan antara tingginya pelanggaran dengan kecelakaan fatal yang terjadi.',
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

class CekPengetahuan2 extends StatelessWidget {
  CekPengetahuan2({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("Cek Pengetahuan", style: TextStyle(color: Colors.black)),
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: Image(
                    image: AssetImage("assets/cek_pengetahuan/proses.png"),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                alignment: Alignment.center,
                child: Text(
                  "Bagaimana proses tilang ETLE?",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                                  title: Text('1. Jenis Pelanggaran ETLE\n'),
                                  subtitle: Text(
                                      '     CCTV akan mendeteksi secara otomatis pelanggaran yang difokuskan pada setiap kendaraan.\n\n'
                                      '     Untuk mobil, jenis pelanggaran ETLE menyasar pengendara yang menggunakan ponsel saat menyetir, tidak menggunakan sabuk keselamatan, pelanggaran marka dan rambu jalan, menerobos lampu merah, melawan arus, dan lainnya.\n\n'
                                      '     Sementara untuk sepeda motor adalah pelanggaran rambu dan marka, tidak menggunakan helm, bermain ponsel, dan pemakaian pelat nomor palsu.',
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
                                  title: Text(
                                      '2. Verifikasi Identitas Kendaraan\n'),
                                  subtitle: Text(
                                      '     Setelah pelanggaran lalu lintas terekam kamera CCTV, polisi akan mengecek identitas kendaraan dari database registrasi kendaraan bermotor, setidaknya 3 hari.',
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
                                  title: Text(
                                      '3. Polisi mengirimkan surat konfirmasi\n'),
                                  subtitle: Text(
                                      '     Setelah itu, petugas akan mengirim surat konfirmasi yang mencantum nama pemilik kendaraan, foto atau bukti pelanggaran, jenis pasal yang dilanggar, alamat pemilik dan jenis kendaraan, serta masa berlaku kendaraan.\n\n'
                                      '     Dalam surat tersebut juga berisi petunjuk untuk melakukan konfirmasi termasuk tanggal untuk konfirmasi tersebut.',
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
                                  title: Text(
                                      '4. Pemilik kendaraan mengonfirmasi pelanggaran\n'),
                                  subtitle: Text(
                                      '     Setelah surat konfirmasi diterima, pemilik kendaraan wajib melakukan klarifikasi. Cara melakukan klarifikasi bisa dilakukan secara manual ataupun online.\n\n'
                                      '* Cara pertama, pelanggar bisa langsung mengunjungi posko atau giro ETLE di Subdit Gakkum Polda Metro Jaya. Untuk waktu operasinya dari Senin hingga Jumat pukul 08.00 - 16.00 WIB. sedangkan Sabtu dari pukul 8.00 - 14.00 WIB.\n\n'
                                      '* Adapun untuk online, Anda bisa melalui situs resmi ETLE, dengan memasukkan kode referensi pelanggaran dan nomor polisi kendaraan.\n\n'
                                      '     Pelanggan diberi waktu 5 hari untuk konfirmasi. Konfirmasi tersebut maksudnya adalah hak jawab bagi pemilik kendaraan mengenai pelanggaran atas nama kendaraan yang dikenakan sanksi.',
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
                                  title: Text(
                                      '5. Pembayaran Denda Tilang Elektronik\n'),
                                  subtitle: Text(
                                      '     Jika sudah melakukan salah satu prosedur klarifikasi di atas, pelanggar akan mendapatkan surat tilang biru sebagai bukti pelanggaran serta kode BRI virtual (BRIVA) untuk melakukan pembayaran denda lewat Bank BRI.\n\n'
                                      '     Agar terhindar dari denda tilang elektronik, berkendaralah sesuai aturan dan undang-undang yang berlaku.',
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

class CekPengetahuan3 extends StatelessWidget {
  CekPengetahuan3({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("Cek Pengetahuan", style: TextStyle(color: Colors.black)),
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: Image(
                    image: AssetImage("assets/cek_pengetahuan/cara_bayar.png"),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                alignment: Alignment.center,
                child: Text(
                  "Cara melunaskan denda ETLE",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                                  title:
                                      Text('1. Melalui Mobile Banking BRI\n'),
                                  subtitle: Text(
                                      '- Login aplikasi BRI Mobile\n'
                                      '- Pilih menu Mobile Banking BRI > Pembayaran > BRIVA\n'
                                      '- Masukkan 15 angka Nomor Pembayaran Tilang\n'
                                      '- Masukkan nominal pembayaran sesuai jumlah denda yang harus dibayarkan, Transaksi akan ditolak jika pembayaran tidak sesuai dengan jumlah denda titipan\n'
                                      '- Masukkan PIN\n'
                                      '- Simpan notifikasi SMS sebagai bukti pembayaran\n'
                                      '- Tunjukkan notifikasi SMS ke penindak untuk ditukarkan dengan barang bukti yang disita\n',
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
                                  title: Text('2. Melalui ATM BRI\n'),
                                  subtitle: Text(
                                      '- Masukkan Kartu Debit BRI dan PIN Anda\n'
                                      '- Pilih menu Transaksi Lain > Pembayaran > Lainnya > BRIVA\n'
                                      '- Masukkan 15 angka Nomor Pembayaran Tilang\n'
                                      '- Di halaman konfirmasi, pastikan detil pembayaran sudah sesuai seperti Nomor BRIVA, Nama Pelanggar dan Jumlah Pembayaran\n'
                                      '- Ikuti instruksi untuk menyelesaikan transaksi\n'
                                      '- Copy struk ATM sebagai bukti pembayaran yang sah dan disimpan\n'
                                      '- Struk ATM asli diserahkan ke penindak untuk ditukarkan dengan barang bukti yang disita\n',
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

class CekPengetahuan4 extends StatelessWidget {
  CekPengetahuan4({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("Cek Pengetahuan", style: TextStyle(color: Colors.black)),
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: Image(
                    image: AssetImage("assets/cek_pengetahuan/faq.png"),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                alignment: Alignment.center,
                child: Text(
                  "FAQ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                                  title: Text(
                                      'Saya menerima SMS konfirmasi, apakah saya sudah ditilang?\n'),
                                  subtitle: Text(
                                      'Belum. SMS konfirmasi adalah langkah awal dari penindakan di mana pemilik kendaraan wajib konfirmasi tentang kepemilikan kendaraan dan pengemudi kendaraan pada saat terjadinya pelanggaran.',
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
                                  title: Text(
                                      'Berapa lama batas waktu saya untuk konfirmasi?\n'),
                                  subtitle: Text(
                                      'Anda memiliki batas waktu sampai dengan 3 hari dari terjadinya pelanggaran untuk melakukan konfirmasi.',
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
                                  title: Text(
                                      'Bagaimana jika saya tidak melakukan konfirmasi hingga batas waktu yang telah ditentukan?\n'),
                                  subtitle: Text(
                                      'Kegagalan pemilik kendaraan untuk konfirmasi akan mengakibatkan blokir STNK Sementara.',
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
                                  title: Text(
                                      'Bagaimana saya membayar denda tilang?\n'),
                                  subtitle: Text(
                                      'Setelah mendapat SMS notifikasi berisi nomor BRIVA eTilang, lakukan pembayaran di BRI atau transfer melalui Bank Lain.',
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
                                  title: Text(
                                      'Kapan batas waktu terakhir untuk pembayaran?\n'),
                                  subtitle: Text(
                                      'Batas waktu terakhir untuk pembayaran adalah H-4 dari tanggal sidang. Jika gagal melakukan ini, maka STNK Anda akan terblokir.',
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
                                  title: Text(
                                      'Apa yang terjadi jika saya tidak mengetahui pengendara saat terjadinya pelanggaran?\n'),
                                  subtitle: Text(
                                      'Kendaraan yang dioperasikan di jalan raya, memiliki potensi mencelakakan pengguna jalan raya lainnya, bahkan sampai meninggal dunia. Sebagai pemilik kendaraan, Anda wajib bertanggung jawab kepada siapa Anda meminjamkan kendaraan tersebut.',
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
                                  title: Text(
                                      'Jika kendaraan saya sudah dijual, apakah saya harus melakukan konfirmasi juga?\n'),
                                  subtitle: Text(
                                      'Dengan melakukan konfirmasi dan memberikan info pengendara baru, maka Anda sudah berpartisipasi dalam usaha mentertibkan kepemilikan kendaraan. Dalam skenario terburuk di mana kendaraan terkait digunakan untuk tindakan kriminal, maka Anda sudah membantu mempermudah penyelidikan.',
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
                                  title: Text(
                                      'Adakah tempat untuk konsultasi mengenai SMS konfirmasi yang saya terima?\n'),
                                  subtitle: Text(
                                      'Ya. Anda dapat datang ke kantor kami di Subdit Gakkum Ditlantas Polda Jawa Barat Jl. Soekarno-Hatta No. 748, Kota Bandung atau telepon melalui HOTLINE (022)63731111',
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
