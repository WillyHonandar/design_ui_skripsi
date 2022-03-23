import 'package:aplikasi_tilang_training/Model/Content.dart';
import 'package:aplikasi_tilang_training/main.dart';
import 'package:flutter/material.dart';

class DetailBeritaTerkini extends StatelessWidget {
  int idBeritaTerkini;

  DetailBeritaTerkini(this.idBeritaTerkini);

  List<BeritaTerkini> dataBeritaTerkini;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("Berita Terkini", style: TextStyle(color: Colors.black)),
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        ),
        body: FutureBuilder<List<BeritaTerkini>>(
            future: getBeritaTerkini(idBeritaTerkini),
            builder: (context, AsyncSnapshot<List<BeritaTerkini>> snapshot) {
              if (snapshot.hasData == false) {
                return Center(child: CircularProgressIndicator());
              }
              dataBeritaTerkini = snapshot.data;
              return SingleChildScrollView(
                child: Container(
                  child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.all(16),
                      children: dataBeritaTerkini
                          .map(
                            (beritaTerkini) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 30),
                                  alignment: Alignment.center,
                                  child: Text(
                                      "Tak Berkutik dengan Tilang Elektronik",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 16),
                                  child: Center(
                                    child: Image.network(
                                        beritaTerkini.gambarBeritaTerkini,
                                        height: 200,
                                        width: 300),
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Card(
                                        child: InkWell(
                                          splashColor:
                                              Colors.blue.withAlpha(30),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 20),
                                                child: ListTile(
                                                    subtitle: Text(
                                                        beritaTerkini
                                                            .deskripsiBeritaTerkini,
                                                        textAlign:
                                                            TextAlign.justify)),
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
                          )
                          .toList()),
                ),
              );
            }));
  }
}

Future<List<BeritaTerkini>> getBeritaTerkini(int idBeritaTerkini) async {
  final response = await client.rpc("getBeritaTerkiniById",
      params: {'currentBeritaTerkini': idBeritaTerkini}).execute();

  final dataList = response.data as List;
  print(dataList);
  return dataList.map((map) => BeritaTerkini.fromJson(map)).toList();
}
