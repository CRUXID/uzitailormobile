part of 'pages.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  var loading = false;
  late String id;
  var kodeTRX = Get.arguments;
  dynamic history;
  User? currentUserInfo;

  Future<dynamic> _ambildataRiwayat() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userinfo = preferences.getString("currentUser");
    if (userinfo != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userinfo);
      currentUserInfo = User.fromJson(userDataMap);
      setState(() {
        id = currentUserInfo?.id.toString() ?? "";
      });
    }
    final response = await http.post(Uri.parse(API.selectRiwayat),
        body: {"id_pembeli": id, "kode_transaksi": Get.arguments[0]});
    if (response.statusCode == 200) {
      history = jsonDecode(response.body);
      loading = false;
      return history;
    }
  }

  @override
  void initState() {
    _ambildataRiwayat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Riwayat"),
          centerTitle: true,
          backgroundColor: SecondaryColor,
        ),
        body: Container(
          child: FutureBuilder(
              future: _ambildataRiwayat(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("Error"));
                } else if (history != null) {
                  return Center(
                      child: Container(
                          child: ListView(
                    padding: const EdgeInsets.all(10),
                    children: <Widget>[
                      Text(
                        'No transaksi : ' + history['kode_transaksi'],
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        color: FifthColor,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Pembayaran DP',
                                style: TextStyle(
                                    color: SixthColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14)),
                            Text('Waktu Pembayaran DP',
                                style: TextStyle(
                                    color: SixthColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14)),
                          ]),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Rp.${history['total']}',
                                style: TextStyle(
                                    color: SixthColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                            Text(history['waktu'],
                                style: TextStyle(
                                    color: SixthColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                          ]),
                      SizedBox(
                        height: 13,
                      ),
                      Divider(
                        color: FifthColor,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        "Rincian Pembeli",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: SixthColor),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        currentUserInfo?.nama.toString() ?? "",
                        style: TextStyle(
                            color: SixthColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        currentUserInfo?.nohp.toString() ?? "",
                        style: TextStyle(
                            color: SixthColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        currentUserInfo?.alamat.toString() ?? "",
                        style: TextStyle(
                            color: SixthColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 12),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Divider(
                        color: FifthColor,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        "Rincian Pesanan",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: SixthColor,
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Column(
                        children: [
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: history['barang'].length,
                              itemBuilder: (context, index) {
                                return Column(children: <Widget>[
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            history['barang'][index]
                                                ['nama_barang'],
                                            style: TextStyle(
                                                color: SixthColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12)),
                                        Text(
                                            'x.${history['barang'][index]['qty']}',
                                            style: TextStyle(
                                                color: FifthColor,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12)),
                                      ]),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text('Catatan : ',
                                                style: TextStyle(
                                                    color: FifthColor,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 12)),
                                            Text(
                                                history['barang'][index]
                                                        ['catatan'] ??
                                                    " - ",
                                                style: TextStyle(
                                                    color: FifthColor,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 12)),
                                          ],
                                        ),
                                        Text(history['barang'][index]['harga'],
                                            style: TextStyle(
                                                color: FifthColor,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12)),
                                      ]),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                            'Rp. ' +
                                                history['barang'][index]
                                                    ['sub_total'],
                                            style: TextStyle(
                                                color: SixthColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12))
                                      ]),
                                ]);
                              }),
                        ],
                      ),
                      Divider(
                        color: FifthColor,
                        thickness: 1,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Subtotal Barang',
                                style: TextStyle(
                                    color: FifthColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14)),
                            Text(history['total'],
                                style: TextStyle(
                                    color: FifthColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14)),
                          ]),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Pembayaran DP',
                                style: TextStyle(
                                    color: FifthColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14)),
                            Text(history['dibayar'],
                                style: TextStyle(
                                    color: FifthColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14)),
                          ]),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Pembayaran',
                                style: TextStyle(
                                    color: SixthColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14)),
                            Text(history['dibayar'],
                                style: TextStyle(
                                    color: SixthColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14)),
                          ]),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: FifthColor,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Waktu Pemesanan',
                                style: TextStyle(
                                    color: FifthColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14)),
                            Text(history['waktu'],
                                style: TextStyle(
                                    color: FifthColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14)),
                          ]),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Waktu Pembayaran DP',
                                style: TextStyle(
                                    color: FifthColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14)),
                            Text(history['waktu'],
                                style: TextStyle(
                                    color: FifthColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14)),
                          ]),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Waktu Barang Selesai',
                                style: TextStyle(
                                    color: FifthColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14)),
                            Text(history['tgl_jadi'],
                                style: TextStyle(
                                    color: FifthColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14)),
                          ]),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Waktu Pembayaran Selesai',
                                style: TextStyle(
                                    color: FifthColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14)),
                            Text(history['tgl_jadi'],
                                style: TextStyle(
                                    color: FifthColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14)),
                          ]),
                    ],
                  )));
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ));
  }
}
