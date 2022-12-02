part of 'pages.dart';

class Transaksi extends StatefulWidget {
  const Transaksi({super.key});

  @override
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  final _formkey = GlobalKey<FormState>();
  List<String> namabarang = [
    'Kemeja',
    'Kaos',
    'Jas',
    'Celana Panjang',
    'Seragam Pemuda Pancasila',
  ];
  //list ukuran baju
  List<String> ukuran = ['S', 'M', 'L', 'XL', 'XXL'];
  //list jenis kain
  List<String> kain = ['Katun', 'Sutra', 'Kanvas', 'Denim', 'Kain Sutra'];
  //list string
  List<String> pembeli = ['Fikri', 'Thoriq', 'Firdi', 'Gabriel', 'Regina'];
  //inisiasi variable pembeli
  String? _pembeli;
  //inisiasi variable nama barang
  String? _namabarang;
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
                    const Icon(Icons.location_on),
                    const Text(
                      '  Alamat Pembeli',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              //container
              Container(
                padding: const EdgeInsets.fromLTRB(12, 1, 0, 5),
                //text with icon
                child: Row(
                  //container
                  children: [
                    const Text('Thoriq Lukman Hakim | 085156259183'),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(12, 1, 0, 5),
                //text with icon
                child: Row(
                  //container
                  children: [
                    const Text('Perumahan Mastrip EE 7'),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(12, 1, 0, 25),
                //text with icon
                child: Row(
                  //container
                  children: [
                    const Text('SUMBERSARI , KAB. JEMBER, JAWA TIMUR 68121'),
                  ],
                ),
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
                  items: namabarang.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _namabarang = value;
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
                    labelText: 'Ukuran',
                    hintText: 'Pilih Ukuran',
                    //icon ukuran
                    prefixIcon: Icon(Icons.format_size),
                  ),
                  value: _ukuran,
                  items: ukuran.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _ukuran = value;
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
                    labelText: 'Jenis Kain',
                    hintText: 'Pilih Jenis Kain',
                    //icon jenis kain
                    prefixIcon: Icon(Icons.format_paint),
                  ),
                  value: _kain,
                  items: kain.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _kain = value;
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
      _ukuran = value;
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
            Text("Ukuran : $_ukuran"),
            Text("Jenis Kain : $_kain"),
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
