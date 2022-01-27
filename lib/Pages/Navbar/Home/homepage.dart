import 'dart:async';

import 'package:aplikasi_tilang_training/Model/Content.dart';
import 'package:aplikasi_tilang_training/Model/Notification.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/Home/Content/content.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/Home/Content/news.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/Home/Notification/notifications_page.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/list_tilang.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/Lokasi/police_station_location.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/Settings/settings.dart';
import 'package:aplikasi_tilang_training/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:carousel_pro/carousel_pro.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> pages = [
    Home(),
    ListTilang(),
    LokasiPolsekPengadilan(),
    Settings(),
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
                print(currentIndex);
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'List Tilang',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Lokasi',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ]));
  }
}

//Kodingan Home
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<int> list = [1, 2, 3, 4, 5];

  int counter = 0;
  String uid;
  User user;
  String userId = FirebaseAuth.instance.currentUser.uid;
  List<Notifikasi> dataNotifikasi;
  Notifikasi notif = new Notifikasi();

  FutureOr onGoBack(dynamic value) {
    build(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<Notifikasi>>(
          future: getNotifikasi(userId),
          builder: (context, AsyncSnapshot<List<Notifikasi>> snapshot) {
            if (snapshot.hasData == false) {
              return Center(child: CircularProgressIndicator());
            }
            dataNotifikasi = snapshot.data;
            counter = snapshot.data.length;

            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: Colors.white12,
                centerTitle: true,
                title: Image.asset(
                  'assets/etle-homeicon.png',
                  scale: 1.9,
                ),
                actions: [
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  //Nanti dipilih berdasarkan index
                                  builder: (context) =>
                                      NotificationsList())).then((onGoBack));
                          setState(() {});
                        },
                        padding: EdgeInsets.only(top: 8, right: 20),
                        icon: Icon(Icons.notifications),
                        color: Colors.blue,
                        iconSize: 32,
                      ),
                      counter != 0
                          ? Positioned(
                              right: 28,
                              top: 12,
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: new BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 15,
                                  minHeight: 15,
                                ),
                                child: Text(
                                  '$counter',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : Container()
                    ],
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Column(children: [
                  // SearchBar(),
                  // NearestPoliceStation(),
                  CekPengetahuan(),
                  NewsHome(),
                ]),
              ),
            );
          }),
    );
  }
}

// class SearchBar extends StatefulWidget {
//   @override
//   _SearchBarState createState() => _SearchBarState();
// }

// class _SearchBarState extends State<SearchBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
//       child: CupertinoSearchTextField(
//         padding: EdgeInsets.all(15),
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//         placeholder: "Cek nomor tilang anda",
//       ),
//     );
//   }
// }

class CekPengetahuan extends StatelessWidget {
  List cekPengetahuan = [
    "CekPengetahuan-01.jpg",
    "CekPengetahuan-02.jpg",
    "CekPengetahuan-03.jpg",
    "CekPengetahuan-04.jpg"
  ];

  CekPengetahuan({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
            child: Row(
              children: [
                Icon(
                  Icons.lightbulb_rounded,
                  color: Colors.red,
                ),
                Text(
                  "  Cek Pengetahuan",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 21.0,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w800,
                      color: Colors.black87),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            height: 150,
            child: Carousel(
              radius: Radius.circular(10),
              borderRadius: true,
              boxFit: BoxFit.fitHeight,
              autoplay: true,
              autoplayDuration: Duration(seconds: 5),
              animationDuration: Duration(seconds: 1),
              showIndicator: true,
              dotBgColor: Colors.black26,
              dotColor: Colors.white,
              indicatorBgPadding: 5,
              dotSize: 10.0,
              images: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Content(
                                  ind: 0,
                                )));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      fit: BoxFit.fitHeight,
                      image: AssetImage(
                          "assets/cek_pengetahuan/CekPengetahuan-01.jpg"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Content(
                                  ind: 1,
                                )));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      fit: BoxFit.fitHeight,
                      image: AssetImage(
                          "assets/cek_pengetahuan/CekPengetahuan-02.jpg"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Content(
                                  ind: 2,
                                )));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      fit: BoxFit.fitHeight,
                      image: AssetImage(
                          "assets/cek_pengetahuan/CekPengetahuan-03.jpg"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Content(
                                  ind: 3,
                                )));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      fit: BoxFit.fitHeight,
                      image: AssetImage(
                          "assets/cek_pengetahuan/CekPengetahuan-04.jpg"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class CekPengetahuan2 extends StatelessWidget {
//   CekPengetahuan2({key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 24),
//       child: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
//             child: Row(
//               children: [
//                 Icon(Icons.lightbulb_rounded),
//                 Text(
//                   "  Cek Pengetahuan",
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                       fontSize: 21.0,
//                       fontFamily: 'Lato',
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black87),
//                 ),
//               ],
//             ),
//           ),

//           /// disini tambah nya
//           Container(
//             color: Colors.yellow,
//             margin: EdgeInsets.symmetric(horizontal: 16),
//             height: 150,
//             child: Carousel(
//               radius: Radius.circular(10),
//               borderRadius: true,
//               boxFit: BoxFit.fitHeight,
//               autoplay: true,
//               autoplayDuration: Duration(seconds: 5),
//               animationDuration: Duration(seconds: 1),
//               showIndicator: true,
//               indicatorBgPadding: 5,
//               dotSize: 10.0,
//               images: [
//                 FutureBuilder<List<BeritaTerkini>>(
//                     future: getBeritaTerkini(),
//                     builder:
//                         (context, AsyncSnapshot<List<BeritaTerkini>> snapshot) {
//                       if (snapshot.hasData == false) {
//                         return SizedBox(
//                           height: 200,
//                           width: 100,
//                           child: Center(
//                             child: CircularProgressIndicator(),
//                           ),
//                         );
//                       }
//                       dataCekPengetahuan = snapshot.data;
//                       return Container(
//                         child: Column(
//                           children: [
//                             ListView(
//                               physics: NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               padding: EdgeInsets.all(16),
//                               children: dataCekPengetahuan
//                                   .map(
//                                     (beritaTerkini) => InkWell(
//                                       onTap: () {
//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) => Content(
//                                                       ind: 1,
//                                                     )));
//                                       },
//                                       child: Image(
//                                         fit: BoxFit.fitHeight,
//                                         image: AssetImage(
//                                             "assets/cek_pengetahuan/CekPengetahuan-02.jpg"),
//                                       ),
//                                     ),
//                                   )
//                                   .toList(),
//                             ),
//                           ],
//                         ),
//                       );
//                     }),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class NewsHomepage extends StatelessWidget {
//   List newsImage = [
//     "berita1.jpeg",
//     "berita2.jpeg",
//     "berita3.jpeg",
//     "berita4.jpeg"
//   ];
//   List newsTitle = [
//     "Tilang Manual, ETLE, dan Tilang Elektronik Mobile, Apa Bedanya?",
//     "Polda Metro Tindak Pelanggar Ganjil Genap di Jakarta Lewat ETLE dan Tilang Manual",
//     "Ini Jenis Pelanggaran ETLE yang Paling Banyak Dilanggar Masyarakat",
//     "Tak Berkutik dengan Tilang Elektronik"
//   ];

//   List newsDesc = [
//     "aosdhjijaasdshjd",
//     "asdbausgdasdhads",
//     "asouhdiuashduih",
//     "aoshdjoashdihasdasd"
//   ];

//   NewsHomepage({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 24),
//       child: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
//             child: Row(
//               children: [
//                 Icon(Icons.notes),
//                 Text(
//                   "  Berita Terkini",
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                       fontSize: 21.0,
//                       fontFamily: 'Lato',
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black87),
//                 ),
//               ],
//             ),
//           ),

//           Container(
//             child: ListView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 scrollDirection: Axis.vertical,
//                 itemCount: newsImage.length,
//                 padding: EdgeInsets.only(left: 16, right: 16),
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => News(
//                                       ind: index,
//                                     )));
//                       },
//                       child: ListTile(
//                         leading: ClipRRect(
//                             borderRadius: BorderRadius.circular(5),
//                             child: Image(
//                               image: AssetImage(
//                                   "assets/berita/" + newsImage[index]),
//                             )),
//                         title: Text(
//                           newsTitle[index],
//                           style: TextStyle(fontSize: 12),
//                           // textAlign: TextAlign.justify
//                         ),
//                       ),
//                     ),
//                     height: 80,
//                     margin: EdgeInsets.only(bottom: 13),
//                     padding: EdgeInsets.only(
//                         left: 24, top: 12, bottom: 12, right: 22),
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(15),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 10,
//                               spreadRadius: 1,
//                               offset: Offset(8.0, 8.0))
//                         ]),
//                   );
//                 }),
//           )
//         ],
//       ),
//     );
//   }
// }

class NewsHome extends StatefulWidget {
  @override
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  List<BeritaTerkini> dataBeritaTerkini;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Row(
              children: [
                Icon(Icons.notes, color: Colors.red),
                Text(
                  "  Berita Terkini",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 21.0,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w800,
                      color: Colors.black87),
                ),
              ],
            ),
          ),
          Container(
            child: FutureBuilder<List<BeritaTerkini>>(
                future: getBeritaTerkini(),
                builder:
                    (context, AsyncSnapshot<List<BeritaTerkini>> snapshot) {
                  if (snapshot.hasData == false) {
                    return SizedBox(
                      height: 200,
                      width: 100,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  dataBeritaTerkini = snapshot.data;
                  return Container(
                    child: Column(
                      children: [
                        ListView(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.all(16),
                            children: dataBeritaTerkini
                                .map((beritaTerkini) => Container(
                                      margin: EdgeInsets.only(bottom: 13),
                                      padding: EdgeInsets.only(
                                          left: 16,
                                          top: 16,
                                          bottom: 16,
                                          right: 16),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 5,
                                            )
                                          ]),
                                      child: ListTile(
                                          leading: Image.network(beritaTerkini
                                              .gambarBeritaTerkini),
                                          title: Text(
                                            beritaTerkini.judulBeritaTerkini,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    //Nanti dipilih berdasarkan index
                                                    builder: (context) =>
                                                        DetailBeritaTerkini(
                                                            beritaTerkini
                                                                .idBeritaTerkini)));
                                          }),
                                    ))
                                .toList()),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

Future<List<Notifikasi>> getNotifikasi(String user) async {
  final response = await client.rpc("getListNotifikasiBelumBayar",
      params: {'currentUser': user}).execute();

  final dataList = response.data as List;
  print(dataList);
  return dataList.map((map) => Notifikasi.fromJson(map)).toList();
}

Future<List<BeritaTerkini>> getBeritaTerkini() async {
  final response = await client.from("db_beritaTerkini").select("*").execute();

  final dataList = response.data as List;
  print(dataList);
  return dataList.map((map) => BeritaTerkini.fromJson(map)).toList();
}
