class User {
  int id;
  String username;
  String nama;
  String alamat;
  String nohp;
  String password;

  User(
    this.id,
    this.nama,
    this.alamat,
    this.nohp,
    this.username,
    this.password,
  );

  factory User.fromJson(Map<String, dynamic> json) => User(
        int.parse(json["id_pembeli"]),
        json["nama_pembeli"],
        json["alamat"],
        json["no_hp"],
        json["username"],
        json["password"],
      );

  Map<String, dynamic> toJson() => {
        'id_pembeli': id.toString(),
        'nama_pembeli': nama,
        'alamat': alamat,
        'no_hp': nohp,
        'username': username,
        'password': password,
      };
}
