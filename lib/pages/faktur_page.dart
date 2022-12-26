part of 'pages.dart';

class faktur extends StatefulWidget {
  State<faktur> createState() => _fakturState();
}

class _fakturState extends State<faktur> {
  late String id;
  var loading = false;
  var argument = Get.arguments;
  dynamic faktur;
  User? currentUserInfo;

  Future<dynamic> _ambildata1() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userinfo = preferences.getString("currentUser");
    if (userinfo != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userinfo);
      currentUserInfo = User.fromJson(userDataMap);
      setState(() {
        id = currentUserInfo?.id.toString() ?? "";
      });
    }
    final response = await http.post(Uri.parse(API.selectfaktur),
        body: {"id_pembeli": id, "kode_transaksi": Get.arguments[0]});
    if (response.statusCode == 200) {
      faktur = jsonDecode(response.body);
      loading = false;
      print(faktur);
      return faktur;
    }
  }

  @override
  void initState() {
    _ambildata1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Faktur"),
          centerTitle: true,
          backgroundColor: SecondaryColor,
        ),
        body: Container(
          child: FutureBuilder(
              future: _ambildata1(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Center(
                    child: Container(
                      child: ListView(
                          padding: const EdgeInsets.all(10),
                          children: <Widget>[
                            Text(
                              'No transaksi : ' + faktur['kode_transaksi'],
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Rp.${faktur['total']}',
                                      style: TextStyle(
                                          color: SixthColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                  Text(faktur['waktu'],
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
                                    itemCount: faktur['barang'].length,
                                    itemBuilder: (context, index) {
                                      return Column(children: <Widget>[
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  faktur['barang'][index]
                                                      ['nama_barang'],
                                                  style: TextStyle(
                                                      color: SixthColor,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12)),
                                              Text(
                                                  'x.${faktur['barang'][index]['qty']}',
                                                  style: TextStyle(
                                                      color: FifthColor,
                                                      fontWeight:
                                                          FontWeight.w300,
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
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 12)),
                                                  Text(
                                                      faktur['barang'][index]
                                                              ['catatan'] ??
                                                          " - ",
                                                      style: TextStyle(
                                                          color: FifthColor,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 12)),
                                                ],
                                              ),
                                              Text(
                                                  faktur['barang'][index]
                                                      ['harga'],
                                                  style: TextStyle(
                                                      color: FifthColor,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 12)),
                                            ]),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                  'Rp. ' +
                                                      faktur['barang'][index]
                                                          ['sub_total'],
                                                  style: TextStyle(
                                                      color: SixthColor,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Subtotal Barang',
                                      style: TextStyle(
                                          color: FifthColor,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14)),
                                  Text(faktur['total'],
                                      style: TextStyle(
                                          color: FifthColor,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14)),
                                ]),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total Pembayaran DP',
                                      style: TextStyle(
                                          color: FifthColor,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14)),
                                  Text(faktur['dibayar'],
                                      style: TextStyle(
                                          color: FifthColor,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14)),
                                ]),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total Pembayaran',
                                      style: TextStyle(
                                          color: SixthColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14)),
                                  Text(faktur['dibayar'],
                                      style: TextStyle(
                                          color: SixthColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14)),
                                ]),
                            SizedBox(
                              height: 20,
                            ),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(1),
                                child: BarcodeWidget(
                                  barcode: Barcode.code128(),
                                  data: argument[0],
                                  drawText: false,
                                  width: double.infinity,
                                  height: 60,
                                )),
                          ]),
                    ),
                  );
                }
              }),
        ));
  }
}
