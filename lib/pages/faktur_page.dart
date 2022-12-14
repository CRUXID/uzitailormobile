part of 'pages.dart';

class faktur extends StatefulWidget {
  const faktur({super.key});

  @override
  State<faktur> createState() => _fakturState();
}

class _fakturState extends State<faktur> {
  late Future<fakturm> futurefaktur;
  late Map<String, dynamic> faktur;
  List data = [];
  List<dynamic> datafaktur = [];

  Future<fakturm> fetchfaktur() async {
    final response = await http.get(Uri.parse(API.selectfaktur));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return fakturm.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future _getData() async {
    var response = await http.get(Uri.parse(API.selectfaktur),
        headers: {"Accept": "application/json"});
    var jsonBody = response.body;
    final List<dynamic> jsonData = jsonDecode(jsonBody);

    setState(() {
      data = jsonData as List;
      datafaktur = jsonData;
    });
    print(datafaktur);
  }

  @override
  void initState() {
    super.initState();
    futurefaktur = fetchfaktur();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Faktur"),
          centerTitle: true,
          backgroundColor: SecondaryColor,
        ),
        body: Center(
          child: FutureBuilder<fakturm>(
            future: futurefaktur,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.kode);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ));

    //   ));; ListView(
    //     padding: const EdgeInsets.all(15),
    //     children: <Widget>[
    //       Text(
    //         'kdms',
    //         style: TextStyle(fontWeight: FontWeight.bold),
    //       ),
    //       Divider(
    //         color: FifthColor,
    //         thickness: 1,
    //       ),
    //       SizedBox(
    //         height: 13,
    //       ),
    //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    //         Text('Total Pembayaran DP',
    //             style: TextStyle(
    //                 color: SixthColor,
    //                 fontWeight: FontWeight.w400,
    //                 fontSize: 14)),
    //         Text('Waktu Pembayaran DP',
    //             style: TextStyle(
    //                 color: SixthColor,
    //                 fontWeight: FontWeight.w400,
    //                 fontSize: 14)),
    //       ]),
    //       SizedBox(
    //         height: 8,
    //       ),
    //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    //         Text('Rp. 220.000',
    //             style: TextStyle(
    //                 color: SixthColor,
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 14)),
    //         Text('2022/10/20',
    //             style: TextStyle(
    //                 color: SixthColor,
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 14)),
    //       ]),
    //       SizedBox(
    //         height: 13,
    //       ),
    //       Divider(
    //         color: FifthColor,
    //         thickness: 1,
    //       ),
    //       SizedBox(
    //         height: 13,
    //       ),
    //       Text(
    //         "Rincian Pembeli",
    //         style: TextStyle(
    //             fontWeight: FontWeight.bold, fontSize: 14, color: SixthColor),
    //       ),
    //       SizedBox(
    //         height: 8,
    //       ),
    //       Text(
    //         "Thoriq Lukman Hakim",
    //         style: TextStyle(
    //             color: SixthColor, fontWeight: FontWeight.w300, fontSize: 12),
    //       ),
    //       SizedBox(
    //         height: 5,
    //       ),
    //       Text(
    //         "081231910408",
    //         style: TextStyle(
    //             color: SixthColor, fontWeight: FontWeight.w300, fontSize: 12),
    //       ),
    //       SizedBox(
    //         height: 5,
    //       ),
    //       Text(
    //         "Perumahan Argopuro Blok B No.7",
    //         style: TextStyle(
    //             color: SixthColor, fontWeight: FontWeight.w300, fontSize: 12),
    //       ),
    //       SizedBox(
    //         height: 5,
    //       ),
    //       Text(
    //         "SUMBERSARI, KAB.JEMBER, JAWA TIMUR 68121",
    //         style: TextStyle(
    //             color: SixthColor, fontWeight: FontWeight.w300, fontSize: 12),
    //       ),
    //       SizedBox(
    //         height: 13,
    //       ),
    //       Divider(
    //         color: FifthColor,
    //         thickness: 1,
    //       ),
    //       SizedBox(
    //         height: 13,
    //       ),
    //       Text(
    //         "Rincian Pesanan",
    //         style: TextStyle(
    //             fontWeight: FontWeight.bold, color: SixthColor, fontSize: 14),
    //       ),
    //       SizedBox(
    //         height: 8,
    //       ),
    //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    //         Text('Kaos Lengan Pendek',
    //             style: TextStyle(
    //                 color: SixthColor,
    //                 fontWeight: FontWeight.w400,
    //                 fontSize: 12)),
    //         Text('x24',
    //             style: TextStyle(
    //                 color: FifthColor,
    //                 fontWeight: FontWeight.w300,
    //                 fontSize: 12)),
    //       ]),
    //       SizedBox(
    //         height: 10,
    //       ),
    //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    //         Text('Note : warna pink magenta',
    //             style: TextStyle(
    //                 color: FifthColor,
    //                 fontWeight: FontWeight.w300,
    //                 fontSize: 12)),
    //         Text('Rp.10.000',
    //             style: TextStyle(
    //                 color: FifthColor,
    //                 fontWeight: FontWeight.w300,
    //                 fontSize: 12)),
    //       ]),
    //       SizedBox(
    //         height: 10,
    //       ),
    //       Row(mainAxisAlignment: MainAxisAlignment.end, children: [
    //         Text('Rp. 240.000',
    //             style: TextStyle(
    //                 color: SixthColor,
    //                 fontWeight: FontWeight.w400,
    //                 fontSize: 12))
    //       ]),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    //         Text('Kaos Lengan Panjang',
    //             style: TextStyle(
    //                 color: SixthColor,
    //                 fontWeight: FontWeight.w400,
    //                 fontSize: 12)),
    //         Text('x20',
    //             style: TextStyle(
    //                 color: FifthColor,
    //                 fontWeight: FontWeight.w300,
    //                 fontSize: 12)),
    //       ]),
    //       SizedBox(
    //         height: 10,
    //       ),
    //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    //         Text('Note : warna pink magenta',
    //             style: TextStyle(
    //                 color: FifthColor,
    //                 fontWeight: FontWeight.w300,
    //                 fontSize: 12)),
    //         Text('Rp.10.000',
    //             style: TextStyle(
    //                 color: FifthColor,
    //                 fontWeight: FontWeight.w300,
    //                 fontSize: 12)),
    //       ]),
    //       SizedBox(
    //         height: 10,
    //       ),
    //       Row(mainAxisAlignment: MainAxisAlignment.end, children: [
    //         Text('Rp. 200.000',
    //             style: TextStyle(
    //                 color: SixthColor,
    //                 fontWeight: FontWeight.w400,
    //                 fontSize: 12))
    //       ]),
    //       SizedBox(
    //         height: 13,
    //       ),
    //       Divider(
    //         color: FifthColor,
    //         thickness: 1,
    //       ),
    //       SizedBox(
    //         height: 5,
    //       ),
    //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    //         Text('Subtotal Barang',
    //             style: TextStyle(
    //                 color: FifthColor,
    //                 fontWeight: FontWeight.w300,
    //                 fontSize: 14)),
    //         Text('Rp.440.000',
    //             style: TextStyle(
    //                 color: FifthColor,
    //                 fontWeight: FontWeight.w300,
    //                 fontSize: 14)),
    //       ]),
    //       SizedBox(
    //         height: 5,
    //       ),
    //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    //         Text('Total Pembayaran DP',
    //             style: TextStyle(
    //                 color: FifthColor,
    //                 fontWeight: FontWeight.w300,
    //                 fontSize: 14)),
    //         Text('-Rp.220.000',
    //             style: TextStyle(
    //                 color: FifthColor,
    //                 fontWeight: FontWeight.w300,
    //                 fontSize: 14)),
    //       ]),
    //       SizedBox(
    //         height: 5,
    //       ),
    //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    //         Text('Total Pembayaran',
    //             style: TextStyle(
    //                 color: SixthColor,
    //                 fontWeight: FontWeight.w400,
    //                 fontSize: 14)),
    //         Text('Rp.220.000',
    //             style: TextStyle(
    //                 color: SixthColor,
    //                 fontWeight: FontWeight.w400,
    //                 fontSize: 14)),
    //       ]),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       ClipRRect(
    //           borderRadius: BorderRadius.circular(1),
    //           child: BarcodeWidget(
    //             barcode: Barcode.code128(),
    //             data: 'asadaada',
    //             drawText: false,
    //             width: double.infinity,
    //             height: 60,
    //           )),
    //     ],
    //   ),
    // );
  }
}
