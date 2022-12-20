class trans {
  int id;
  String waktu;
  String namabarang;
  int subtotal;
  int qty;
  int total;
  int dibayar;
  int sisapembayaran;

  trans(
    this.id,
    this.waktu,
    this.namabarang,
    this.subtotal,
    this.qty,
    this.total,
    this.dibayar,
    this.sisapembayaran,
  );

  factory trans.fromJson(Map<String, dynamic> json) => trans(
        int.parse(json["kode_transaksi"]),
        json["waktu"],
        json["nama_barang"],
        int.parse(json["sub_total"]),
        int.parse(json["qty"]),
        int.parse(json["total"]),
        int.parse(json["dibayar"]),
        int.parse(json["sisa_pembayaran"]),
      );

  Map<String, dynamic> toJson() => {
        'id_pembeli': id.toString(),
        'waktu': waktu,
        'nama_barang': namabarang,
        'sub_total': subtotal.toString(),
        'qty': qty.toString(),
        'total': total.toString(),
        'dibayar': dibayar.toString(),
        'sisa_pembayaran': sisapembayaran.toString(),
      };
}
