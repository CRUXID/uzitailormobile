class fakturm {
  final String kode;
  final String waktu;
  final String namabrg;
  final String catatan;
  final String subtotal;
  final String qty;
  final String harga;
  final String total;
  final String dibayar;
  final String sisa;

  const fakturm({
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

  factory fakturm.fromJson(Map<String, dynamic> json) {
    return fakturm(
      kode: json["kode_transaksi"],
      waktu: json["waktu"],
      namabrg: json["nama_barang"],
      catatan: json["catatan"],
      subtotal: json["sub_total"],
      qty: json["qty"],
      harga: json["harga"],
      total: json["total"],
      dibayar: json["dibayar"],
      sisa: json["sisa_pembayaran"],
    );
  }

  // Map<String, dynamic> toJson() => {
  //       'kode_transaksi': kode,
  //       'waktu': waktu,
  //       'nama_barang': namabrg,
  //       'catatan': namabrg,
  //       'sub_total': subtotal.toString(),
  //       'qty': qty.toString(),
  //       'harga': harga.toString(),
  //       'total': total.toString(),
  //       'dibayar': dibayar.toString(),
  //       'sisa_pembayaran': sisa.toString(),
  //     };
}
