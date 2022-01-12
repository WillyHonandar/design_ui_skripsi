// import 'package:aplikasi_tilang_training/Model/pelanggaran.dart';
// import 'package:aplikasi_tilang_training/runner/main.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class PembayaranPage extends StatefulWidget {
//   @override
//   _PembayaranState createState() => _PembayaranState();
// }

// class _PembayaranState extends State<PembayaranPage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     pembayaranFunction();
//   }

//   @override
//   Widget build(BuildContext context) {
//     const numItem = 20;
//     const _biggerFont = TextStyle(fontSize: 18.0);

//     Widget _buildRow(String title, String deskripsi) {
//       return ListTile(
//         leading: CircleAvatar(
//           child: Text('$title'),
//         ),
//         title: Text(
//           'Denda $title',
//           style: _biggerFont,
//         ),
//         subtitle: Text('$deskripsi'),
//         trailing: const Icon(Icons.payment_outlined),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Pembayaran"),
//       ),

//       body: FutureBuilder<List<Pembayaran>>(
//           future: pembayaranFunction(),
//           builder: (context, AsyncSnapshot<List<Pembayaran>> snapshot) {
//             if (snapshot.hasData == false) {
//               return Center(child: CircularProgressIndicator());
//             }
//             return ListView(
//               children: snapshot.data
//                   .map((bayar) =>
//                       _buildRow(bayar.namaDenda, bayar.deskripsiDenda))
//                   .toList(),
//             );
//           }),

//       // body: FutureBuilder(
//       //   future: pembayaranFunction(),
//       //   builder: (context, bayar) {
//       //     return bayar.hasData
//       //         ? ListView.builder(
//       //             itemCount: 2,
//       //             itemBuilder: (context, index) {
//       //               if (index.isOdd) return const Divider();
//       //               final index2 = index ~/ 2 + 1;
//       //               // DocumentSnapshot bayarDenda = bayar.data.docs[index];
//       //               return _buildRow(pemb.namaDenda);
//       //             },
//       //           )
//       //         : Center(child: CircularProgressIndicator());
//       //   },
//       // ),
//     );

//     // return Scaffold(
//     //   appBar: AppBar(title: Text('Pembayaran')),
//     //   body: ListView.builder(
//     //     itemCount: numItem * 2,
//     //     padding: const EdgeInsets.all(16.0),
//     //     itemBuilder: (BuildContext, int i) {
//     //       if (i.isOdd) return const Divider();
//     //       final index = i ~/ 2 + 1;
//     //       return _buildRow(index);
//     //     },
//     //   ),
//     // );
//   }
// }

// Future<List<Pembayaran>> pembayaranFunction() async {
//   final response = await client.from('m_denda').select().execute();

//   final dataList = response.data as List;
//   print(dataList);
//   return dataList.map((map) => Pembayaran.fromJson(map)).toList();
// }
