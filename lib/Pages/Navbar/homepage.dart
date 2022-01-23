import 'dart:async';

import 'package:aplikasi_tilang_training/Model/notification.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/police_station_location.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/Content/content.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/list_tilang.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/Notification/notifications_page.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/settings.dart';
import 'package:aplikasi_tilang_training/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'Content/news.dart';
import 'package:carousel_pro/carousel_pro.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> pages = [
    Home(),
    ListTilang(),
    MapLauncherDemo(),
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
                backgroundColor: Colors.white,
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
                        padding: EdgeInsets.only(top: 8),
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
              // appBar: AppBar(
              //   leading: Container(
              //       margin: EdgeInsets.only(left: 10),
              //       child: Image.asset('assets/etle-homeicon.png')),
              //   backgroundColor: Colors.transparent,
              //   elevation: 0,
              //   actions: <Widget>[
              //     Stack(
              //       children: <Widget>[
              //         Padding(
              //           padding: const EdgeInsets.only(right: 24.0),
              //           child: IconButton(
              //             icon: Icon(Icons.notifications),
              //             iconSize: 32.0,
              //             color: Colors.black,
              //             onPressed: () {
              //               setState(() {
              //                 counter = 0;
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) => NotificationsList()));
              //               });
              //             },
              //           ),
              //         ),
              //         counter != 0
              //             ? Positioned(
              //                 right: 30,
              //                 top: 8,
              //                 child: Container(
              //                   padding: EdgeInsets.all(2),
              //                   decoration: new BoxDecoration(
              //                     color: Colors.red,
              //                     borderRadius: BorderRadius.circular(6),
              //                   ),
              //                   constraints: BoxConstraints(
              //                     minWidth: 14,
              //                     minHeight: 14,
              //                   ),
              //                   child: Text(
              //                     '$counter',
              //                     style: TextStyle(
              //                       color: Colors.white,
              //                       fontSize: 8,
              //                     ),
              //                     textAlign: TextAlign.center,
              //                   ),
              //                 ),
              //               )
              //             : Container()
              //       ],
              //     )
              //   ],
              // ),
              body: SingleChildScrollView(
                child: Column(children: [
                  // SearchBar(),
                  // NearestPoliceStation(),
                  CekPengetahuan(),
                  NewsHomepage(),
                ]),
              ),
              // floatingActionButton: FloatingActionButton(
              //   onPressed: () {
              //     print("Increment Counter");
              //     setState(() {
              //       counter++;
              //     });
              //   },
              //   child: Icon(Icons.add),
              // ),
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

// class NearestPoliceStation extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 35),
//         height: 100,
//         width: 400,
//         decoration: BoxDecoration(
//           image: DecorationImage(image: AssetImage("assets/etle-logo.png")),
//           borderRadius: BorderRadius.circular(5),
//           border: Border.all(color: Colors.black, width: 2),
//         ),
//       ),
//       onTap: () {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => MapLauncherDemo()));
//       },
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
                Icon(Icons.lightbulb_rounded),
                Text(
                  "  Cek Pengetahuan",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 21.0,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                ),
              ],
            ),
          ),

          /// disini tambah nya
          Container(
            color: Colors.yellow,
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
                  child: Image(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(
                        "assets/cek_pengetahuan/CekPengetahuan-01.jpg"),
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
                  child: Image(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(
                        "assets/cek_pengetahuan/CekPengetahuan-02.jpg"),
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
                  child: Image(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(
                        "assets/cek_pengetahuan/CekPengetahuan-03.jpg"),
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
                  child: Image(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(
                        "assets/cek_pengetahuan/CekPengetahuan-04.jpg"),
                  ),
                ),
              ],
            ),
          ),

          // Container(
          //   margin: EdgeInsets.only(left: 30),
          //   height: 100,
          //   child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: cekPengetahuan.length,
          //       itemBuilder: (context, index) {
          //         return InkWell(
          //             onTap: () {
          //               Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (context) => Content(
          //                             ind: index,
          //                           )));
          //             },
          //             child: Container(
          //                 margin: EdgeInsets.only(left: 10),

          //                 // decoration: BoxDecoration(
          //                 //   border: Border(
          //                 //     top: BorderSide(
          //                 //         width: 1.0, color: Color(0xFFFFFFFF)),
          //                 //     left: BorderSide(
          //                 //         width: 1.0, color: Color(0xFFFFFFFF)),
          //                 //     right: BorderSide(
          //                 //         width: 1.0, color: Color(0xFF000000)),
          //                 //     bottom: BorderSide(
          //                 //         width: 1.0, color: Color(0xFF000000)),
          //                 //   ),
          //                 // ),
          //                 width: 300,
          //                 child: ClipRRect(
          //                     borderRadius: BorderRadius.circular(10),
          //                     child: Image(
          //                       image: AssetImage("assets/cek_pengetahuan/" +
          //                           cekPengetahuan[index]),
          //                     ))
          //                 // child: Image(
          //                 //   image: AssetImage("assets/cek_pengetahuan/" +
          //                 //       cekPengetahuan[index]),
          //                 // )
          //                 ));
          //       }),
          // )
        ],
      ),
    );
  }
}

class NewsHomepage extends StatelessWidget {
  List newsImage = [
    "berita1.jpeg",
    "berita2.jpeg",
    "berita3.jpeg",
    "berita4.jpeg"
  ];
  List newsTitle = [
    "Tilang Manual, ETLE, dan Tilang Elektronik Mobile, Apa Bedanya?",
    "Polda Metro Tindak Pelanggar Ganjil Genap di Jakarta Lewat ETLE dan Tilang Manual",
    "Ini Jenis Pelanggaran ETLE yang Paling Banyak Dilanggar Masyarakat",
    "Tak Berkutik dengan Tilang Elektronik"
  ];

  List newsDesc = [
    "aosdhjijaasdshjd",
    "asdbausgdasdhads",
    "asouhdiuashduih",
    "aoshdjoashdihasdasd"
  ];

  NewsHomepage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
            child: Row(
              children: [
                Icon(Icons.notes),
                Text(
                  "  Berita Terkini",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 21.0,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                ),
              ],
            ),
          ),

          Container(
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: newsImage.length,
                padding: EdgeInsets.only(left: 16, right: 16),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => News(
                                      ind: index,
                                    )));
                      },
                      child: ListTile(
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image(
                              image: AssetImage(
                                  "assets/berita/" + newsImage[index]),
                            )),
                        title: Text(
                          newsTitle[index],
                          style: TextStyle(fontSize: 12),
                          // textAlign: TextAlign.justify
                        ),
                      ),
                    ),
                    height: 80,
                    margin: EdgeInsets.only(bottom: 13),
                    padding: EdgeInsets.only(
                        left: 24, top: 12, bottom: 12, right: 22),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: Offset(8.0, 8.0))
                        ]),
                  );
                }),
          )

          // Container(
          //   height: 220,
          //   margin: EdgeInsets.symmetric(horizontal: 24),
          //   child: ListView.builder(
          //       scrollDirection: Axis.vertical,
          //       itemCount: newsImage.length,
          //       itemBuilder: (context, index) {
          //         return Card(
          //           elevation: 5,
          //           child: InkWell(
          //             onTap: () {
          //               Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (context) => News(
          //                             ind: index,
          //                           )));
          //             },
          //             splashColor: Colors.blue.withAlpha(30),
          //             child: Column(
          //               mainAxisSize: MainAxisSize.min,
          //               children: <Widget>[
          //                 Container(
          //                   margin: EdgeInsets.symmetric(
          //                       horizontal: 10, vertical: 20),
          //                   child: ListTile(
          //                     leading: ClipRRect(
          //                         borderRadius: BorderRadius.circular(5),
          //                         child: Image(
          //                           image: AssetImage(
          //                               "assets/berita/" + newsImage[index]),
          //                         )),
          //                     title: Text(
          //                       newsTitle[index],
          //                       style: TextStyle(fontSize: 12),
          //                       // textAlign: TextAlign.justify
          //                     ),
          //                   ),
          //                   // subtitle: Text(newsDesc[index],
          //                   //     textAlign: TextAlign.justify)),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         );
          //       }),
          // ),

          // berita(
          //     image: "assets/berita/berita1.jpeg",
          //     title: "Peraturan Terbaru ETLE",
          //     date: "20 Agustus 2021"),
          // berita(
          //     image: "assets/etle-homeicon.png",
          //     title: "Peraturan Terbaru ETLE",
          //     date: "20 Agustus 2021"),
          // berita(
          //     image: "assets/etle-homeicon.png",
          //     title: "Peraturan Terbaru ETLE",
          //     date: "20 Agustus 2021")
        ],
      ),
    );
  }
}

// Widget berita({image, title, date}) {
//   return Container(
//     height: 70,
//     padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
//     margin: EdgeInsets.only(top: 20, left: 50, right: 35),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(5),
//       color: Colors.green,
//     ),
//     child: Row(
//       children: [
//         Row(
//           children: [
//             Container(
//               height: 57,
//               width: 60,
//               decoration: BoxDecoration(
//                   image: DecorationImage(image: AssetImage(image))),
//             ),
//             SizedBox(width: 13),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [Text(title), Text(date)],
//             )
//           ],
//         )
//       ],
//     ),
//   );
// }

Future<List<Notifikasi>> getNotifikasi(String user) async {
  final response = await client.rpc("getListNotifikasiBelumBayar",
      params: {'currentUser': user}).execute();

  final dataList = response.data as List;
  print(dataList);
  return dataList.map((map) => Notifikasi.fromJson(map)).toList();
}
