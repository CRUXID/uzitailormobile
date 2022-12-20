// To parse this JSON data, do
//
//     final trackstatus = trackstatusFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Trackstatus> trackstatusFromJson(String str) => List<Trackstatus>.from(
    json.decode(str).map((x) => Trackstatus.fromJson(x)));

String trackstatusToJson(List<Trackstatus> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Trackstatus {
  Trackstatus({
    required this.kodeTransaksi,
    required this.waktu,
    required this.total,
    required this.barang,
  });

  String kodeTransaksi;
  String waktu;
  String total;
  List<Barang> barang;

  factory Trackstatus.fromJson(Map<String, dynamic> json) => Trackstatus(
        kodeTransaksi: json["kode_transaksi"],
        waktu: json["waktu"],
        total: json["total"],
        barang:
            List<Barang>.from(json["barang"].map((x) => Barang.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kode_transaksi": kodeTransaksi,
        "waktu": waktu,
        "total": total,
        "barang": List<dynamic>.from(barang.map((x) => x.toJson())),
      };
}

class Barang {
  Barang({
    required this.namaBarang,
    required this.kodeBarang,
    required this.qty,
    required this.subTotal,
    required this.idPembeli,
  });

  String namaBarang;
  String kodeBarang;
  String qty;
  String subTotal;
  String idPembeli;

  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
        namaBarang: json["nama_barang"],
        kodeBarang: json["kode_barang"],
        qty: json["qty"],
        subTotal: json["sub_total"],
        idPembeli: json["id_pembeli"],
      );

  Map<String, dynamic> toJson() => {
        "nama_barang": namaBarang,
        "kode_barang": kodeBarang,
        "qty": qty,
        "sub_total": subTotal,
        "id_pembeli": idPembeli,
      };
}
