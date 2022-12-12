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
  List data = [];
  List<trx> dataTransaksi = [];
  int totaltransaksi = 0;
  List<dynamic> databarang = [];

  DateTime dateToday = new DateTime.now();

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
    print(dateToday);
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
                      print("<<<<<<<<<<<$value");
                      harga.text = databarang[index]['harga'];
                    });
                  },
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
                    prefixIcon: Icon(Icons.format_list_numbered),
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
                  onPressed: () {
                    kirimData();
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

  //void pilih pembeli
  void pilihPembeli(String? value) {
    setState(() {
      _pembeli = value;
    });
  }

  //void pilih nama barang
  void pilihNamaBarang(String? value) {
    setState(() {
      _namabarang = value;
    });
  }

  //void kirim data
  void kirimData() {
    setState(() {
      int barangqty = int.parse(qty.text);
      int barangharga = int.parse(harga.text);
      int total = barangqty * barangharga;
      dataTransaksi
          .add(trx(qty.text, _namabarang.toString(), total.toString()));
      totaltransaksi += total;
      print(dataTransaksi.length);
      print(totaltransaksi);
    });
    //alert dialog
    AlertDialog alertDialog = AlertDialog(
      content: Container(
        height: 200,
        child: Column(
          children: [
            Text("Nama Barang: $_namabarang"),
            Text("Jenis Kain : $selected2"),
            Text("Qty : ${qty.text}"),
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
}
