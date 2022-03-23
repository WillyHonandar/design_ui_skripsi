import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/riwayat.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/ListTilang/tilang_berlangsung.dart';
import 'package:aplikasi_tilang_training/main.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_tilang_training/Model/Kendaraan.dart';

class ListTilang extends StatefulWidget {
  @override
  _ListTilangState createState() => _ListTilangState();
}

class _ListTilangState extends State<ListTilang> {
  final List<Widget> pages = [TilangBerlangsung(), RiwayatTilang()];
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
          text: "Tilang Berlangsung",
        ),
        new Tab(
          text: "Riwayat Tilang",
        ),
      ],
    );
    //6
    return new DefaultTabController(
        length: 2,
        child: new Scaffold(
            appBar: AppBar(
              title: tabBar,
              // bottom: tabBar,
              automaticallyImplyLeading: false,
              backgroundColor: Color.fromRGBO(245, 245, 245, 1),
            ),

            //7
            body: Center(child: pages.elementAt(_selectedIndexForTabBar))));
  }
}
