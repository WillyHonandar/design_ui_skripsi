import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/riwayat.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/tilang_berlangsung.dart';
import 'package:aplikasi_tilang_training/runner/main.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_tilang_training/Model/kendaraan.dart';

class List_Tilang extends StatefulWidget {
  @override
  _List_TilangState createState() => _List_TilangState();
}

class _List_TilangState extends State<List_Tilang> {
  final List<Widget> pages = [RiwayatTilang(), TilangBerlangsung()];
  int _selectedIndexForTabBar = 0;

  void _onItemTappedForTabBar(int index) {
    setState(() {
      _selectedIndexForTabBar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabBar = new TabBar(
      labelColor: Colors.blue,
      onTap: _onItemTappedForTabBar,
      tabs: <Widget>[
        new Tab(
          text: "Riwayat Tilang",
        ),
        new Tab(
          text: "Tilang Berlangsung",
        ),
      ],
    );
    //6
    return new DefaultTabController(
        length: 2,
        child: new Scaffold(
            appBar: AppBar(
                bottom: tabBar,
                backgroundColor: Colors.white,
                title: Text('Tabs Demo')),

            //7
            body: Center(child: pages.elementAt(_selectedIndexForTabBar))));
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: FutureBuilder<List<Kendaraan>>(
//         future: getKendaraan(),
//         builder: (context, AsyncSnapshot<List<Kendaraan>> snapshot) {
//           if (snapshot.hasData == false) {
//             return Center(child: CircularProgressIndicator());
//           }
//           return ListView(
//             children: snapshot.data
//                 .map((kendaraan) => Column(
//                       children: [
//                         Text(kendaraan.noPlat),
//                         Text(kendaraan.noMesin),
//                         // Text(user.passwordUser),
//                         Text(kendaraan.statusTilang.toString())
//                       ],
//                     ))
//                 .toList(),
//           );
//         }),
//   );
// }

Future<List<Kendaraan>> getKendaraan() async {
  final response = await client
      .from('m_kendaraan')
      .select()
      .order('noMesin', ascending: true)
      .execute();

  final dataList = response.data as List;
  print(dataList);
  return dataList.map((map) => Kendaraan.fromJson(map)).toList();
}
