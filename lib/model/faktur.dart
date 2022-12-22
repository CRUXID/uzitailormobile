// To parse this JSON data, do
//
//     final fakturmodel = fakturmodelFromJson(jsonString);

import 'dart:convert';

Fakturmodel fakturmodelFromJson(String str) =>
    Fakturmodel.fromJson(json.decode(str));

String fakturmodelToJson(Fakturmodel data) => json.encode(data.toJson());

class Fakturmodel {
  Fakturmodel({
    required this.kodeTransaksi,
    required this.waktu,
    required this.total,
    required this.dibayar,
    required this.tglJadi,
    required this.barang,
  });

  String kodeTransaksi;
  String waktu;
  String total;
  String dibayar;
  String tglJadi;
  List<Barang> barang;

  factory Fakturmodel.fromJson(Map<String, dynamic> json) => Fakturmodel(
        kodeTransaksi: json["kode_transaksi"],
        waktu: json["waktu"],
        total: json["total"],
        dibayar: json["dibayar"],
        tglJadi: json["tgl_jadi"],
        barang:
            List<Barang>.from(json["barang"].map((x) => Barang.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kode_transaksi": kodeTransaksi,
        "waktu": "waktu",
        "total": total,
        "dibayar": dibayar,
        "tgl_jadi": "tgl_jadi",
        "barang": List<dynamic>.from(barang.map((x) => x.toJson())),
      };
}

class Barang {
  Barang({
    required this.namaBarang,
    required this.kodeBarang,
    required this.harga,
    required this.qty,
    required this.subTotal,
    required this.idPembeli,
    required this.catatan,
  });

  String namaBarang;
  String kodeBarang;
  String harga;
  String qty;
  String subTotal;
  String idPembeli;
  String catatan;

  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
        namaBarang: json["nama_barang"],
        kodeBarang: json["kode_barang"],
        harga: json["harga"],
        qty: json["qty"],
        subTotal: json["sub_total"],
        idPembeli: json["id_pembeli"],
        catatan: json["catatan"],
      );

  Map<String, dynamic> toJson() => {
        "nama_barang": namaBarang,
        "kode_barang": kodeBarang,
        "harga": harga,
        "qty": qty,
        "sub_total": subTotal,
        "id_pembeli": idPembeli,
        "catatan": catatan,
      };
}
