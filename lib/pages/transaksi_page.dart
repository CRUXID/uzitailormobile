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

  Future _getData() async {
    var response = await http.get(Uri.parse(API.namabarang),
        headers: {"Accept": "application/json"});
    var jsonBody = response.body;
    final List<dynamic> jsonData = jsonDecode(jsonBody);

    setState(() {
      data = jsonData as List;
    });
    print(jsonData);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaksi'),
        centerTitle: true,
        backgroundColor: SecondaryColor,
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: _formkey,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView(
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
                      print(value);
                    });
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    labelText: 'Harga',
                    hintText: 'Pilih Harga',
                    //icon jenis kain
                    prefixIcon: Icon(Icons.format_paint),
                  ),
                  value: selected2,
                  items: data.map((List) {
                    return DropdownMenuItem(
                      child: Text(List['harga']),
                      value: List['harga'],
                    );
                  }).toList(),
                  onChanged: (value1) {
                    setState(() {
                      selected2 = value1 as String?;
                      print(value1);
                    });
                  },
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
            ],
          ),
        ),
      ),
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

  //void pilih ukuran
  void pilihUkuran(String? value) {
    setState(() {
      selected2 = value;
    });
  }

  //void pilih kain
  void pilihKain(String? value) {
    setState(() {
      _kain = value;
    });
  }

  //void kirim data
  void kirimData() {
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
