class barang {
  String kodebrg;
  String namabarang;
  int harga;

  barang(
    this.kodebrg,
    this.namabarang,
    this.harga,
  );

  factory barang.fromJson(Map<String, dynamic> json) => barang(
        json["kode_barang"],
        json["nama_barang"],
        int.parse(json["harga"]),
      );

  Map<String, dynamic> toJson() => {
        'waktu': kodebrg,
        'nama_barang': namabarang,
        'harga': harga.toString(),
      };
}
