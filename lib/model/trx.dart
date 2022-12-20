class trx {
  String kodebrg;
  String namabarang;
  String qty;
  String harga;

  trx(
    this.kodebrg,
    this.qty,
    this.namabarang,
    this.harga,
  );

  factory trx.fromJson(Map<String, dynamic> json) => trx(
        json["kode_barang"],
        json["qty"],
        json["nama_barang"],
        json["harga"],
      );

  Map<String, dynamic> toJson() => {
        'kode_barang': kodebrg,
        'qty': qty,
        'nama_barang': namabarang,
        'harga': harga,
      };
}
