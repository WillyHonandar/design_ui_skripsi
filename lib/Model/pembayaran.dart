class Pembayaran {
  String namaDenda;
  String deskripsiDenda;

  Pembayaran({this.namaDenda, this.deskripsiDenda});

  factory Pembayaran.fromJson(Map<String, dynamic> map) {
    return Pembayaran(
      namaDenda: map['namaDenda'],
      deskripsiDenda: map['deskripsiDenda'],
    );

    // passwordUser: map['passwordUser'],
    // phoneUser: map['phoneUser']);
  }
}

Pembayaran pemb = new Pembayaran();
