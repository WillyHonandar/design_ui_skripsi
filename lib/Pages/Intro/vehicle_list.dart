import 'package:flutter/material.dart';

class RegisteredVehicles extends StatefulWidget {
  @override
  _RegisteredVehiclesState createState() => _RegisteredVehiclesState();
}

class _RegisteredVehiclesState extends State<RegisteredVehicles> {
  bool hasError = false;
  String currentText = "";

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController _nomorMesinKendaraanController =
      TextEditingController();

  List<int> list = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("List Kendaraan"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Halo Alessandro",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "Anda Memiliki total .. kendaraan!",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 350,
                  child: Scrollbar(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 4,
                        padding: EdgeInsets.only(top: 20),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(left: 15),
                            margin: EdgeInsets.only(right: 20, bottom: 20),
                            height: 80,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 2.0, color: Colors.blue[800]),
                            ),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Colors.purple),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    SizedBox(
                                      width: 13,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Plat Nomor"),
                                          Text("Nomor Mesin Kendaraan")
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top: 60),
                  padding: EdgeInsets.only(top: 3, left: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    children: [
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {},
                        color: Colors.blue,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Simpan Kendaraan",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {},
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.blue, width: 2),
                          ),
                          child: Text(
                            "Edit Kendaraan",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
