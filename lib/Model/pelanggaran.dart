class Pelanggaran {
  String noTilang;
  String jenisPelanggaran;
  String deskripsiPelanggaran;
  String fotoBuktiPelanggaran;
  String status;

  Pelanggaran(
      {this.noTilang,
      this.jenisPelanggaran,
      this.deskripsiPelanggaran,
      this.fotoBuktiPelanggaran,
      this.status});

  factory Pelanggaran.fromJson(Map<String, dynamic> map) {
    return Pelanggaran(
      noTilang: map['noTilang'],
      jenisPelanggaran: map['jenisPelanggaran'],
      deskripsiPelanggaran: map['deskripsiPelanggaran'],
      fotoBuktiPelanggaran: map['fotoBuktiPelanggaran'],
      status: map['status'],
    );
  }
}

Pelanggaran pelanggaran = new Pelanggaran();
