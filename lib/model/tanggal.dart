class tanggal {
  String tgl;

  tanggal(
    this.tgl,
  );

  factory tanggal.fromJson(Map<String, dynamic> json) => tanggal(
        json["tanggal"],
      );

  Map<String, dynamic> toJson() => {
        'tanggal': tgl,
      };
}
