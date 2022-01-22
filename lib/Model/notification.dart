class Notifikasi {
  int idPelanggaran;
  int idNotifikasi;
  String jenisNotifikasi;
  String dekripsiNotifikasi;
  String status;
  String noTilang;
  String statusNotifikasi;
  int countNotif;

  Notifikasi(
      {this.idPelanggaran,
      this.idNotifikasi,
      this.jenisNotifikasi,
      this.dekripsiNotifikasi,
      this.status,
      this.noTilang,
      this.statusNotifikasi});

  factory Notifikasi.fromJson(Map<String, dynamic> map) {
    return Notifikasi(
      idPelanggaran: map['idPelanggaran'],
      idNotifikasi: map['idNotifikasi'],
      jenisNotifikasi: map['jenisNotifikasi'],
      dekripsiNotifikasi: map['deskripsiNotifikasi'],
      status: map['status'],
      noTilang: map['noTilang'],
      statusNotifikasi: map['statusNotifikasi'],
    );
  }
}

Notifikasi notif = new Notifikasi();
