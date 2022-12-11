class riwayat {
  final String kode;
  final String waktu;
  final String namabrg;
  final String catatan;
  final int subtotal;
  final int qty;
  final int harga;
  final int total;
  final int dibayar;
  final int sisa;

  const riwayat({
    required this.kode,
    required this.waktu,
    required this.namabrg,
    required this.catatan,
    required this.subtotal,
    required this.qty,
    required this.harga,
    required this.total,
    required this.dibayar,
    required this.sisa,
  });

  factory riwayat.fromJson(Map<String, dynamic> json) {
    return riwayat(
      kode: json["kode_transaksi"],
      waktu: json["waktu"],
      namabrg: json["nama_barang"],
      catatan: json["catatan"],
      subtotal: int.parse(json["sub_total"]),
      qty: int.parse(json["qty"]),
      harga: int.parse(json["harga"]),
      total: int.parse(json["total"]),
      dibayar: int.parse(json["dibayar"]),
      sisa: int.parse(json["sisa_pembayaran"]),
    );
  }
}
