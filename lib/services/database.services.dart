import 'package:fluttertoast/fluttertoast.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupaBaseHandler {
  static String supaBaseURL = "https://niwotqzfokmbcnwjkqol.supabase.co";
  static String supaBaseKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzMzU4NzUxMiwiZXhwIjoxOTQ5MTYzNTEyfQ.qLsfrpnKIfL0zK9_HqhhCVIGKKY95RqbF7Bb2cnTXW4";

  final client = SupabaseClient(supaBaseURL, supaBaseKey);

  addData(
      String platNomor, String nomorMesinKendaraan, bool jenisKendaraan) async {
    var response = client.from("List_Kendaraan_User").insert({
      'plat_nomor_kendaraan': platNomor,
      'nomor_mesin_kendaraan': nomorMesinKendaraan,
      'tipe_kendaraan': jenisKendaraan
    }).execute();
    print(response);
  }

  readData() async {
    var response = await client
        .from("table")
        .select()
        .order('plat_nomor_kendaraan', ascending: true)
        .execute();
    print(response);

    final dataList = response.data as List;
    return dataList;
  }

  updateData() async {}

  deleteData() async {}
}

class DatabaseService {
  static String supaBaseURL = "https://niwotqzfokmbcnwjkqol.supabase.co";
  static String supaBaseKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzMzU4NzUxMiwiZXhwIjoxOTQ5MTYzNTEyfQ.qLsfrpnKIfL0zK9_HqhhCVIGKKY95RqbF7Bb2cnTXW4";

  final client = SupabaseClient(supaBaseURL, supaBaseKey);

  //Fetching Data
  Future fetchVechicle() async {
    try {
      var response =
          await client.from("List_Kendaraan_User").select().execute();
      print(response.data);
    } catch (e) {
      Fluttertoast.showToast(msg: "$e");
    }
  }

//Creating Data
  Future addVehicle({
    String platNomorKendaraan,
    String nomorKendaraanMesin,
    bool tipeKendaraan,
  }) async {
    try {
      var response = await client.from("List_Kendaraan_User").insert({
        "tipe_kendaraan": tipeKendaraan,
        "plat_nomor_kendaraan": platNomorKendaraan,
        "nomor_kendaraan_mesin": nomorKendaraanMesin,
      }).execute();
      if (response.data != null) {
        print(response.data);
      } else {
        print(response.error);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "$e");
    }
  }
}
