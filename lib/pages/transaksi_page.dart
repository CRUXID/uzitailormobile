part of 'pages.dart';

class Transaksi extends StatefulWidget {
  const Transaksi({super.key});

  @override
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  final _formkey = GlobalKey<FormState>();

  String? _namabarang;
  String? selected2;
  String? kode;
  List data = [];
  List<trx> dataTransaksi = [];
  int totaltransaksi = 0;
  List<dynamic> databarang = [];
  late String id;
  var dateNow = DateTime.now();
  var kodetrx = DateFormat('yyMMddhhmmss').format(DateTime.now());
  var kooode = '';

  inserttrx() async {
    User? currentUserInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userinfo = preferences.getString("currentUser");
    if (userinfo != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userinfo);
      currentUserInfo = User.fromJson(userDataMap);
      setState(() {
        id = currentUserInfo?.id.toString() ?? "";
        kooode = kodetrx.toString();
      });
      print(id);
    }
    try {
      var res = await http.post(
        Uri.parse(API.inserttrx),
        body: {
          'kode_transaksi': kodetrx.toString(),
          'waktu': dateNow.toString(),
          'id_pembeli': id.toString(),
          'total': totaltransaksi.toString(),
        },
      );
      print('ini insert transaksi ${res.body}');

      if (res.statusCode == 200) //Connection with API to server is succes
      {
        var result = jsonDecode(res.body);

        if (result['Berhasil'] == true) {
          Fluttertoast.showToast(msg: "Berhasil Melakukan Transaksi");
          print("Berhasil");
        }
        ;
      } else {
        Fluttertoast.showToast(msg: "Gagal menambah transaksi");
      }
    } catch (errorMsg) {
      Fluttertoast.showToast(msg: "Error : " + errorMsg.toString());
      print("Error :: " + errorMsg.toString());
    }
  }

  insertbarang(List<trx> list) async {
    for (var i = 0; i < list.length; i++) {
      try {
        var res = await http.post(
          Uri.parse(API.insertdetailtrx),
          body: {
            'kode_transaksi': kooode.toString(),
            'kode_barang': list[i].kodebrg,
            'qty': list[i].qty,
            'sub_total': list[i].harga,
            'catatan': 'kosong',
          },
        );
        print('ini insert barang ${res.body}');
        print('<<<<<<<<$kooode');
        // if (res.statusCode == 200) //Connection with API to server is succes
        // {
        //   var result = jsonDecode(res.body);

        //   if (result['Berhasil'] == true) {
        //     // Fungsi pindah Activity dari Login ke Dashboard
        //     Future.delayed(Duration(milliseconds: 2), () {
        //       Fluttertoast.showToast(msg: "Berhasil Melakukan Transaksi");
        //       print("Berhasil");
        //     });
        //   } else {
        //     Fluttertoast.showToast(msg: "Gagal menambah transaksi");
        //   }
        // }
      } catch (errorMsg) {
        Fluttertoast.showToast(msg: "Error : " + errorMsg.toString());
        print("Error :: " + errorMsg.toString());
      }
    }
  }

  insertdetailtrx() async {
    try {
      var res = await http.post(
        Uri.parse(API.inserttrx),
        body: {
          'kode_transaksi': kodetrx.toString(),
          'kode_barang': kodebrg.toString(),
          'qty': qty.toString(),
          'sub_total': harga.toString(),
        },
      );

      if (res.statusCode == 200) //Connection with API to server is succes
      {
        var result = jsonDecode(res.body);

        if (result['Berhasil'] == true) {
          // Fungsi pindah Activity dari Login ke Dashboard
          Future.delayed(Duration(milliseconds: 2), () {
            Fluttertoast.showToast(msg: "Berhasil Melakukan Transaksi");
            print("Berhasil");
          });
        } else {
          Fluttertoast.showToast(msg: "Gagal menambah transaksi");
        }
      }
    } catch (errorMsg) {
      Fluttertoast.showToast(msg: "Error : " + errorMsg.toString());
      print("Error :: " + errorMsg.toString());
    }
  }

  void kirimData() {
    setState(() {
      int barangqty = int.parse(qty.text);
      int barangharga = int.parse(harga.text);
      int total = barangqty * barangharga;
      dataTransaksi.add(trx(kodebrg.text.toString(), qty.text,
          _namabarang.toString(), total.toString()));
      totaltransaksi += total;
      print(dataTransaksi.length);
      print(totaltransaksi);
    });
    //alert dialog
    AlertDialog alertDialog = AlertDialog(
      content: Container(
        height: 100,
        child: Column(
          children: [
            Text("Berhasil Tambah Data"),
            //padding
            const Padding(padding: EdgeInsets.all(10)),
            //button
            ElevatedButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
                Color:
                Colors.purple;
              },
            )
          ],
        ),
      ),
    );
    //show dialog
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  Future _getData() async {
    var response = await http.get(Uri.parse(API.namabarang),
        headers: {"Accept": "application/json"});
    var jsonBody = response.body;
    final List<dynamic> jsonData = jsonDecode(jsonBody);

    setState(() {
      data = jsonData as List;
      databarang = jsonData;
    });
    print(databarang);
    print(dateNow);
    print(kodetrx);
  }

  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _getData();
    ;
  }

  String? _pembeli;
  //inisiasi variable nama barang
  //inisiasi variable ukuran
  String? _ukuran;
  //inisiasi variable kain
  String? _kain;
  //controller qty
  TextEditingController qty = TextEditingController();
  TextEditingController harga = TextEditingController();
  TextEditingController kodebrg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaksi'),
        centerTitle: true,
        backgroundColor: SecondaryColor,
        automaticallyImplyLeading: false,
      ),
      body: ListView(key: _formkey, children: [
        Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
                //text with icon
                child: Row(
                  //container
                  children: [
                    const Icon(Icons.shopping_bag),
                    const Text(
                      '  Data Barang',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              //dropdown pembeli
              Container(
                padding: const EdgeInsets.all(10),
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    labelText: 'Nama Barang',
                    hintText: 'Pilih Barang',
                    //icon barang
                    prefixIcon: Icon(Icons.shopping_bag),
                  ),
                  value: _namabarang,
                  items: data.map((List) {
                    return DropdownMenuItem(
                      child: Text(List['nama_barang']),
                      value: List['nama_barang'],
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _namabarang = value as String?;
                      int index = databarang
                          .indexWhere((item) => item["nama_barang"] == value);
                      print("$value");
                      harga.text = databarang[index]['harga'];
                      kodebrg.text = databarang[index]['kode_barang'];
                    });
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: kodebrg,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    labelText: 'Harga',
                    //icon qty
                    prefixIcon: Icon(Icons.attach_money),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: harga,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    labelText: 'Harga',
                    //icon qty
                    prefixIcon: Icon(Icons.attach_money),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              //container padding
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: qty,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    labelText: 'Qty',
                    hintText: 'Masukkan Qty',
                    //icon qty
                    prefixIcon: Icon(Icons.format_list_numbered),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              //button tambah berada di kanan
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  //change color button
                  style: ElevatedButton.styleFrom(primary: Color(0xFF2B2D42)),
                  onPressed: () {
                    kirimData();
                  },
                  child: const Text('Tambah'),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  itemCount: dataTransaksi.length,
                  itemBuilder: (context, index) {
                    int harga = int.parse(dataTransaksi[index].harga);
                    int qty = int.parse(dataTransaksi[index].qty);
                    int total = harga * qty;

                    return Container(
                        child: Card(
                      shadowColor: Colors.black,
                      clipBehavior: Clip.antiAlias,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [primaryColor, primaryColor],
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  dataTransaksi[index].namabarang,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.cancel,
                                      size: 20,
                                    ))
                              ],
                            ),
                            Divider(
                              color: Color(0xFF8D99AE),
                              thickness: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  dataTransaksi[index].qty,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12),
                                ),
                                Text(
                                  dataTransaksi[index].harga,
                                  style: TextStyle(
                                      color: Color(0xFF414460),
                                      fontWeight: FontWeight.w200,
                                      fontSize: 12),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Divider(
                              color: Color(0xFF8D99AE),
                              thickness: 1,
                            ),
                          ],
                        ),
                      ),
                    ));
                  }),

              //Total
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 35, 15, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: ThirdColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: EdgeInsets.all(24),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Icon(Icons.card_travel_sharp, color: SecondaryColor,),
                          Text(
                            "Total Harga",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                          Text(
                            "Rp. $totaltransaksi",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: primaryColor),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Hubungi penjual : Kirim bukti pembayaran DP 50%",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w300,
                                color: primaryColor),
                          ),
                          Text(
                            "Ke Nomer Rekening (BRI)3266563325526",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              //Button Pesan
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  //change color button
                  style: ElevatedButton.styleFrom(primary: Color(0xFF2B2D42)),
                  onPressed: () async {
                    await inserttrx();
                    await insertbarang(dataTransaksi);
                  },
                  child: const Text('Pesan'),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  //void pilih nama barang
  void pilihNamaBarang(String? value) {
    setState(() {
      _namabarang = value;
    });
  }

  //void kirim data

}
