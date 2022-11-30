part of 'pages.dart';

class faktur extends StatefulWidget {
  const faktur({super.key});

  @override
  State<faktur> createState() => _fakturState();
}

class _fakturState extends State<faktur> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riwayat"),
        centerTitle: true,
        backgroundColor: SecondaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: <Widget>[
          Text(
            "No Transaksi: 20221130001",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Divider(
            color: FifthColor,
            thickness: 1,
          ),
          SizedBox(
            height: 13,
          ),
          Text.rich(
            TextSpan(
                text: "Total Pembayaran DP",
                style: TextStyle(
                    color: SixthColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
                children: <TextSpan>[
                  TextSpan(
                    text: "            Waktu Pembayaran DP",
                    style: TextStyle(
                        color: Color(0xFF414460),
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ]),
          ),
          SizedBox(
            height: 8,
          ),
          Text.rich(
            TextSpan(
                text: "Rp. 220.000",
                style: TextStyle(
                    color: SixthColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
                children: <TextSpan>[
                  TextSpan(
                    text: "                             20/10/2022",
                    style: TextStyle(
                        color: Color(0xFF414460),
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ]),
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
            "Rincian Pembeli",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14, color: SixthColor),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Thoriq Lukman Hakim",
            style: TextStyle(
                color: SixthColor, fontWeight: FontWeight.w300, fontSize: 12),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "081231910408",
            style: TextStyle(
                color: SixthColor, fontWeight: FontWeight.w300, fontSize: 12),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Perumahan Argopuro Blok B No.7",
            style: TextStyle(
                color: SixthColor, fontWeight: FontWeight.w300, fontSize: 12),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "SUMBERSARI, KAB.JEMBER, JAWA TIMUR 68121",
            style: TextStyle(
                color: SixthColor, fontWeight: FontWeight.w300, fontSize: 12),
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
                fontWeight: FontWeight.bold, color: SixthColor, fontSize: 14),
          ),
          SizedBox(
            height: 8,
          ),
          Text.rich(
            TextSpan(
                text: "Kaos Lengan Pendek",
                style: TextStyle(
                    color: SixthColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        "                                                                 x24",
                    style: TextStyle(
                        color: FifthColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 12),
                  ),
                ]),
          ),
          SizedBox(
            height: 5,
          ),
          Text.rich(
            TextSpan(
                text: "Ukuran : M",
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        "                                                                       Rp. 10.000",
                    style: TextStyle(
                        color: FifthColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 12),
                  ),
                ]),
          ),
          SizedBox(
            height: 5,
          ),
          Text.rich(
            TextSpan(
                text: "Jenis    : Katun",
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        "                                                            Rp. 240.000",
                    style: TextStyle(
                        color: SixthColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                ]),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Note     : Warna Pink Magenta",
            style: TextStyle(
                color: FifthColor, fontWeight: FontWeight.w300, fontSize: 12),
          ),
          SizedBox(
            height: 20,
          ),
          Text.rich(
            TextSpan(
                text: "Kaos Lengan Panjang",
                style: TextStyle(
                    color: SixthColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        "                                                                x20",
                    style: TextStyle(
                        color: FifthColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 12),
                  ),
                ]),
          ),
          SizedBox(
            height: 5,
          ),
          Text.rich(
            TextSpan(
                text: "Ukuran : S",
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        "                                                                        Rp. 10.000",
                    style: TextStyle(
                        color: FifthColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 12),
                  ),
                ]),
          ),
          SizedBox(
            height: 5,
          ),
          Text.rich(
            TextSpan(
                text: "Jenis    : Katun",
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        "                                                             Rp. 200.000",
                    style: TextStyle(
                        color: SixthColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                ]),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Note     : - ",
            style: TextStyle(
                color: FifthColor, fontWeight: FontWeight.w300, fontSize: 12),
          ),
          SizedBox(
            height: 13,
          ),
          Divider(
            color: FifthColor,
            thickness: 1,
          ),
          SizedBox(
            height: 5,
          ),
          Text.rich(
            TextSpan(
                text: "Subtotal Barang",
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 14),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        "                                            Rp. 440.000",
                    style: TextStyle(
                        color: FifthColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 14),
                  ),
                ]),
          ),
          SizedBox(
            height: 5,
          ),
          Text.rich(
            TextSpan(
                text: "Total Pembayaran DP",
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 14),
                children: <TextSpan>[
                  TextSpan(
                    text: "                               - Rp. 220.000",
                    style: TextStyle(
                        color: FifthColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 14),
                  ),
                ]),
          ),
          SizedBox(
            height: 5,
          ),
          Text.rich(
            TextSpan(
                text: "Total Pembayaran",
                style: TextStyle(
                    color: SixthColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
                children: <TextSpan>[
                  TextSpan(
                    text: "                                      Rp. 200.000",
                    style: TextStyle(
                        color: SixthColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ]),
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            color: FifthColor,
            thickness: 1,
          ),
          SizedBox(
            height: 8,
          ),
          Text.rich(
            TextSpan(
                text: "Waktu Pemesanan",
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        "                                                      20/10/2022",
                    style: TextStyle(
                        color: FifthColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 12),
                  ),
                ]),
          ),
          SizedBox(
            height: 5,
          ),
          Text.rich(
            TextSpan(
                text: "Waktu Pembayaran DP",
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        "                                               20/10/2022",
                    style: TextStyle(
                        color: FifthColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 12),
                  ),
                ]),
          ),
          SizedBox(
            height: 5,
          ),
          Text.rich(
            TextSpan(
                text: "Waktu Barang Selesai",
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        "                                                 27/10/2022",
                    style: TextStyle(
                        color: FifthColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 12),
                  ),
                ]),
          ),
          SizedBox(
            height: 5,
          ),
          Text.rich(
            TextSpan(
                text: "Waktu Pembayaran Selesai",
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
                children: <TextSpan>[
                  TextSpan(
                    text: "                                       27/10/2022",
                    style: TextStyle(
                        color: FifthColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 12),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
