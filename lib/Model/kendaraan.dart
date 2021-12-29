class Kendaraan {
  String noMesin;
  String noPlat;
  bool statusTilang;

  Kendaraan({this.noMesin, this.noPlat, this.statusTilang});

  factory Kendaraan.fromJson(Map<String, dynamic> map) {
    return Kendaraan(
        noMesin: map['noMesin'],
        noPlat: map['noPlat'],
        statusTilang: map['statusTilang'] as bool);

    // passwordUser: map['passwordUser'],
    // phoneUser: map['phoneUser']);
  }
}

Kendaraan kend = new Kendaraan();
