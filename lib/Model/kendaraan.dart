class Kendaraan {
  int idKendaraan;
  String noMesin;
  String noPlat;
  String jenisKendaraan;

  Kendaraan({this.idKendaraan, this.noMesin, this.noPlat, this.jenisKendaraan});

  factory Kendaraan.fromJson(Map<String, dynamic> map) {
    return Kendaraan(
        idKendaraan: map['idKendaraan'],
        noMesin: map['noMesin'],
        noPlat: map['noPlat'],
        jenisKendaraan: map['jenisKendaraan']);
  }
}

Kendaraan kend = new Kendaraan();
