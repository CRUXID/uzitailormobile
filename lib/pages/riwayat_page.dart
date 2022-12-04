part of 'pages.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
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
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Rp. 220.000',
                style: TextStyle(
                    color: SixthColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
            Text('2022/10/20',
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
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Kaos Lengan Pendek',
                style: TextStyle(
                    color: SixthColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12)),
            Text('x24',
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 12)),
          ]),
          SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Note : warna pink magenta',
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 12)),
            Text('Rp.10.000',
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 12)),
          ]),
          SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text('Rp. 240.000',
                style: TextStyle(
                    color: SixthColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12))
          ]),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Kaos Lengan Panjang',
                style: TextStyle(
                    color: SixthColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12)),
            Text('x20',
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 12)),
          ]),
          SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Note : warna pink magenta',
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 12)),
            Text('Rp.10.000',
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 12)),
          ]),
          SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text('Rp. 200.000',
                style: TextStyle(
                    color: SixthColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12))
          ]),
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
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Subtotal Barang',
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 14)),
            Text('Rp.440.000',
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 14)),
          ]),
          SizedBox(
            height: 5,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Total Pembayaran DP',
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 14)),
            Text('-Rp.220.000',
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 14)),
          ]),
          SizedBox(
            height: 5,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Total Pembayaran',
                style: TextStyle(
                    color: SixthColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14)),
            Text('Rp.220.000',
                style: TextStyle(
                    color: SixthColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14)),
          ]),
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
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Waktu Pemesanan',
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 14)),
            Text('2022/10/20',
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 14)),
          ]),
          SizedBox(
            height: 5,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Waktu Pembayaran DP',
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 14)),
            Text('2022/10/20',
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 14)),
          ]),
          SizedBox(
            height: 5,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Waktu Barang Selesai',
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 14)),
            Text('2022/10/27',
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 14)),
          ]),
          SizedBox(
            height: 5,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Waktu Pembayaran Selesai',
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 14)),
            Text('2022/10/27',
                style: TextStyle(
                    color: FifthColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 14)),
          ]),
        ],
      ),
    );
  }
}
