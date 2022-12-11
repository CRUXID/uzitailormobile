class trx {
  String namabarang;
  String qty;
  String harga;

  trx(
    this.qty,
    this.namabarang,
    this.harga,
  );

  factory trx.fromJson(Map<String, dynamic> json) => trx(
        json["qty"],
        json["nama_barang"],
        json["harga"],
      );

  Map<String, dynamic> toJson() => {
        'qty': qty,
        'nama_barang': namabarang,
        'harga': harga,
      };
}
