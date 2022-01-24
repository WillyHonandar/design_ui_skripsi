class Pelanggaran {
  int idPelanggaran;
  String noTilang;
  String jenisPelanggaran;
  String jumlahPembayaran;
  String deskripsiPelanggaran;
  String fotoBuktiPelanggaran;
  String tanggalPelanggaran;
  String status;
  String alasanBukan;
  String jenisKendaraan;
  String noPlat;
  String noMesin;
  String noVirtualAccount;

  Pelanggaran(
      {this.idPelanggaran,
      this.noTilang,
      this.jenisPelanggaran,
      this.jumlahPembayaran,
      this.deskripsiPelanggaran,
      this.fotoBuktiPelanggaran,
      this.tanggalPelanggaran,
      this.status,
      this.alasanBukan,
      this.jenisKendaraan,
      this.noPlat,
      this.noMesin,
      this.noVirtualAccount});

  factory Pelanggaran.fromJson(Map<String, dynamic> map) {
    return Pelanggaran(
        idPelanggaran: map['idPelanggaran'],
        noTilang: map['noTilang'],
        jenisPelanggaran: map['jenisPelanggaran'],
        jumlahPembayaran: map['jumlahPembayaran'],
        deskripsiPelanggaran: map['deskripsiPelanggaran'],
        fotoBuktiPelanggaran: map['fotoBuktiPelanggaran'],
        tanggalPelanggaran: map['tanggalPelanggaran'],
        status: map['status'],
        alasanBukan: map['alasanBukan'],
        jenisKendaraan: map['jenisKendaraan'],
        noPlat: map['noPlat'],
        noMesin: map['noMesin'],
        noVirtualAccount: map['noVirtualAccount']);
  }
}

Pelanggaran pelanggaran = new Pelanggaran();
