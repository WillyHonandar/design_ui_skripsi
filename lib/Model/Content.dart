class BeritaTerkini {
  int idBeritaTerkini;
  String judulBeritaTerkini;
  String deskripsiBeritaTerkini;
  String gambarBeritaTerkini;

  BeritaTerkini(
      {this.idBeritaTerkini,
      this.judulBeritaTerkini,
      this.deskripsiBeritaTerkini,
      this.gambarBeritaTerkini});

  factory BeritaTerkini.fromJson(Map<String, dynamic> map) {
    return BeritaTerkini(
        idBeritaTerkini: map['idBeritaTerkini'],
        judulBeritaTerkini: map['judulBeritaTerkini'],
        deskripsiBeritaTerkini: map['deskripsiBeritaTerkini'],
        gambarBeritaTerkini: map['gambarBeritaTerkini']);
  }
}

BeritaTerkini beritaTerkini = new BeritaTerkini();
