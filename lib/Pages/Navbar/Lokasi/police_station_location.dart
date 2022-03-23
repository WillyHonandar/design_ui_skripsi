import 'package:map_launcher/map_launcher.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class LokasiPolsekPengadilan extends StatelessWidget {
  List dataLokasiPolsekPengadilan = [
    {
      "namaPolice": "Pengadilan Negeri Jakarta Utara",
      "lokasiPolice": "Jl. Gajah Mada No.18, Jakarta Pusat (Lokasi Baru)",
      "latitude": -6.161439982722368,
      "longtitude": 106.81909422171115,
      "image": "pn-jakut.png",
      "group": "Pengadilan Jakarta Utara"
    },
    {
      "namaPolice": "Kejaksaan Negeri Jakarta Utara",
      "lokasiPolice": "Jl. Enggano No.1, Jakarta Utara",
      "latitude": -6.110501,
      "longtitude": 106.882552,
      "image": "kn-jakut.png",
      "group": "Kejaksaan Jakarta Utara"
    },
    {
      "namaPolice": "Metro Police Jakarta Utara",
      "lokasiPolice": "Jl. Yos Sudarso No.1, Jakarta Utara",
      "latitude": -6.116795,
      "longtitude": 106.893814,
      "image": "metropolice-jakut.png",
      "group": "Jakarta Utara"
    },
    {
      "namaPolice": "Polsek Tanjung Priok",
      "lokasiPolice": "Jl. Gorontalo Raya No.1, Jakarta Utara",
      "latitude": -6.115198,
      "longtitude": 106.880369,
      "image": "polsekpriok-jakut.png",
      "group": "Jakarta Utara"
    },
    {
      "namaPolice": "Polsek Penjaringan (Pluit)",
      "lokasiPolice": "Jl. Pluit Selatan Raya No.5A, Jakarta Utara",
      "latitude": -6.124898,
      "longtitude": 106.800843,
      "image": "polsekpluit-jakut.png",
      "group": "Jakarta Utara"
    },
    {
      "namaPolice": "Polsek Penjaringan (Kamal Muara)",
      "lokasiPolice": "Jl. Kamal Muara No.1, Jakarta Utara",
      "latitude": -6.095684,
      "longtitude": 106.718889,
      "image": "polsekmuara-jakut.png",
      "group": "Jakarta Utara"
    },
    {
      "namaPolice": "Polsek Pademangan",
      "lokasiPolice": "Jl. GOR Pademangan 3, Jakarta Utara",
      "latitude": -6.132323,
      "longtitude": 106.836944,
      "image": "polsekpademangan-jakut.png",
      "group": "Jakarta Utara"
    },
    {
      "namaPolice": "Polsek Cilincing",
      "lokasiPolice": "Jl. Sungai Landak, Jakarta Utara",
      "latitude": -6.101932,
      "longtitude": 106.939575,
      "image": "polsekcilincing-jakut.png",
      "group": "Jakarta Utara"
    },
    {
      "namaPolice": "Pengadilan Negeri Jakarta Barat",
      "lokasiPolice": "Jl. Letjen S. Parman No.Kav. 71, Jakarta Barat",
      "latitude": -6.193363,
      "longtitude": 106.797700,
      "image": "pn-jakbar.png",
      "group": "Pengadilan Jakarta Barat"
    },
    {
      "namaPolice": "Kejaksaan Negeri Jakarta Barat",
      "lokasiPolice": "Jl. Kembangan Raya No.19, Jakarta Barat",
      "latitude": -6.184476,
      "longtitude": 106.737256,
      "image": "kn-jakbar.png",
      "group": "Kejaksaan Jakarta Barat"
    },
    {
      "namaPolice": "Metro Police Jakarta Barat",
      "lokasiPolice": "Jl. Letjen S. Parman St No.31, Jakarta Barat",
      "latitude": -6.195026946556696,
      "longtitude": 106.79784477091548,
      "image": "metropolice-jakbar.png",
      "group": "Jakarta Barat"
    },
    {
      "namaPolice": "Kantor Polisi Tanjung Duren",
      "lokasiPolice": "Jl. Tanjung Duren Raya No.1, Jakarta Barat",
      "latitude": -6.173890748090517,
      "longtitude": 106.78921921984835,
      "image": "polsekduren-jakbar.png",
      "group": "Jakarta Barat"
    },
    {
      "namaPolice": "Polsek Kebon Jeruk",
      "lokasiPolice": "Jl. Raya Kb. Jeruk No.1, Jakarta Barat",
      "latitude": -6.198910171749825,
      "longtitude": 106.7648774508923,
      "image": "polsekjeruk-jakbar.png",
      "group": "Jakarta Barat"
    },
    {
      "namaPolice": "Polsek Tambora",
      "lokasiPolice": "Jl. Pangeran Tubagus Angke No.1, Jakarta Barat",
      "latitude": -6.143701,
      "longtitude": 106.791428,
      "image": "polsektambora-jakbar.png",
      "group": "Jakarta Barat"
    },
    {
      "namaPolice": "Polsek Metro Tamansari",
      "lokasiPolice": "Jl. Blustru No.17, Jakarta Barat",
      "latitude": -6.145234,
      "longtitude": 106.816648,
      "image": "polsektamansari-jakbar.png",
      "group": "Jakarta Barat"
    },
    {
      "namaPolice": "Polsek Cengkareng",
      "lokasiPolice": "Jl. Kamal Raya No.10, Jakarta Barat",
      "latitude": -6.146052,
      "longtitude": 106.729086,
      "image": "polsekcengkareng-jakbar.png",
      "group": "Jakarta Barat"
    },
    {
      "namaPolice": "Pengadilan Negeri Jakarta Selatan",
      "lokasiPolice": "Jl. Ampera Raya No.133, Jakarta Selatan",
      "latitude": -6.281577427911692,
      "longtitude": 106.81984512678923,
      "image": "pn-jaksel.png",
      "group": "Pengadilan Jakarta Selatan"
    },
    {
      "namaPolice": "Metro Police Jakarta Selatan",
      "lokasiPolice": "Jl. Wijaya II No.42, Jakarta Selatan",
      "latitude": -6.253333666647636,
      "longtitude": 106.7982574167397,
      "image": "metropolice-jaksel.png",
      "group": "Jakarta Selatan"
    },
    {
      "namaPolice": "Polsek Kabyoran Lama",
      "lokasiPolice": "Jl. Praja I No.1, Jakarta Selatan",
      "latitude": -6.249991425603795,
      "longtitude": 106.7784202090683,
      "image": "polsekkebayoranlama-jaksel.png",
      "group": "Jakarta Selatan"
    },
    {
      "namaPolice": "Polda Metro Jaya",
      "lokasiPolice": "Jl. Jend. Sudirman No.Kav. 55, Jakarta Selatan",
      "latitude": -6.222631350597648,
      "longtitude": 106.812432215803,
      "image": "poldametrojaya-jaksel.png",
      "group": "Jakarta Selatan"
    },
    {
      "namaPolice": "Polsek Cilandak",
      "lokasiPolice": "Jl. Caringin Utara No.1, Jakarta Selatan",
      "latitude": -6.283245,
      "longtitude": 106.793168,
      "image": "polsekcilandak-jaksel.png",
      "group": "Jakarta Selatan"
    },
    {
      "namaPolice": "Metro Police Kebayoran Baru",
      "lokasiPolice": "Jl. Kyai Maja No.62, Jakarta Selatan",
      "latitude": -6.2415639663693305,
      "longtitude": 106.78943197164209,
      "image": "metropolicekebayoranbaru-jaksel.png",
      "group": "Jakarta Selatan"
    },
    {
      "namaPolice": "Polsek Pesanggrahan",
      "lokasiPolice": "Jl. Bintaro Utara No.1, Jakarta Selatan",
      "latitude": -6.265512208239267,
      "longtitude": 106.75707754980982,
      "image": "polsekpesanggrahan-jaksel.png",
      "group": "Jakarta Selatan"
    },
    {
      "namaPolice": "Markas Besar Kepolisian Republik Indonesia (MABES POLRI)",
      "lokasiPolice": "Jl. Trunojoyo No.3, Jakarta Selatan",
      "latitude": -6.239206624595098,
      "longtitude": 106.80151865116592,
      "image": "mabespolri-jaksel.png",
      "group": "Jakarta Selatan"
    },
    {
      "namaPolice": "Polsek Kemang Pratama",
      "lokasiPolice": "Jl. Kemang Raya No.7, Jakarta Selatan",
      "latitude": -6.256151763545485,
      "longtitude": 106.81502446133766,
      "image": "polsekpratama-jaksel.png",
      "group": "Jakarta Selatan"
    },
    {
      "namaPolice": "Markas Besar Kepolisian Negara Republik",
      "lokasiPolice": "Jl. Ciputat Raya No.40, Jakarta Selatan",
      "latitude": -6.2876720539025115,
      "longtitude": 106.77068574264509,
      "image": "mbkr-jaksel.png",
      "group": "Jakarta Selatan"
    },
    {
      "namaPolice": "Pengadilan Negeri Jakarta Pusat",
      "lokasiPolice": "Jl. Bungur Besar Raya No.24, Jakarta Pusat",
      "latitude": -6.160210,
      "longtitude": 106.839146,
      "image": "pn-jakpus.png",
      "group": "Pengadilan Jakarta Pusat"
    },
    {
      "namaPolice": "Kepolisian Resor Metro Jakarta Pusat",
      "lokasiPolice": "Jl. Garuda No.2 (Blok 1), Jakarta Pusat",
      "latitude": -6.160656465762091,
      "longtitude": 106.85032616990549,
      "image": "resormetro-jakpus.png",
      "group": "Jakarta Pusat"
    },
    {
      "namaPolice": "Polsek Metro Tanah Abang",
      "lokasiPolice": "Jl. Penjernihan I No.8, Jakarta Pusat",
      "latitude": -6.20065161307727,
      "longtitude": 106.80954904828755,
      "image": "polsektanahabang-jakpus.png",
      "group": "Jakarta Pusat"
    },
    {
      "namaPolice": "Polsek Sawah Besar",
      "lokasiPolice": "Jl. Dr. Wahidin Raya No.8, Jakarta Pusat",
      "latitude": -6.170219229839221,
      "longtitude": 106.83894101930501,
      "image": "polseksawahbesar-jakpus.png",
      "group": "Jakarta Pusat"
    },
    {
      "namaPolice": "Polsek Metro Gambir",
      "lokasiPolice": "Jl. Cideng Bar. Dalam No.12 13 1, Jakarta Pusat",
      "latitude": -6.180987201090157,
      "longtitude": 106.81194503031327,
      "image": "polsekgambir-jakpus.png",
      "group": "Jakarta Pusat"
    },
    {
      "namaPolice": "Polsek Metro Menteng",
      "lokasiPolice": "Jl. Sutan Syahrir No.1, Jakarta Pusat",
      "latitude": -6.1965566458541375,
      "longtitude": 106.83839520687987,
      "image": "polsekmenteng-jakpus.png",
      "group": "Jakarta Pusat"
    },
    {
      "namaPolice": "Polsek Johar Baru",
      "lokasiPolice": "Jl. Tanah Tinggi Barat, Jakarta Pusat",
      "latitude": -6.182901557319276,
      "longtitude": 106.84935176554083,
      "image": "polsekjoharbaru-jakpus.png",
      "group": "Jakarta Pusat"
    },
    {
      "namaPolice": "Polsek Kemayoran",
      "lokasiPolice": "Jl. Landasan Pacu Selatan Ruas A5 No. 1, Jakarta Pusat",
      "latitude": -6.159326490612091,
      "longtitude": 106.85312281873708,
      "image": "polsekkemayoran-jakpus.png",
      "group": "Jakarta Pusat"
    },
    {
      "namaPolice": "Polsek Senen Pos Diponogoro",
      "lokasiPolice": "Jl. Pangeran Diponegoro No.88, Jakarta Pusat",
      "latitude": -6.196747941815696,
      "longtitude": 106.84862318331106,
      "image": "polseksenen-jakpus.png",
      "group": "Jakarta Pusat"
    },
    {
      "namaPolice": "Pengadilan Negeri Jakarta Timur",
      "lokasiPolice": "Jl. Dr. Sumarno No.1, Jakarta Timur",
      "latitude": -6.211950672401938,
      "longtitude": 106.94027627517927,
      "image": "pn-jaktim.png",
      "group": "Pengadilan Jakarta Timur"
    },
    {
      "namaPolice": "Polsek Metro Matraman",
      "lokasiPolice": "Jl. Pal Meriam Jl. Matraman Raya No.11, Jakarta Timur",
      "latitude": -6.199364434900574,
      "longtitude": 106.85432618347193,
      "image": "polsekmatraman-jaktim.png",
      "group": "Jakarta Timur"
    },
    {
      "namaPolice": "Polres Metro Jakarta Timur",
      "lokasiPolice": "Jl. Matraman Raya No.224, Jakarta Timur",
      "latitude": -6.214418078351536,
      "longtitude": 106.86301141590079,
      "image": "polresmetro-jaktim.png",
      "group": "Jakarta Timur"
    },
    {
      "namaPolice": "Polsek Jatinegara",
      "lokasiPolice": "Jl. Otista Raya No.1, Jakarta Timur",
      "latitude": -6.243842449169263,
      "longtitude": 106.86827179354039,
      "image": "polsekjatinegara-jaktim.png",
      "group": "Jakarta Timur"
    },
    {
      "namaPolice": "Polsek Ciracas Jakarta Timur",
      "lokasiPolice": "Jl. Raya Bogor KM.21 7 1, Jakarta Timur",
      "latitude": -6.290316395350446,
      "longtitude": 106.87183652183158,
      "image": "polsekciracas-jaktim.png",
      "group": "Jakarta Timur"
    },
    {
      "namaPolice": "Polsek Duren Sawit",
      "lokasiPolice": "Jl. Raya Kalimalang, Jakarta Timur",
      "latitude": -6.2476724753207415,
      "longtitude": 106.91740823620246,
      "image": "polsekdurensawit-jaktim.png",
      "group": "Jakarta Timur"
    },
    {
      "namaPolice": "Polsek Cipayung Jakarta Timur",
      "lokasiPolice": "Jl. Raya Mabes Hankam No.1, Jakarta Timur",
      "latitude": -6.308711698203118,
      "longtitude": 106.89971535258167,
      "image": "polsekcipayung-jaktim.png",
      "group": "Jakarta Timur"
    },
    {
      "namaPolice": "Polsek Cakung",
      "lokasiPolice": "Jl. Raya Bekasi KM.23 1 2 Cakung Barat, Jakarta Timur",
      "latitude": -6.184333207241184,
      "longtitude": 106.94062899495069,
      "image": "polsekcakung-jaktim.png",
      "group": "Jakarta Timur"
    },
    {
      "namaPolice": "Polsektro Makasar",
      "lokasiPolice": "Jl. Raya Pd. Gede No.25, Jakarta Timur",
      "latitude": -6.2910737152571405,
      "longtitude": 106.88452135915695,
      "image": "polsekmks-jaktim.png",
      "group": "Jakarta Timur"
    }
  ];

  openMapsSheet(context, String titlePolice, double lat, double long) async {
    try {
      // final coords = Coords(37.759392, -122.5107336);
      final coords = Coords(lat, long);
      final title = titlePolice;
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                        ),
                        title: Text(map.mapName),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: GroupedListView<dynamic, String>(
          elements: dataLokasiPolsekPengadilan,
          groupBy: (element) => element['group'],
          groupSeparatorBuilder: (String groupByValue) {
            return SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: double.infinity,
                height: 60,
                child: Center(
                  child: Text(
                    groupByValue,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
          itemBuilder: (context, dynamic element) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(
                onTap: () => openMapsSheet(context, element['namaPolice'],
                    element['latitude'], element['longtitude']),
                child: Card(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: ListTile(
                      title: Text(
                        element['namaPolice'],
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        element['lokasiPolice'],
                        style: TextStyle(fontSize: 12),
                      ),
                      leading: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: AssetImage("assets/" + element['image']),
                          ),
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          itemComparator: (item1, item2) =>
              item1['namaPolice'].compareTo(item2['namaPolice']), // optional
          useStickyGroupSeparators: true, // optional
          floatingHeader: false, // optional
          order: GroupedListOrder.ASC, // optional
        ),
      ),
    );
  }
}
