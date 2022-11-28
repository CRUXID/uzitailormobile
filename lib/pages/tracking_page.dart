part of 'pages.dart';

class Tracking extends StatefulWidget {
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking>
    with SingleTickerProviderStateMixin {
  late int currentTab;
  late TabController _tabController = new TabController(length: 4, vsync: this);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: SecondaryColor,
                automaticallyImplyLeading: false,
                title: TabBar(
                  controller: _tabController,
                  indicatorColor: primaryColor,
                  tabs: [
                    Tab(text: "Konfirmasi"),
                    Tab(text: "Proses"),
                    Tab(text: "Selesai"),
                    Tab(text: "Riwayat"),
                  ],
                )),
            body: TabBarView(controller: _tabController, children: [
              ListView(padding: const EdgeInsets.all(10), children: <Widget>[
                Container(
                    height: 240,
                    color: Color(0xFFEDF2F4),

                    //child: const Center
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5.0,
                          ),
                          Text.rich(
                            TextSpan(
                                text: "   Kamis, 22 Oktober 2022",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "                Menunggu Konfirmasi",
                                    style: TextStyle(
                                        color: Color(0xFF414460),
                                        fontWeight: FontWeight.w200,
                                        fontSize: 12),
                                  )
                                ]),
                          ),
                          //SizedBox(
                          //height: 5.0,
                          //),

                          Divider(
                            color: Color(0xFF8D99AE),
                            thickness: 1,
                          ),
                          Text(
                            "   Kaos Lengan Panjang S                                                           x24",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "                                                                                          Rp.240.000",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "   Kaos Lengan Pendek M                                                           x20",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "                                                                                          Rp.200.000",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                          Divider(
                            color: Color(0xFF8D99AE),
                            thickness: 1,
                          ),
                          Text(
                            "                                            Total Pesanan: Rp. 440.000 ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          Divider(
                            color: Color(0xFF8D99AE),
                            thickness: 1,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 180),
                              child: ElevatedButton(
                                child: const Text(
                                  'Hubungi Penjual',
                                  style: TextStyle(color: Color(0xFFEDF2F4)),
                                ),
                                style: TextButton.styleFrom(
                                    backgroundColor: Color(0xFFD90429),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(5.0))),
                                onPressed: () {
                                  //loginSumbimt();
                                },
                              )),
                        ])),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                    height: 240,
                    color: Color(0xFFEDF2F4),

                    //child: const Center
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5.0,
                          ),
                          Text.rich(
                            TextSpan(
                                text: "   Jumat, 23 Oktober 2022",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "                Menunggu Konfirmasi",
                                    style: TextStyle(
                                        color: Color(0xFF414460),
                                        fontWeight: FontWeight.w200,
                                        fontSize: 12),
                                  )
                                ]),
                          ),
                          Divider(
                            color: Color(0xFF8D99AE),
                            thickness: 1,
                          ),
                          Text(
                            "   Kaos Lengan Panjang L                                                           x24",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "                                                                                          Rp.240.000",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "   Kaos Lengan Pendek S                                                           x20",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "                                                                                          Rp.200.000",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                          Divider(
                            color: Color(0xFF8D99AE),
                            thickness: 1,
                          ),
                          Text(
                            "                                            Total Pesanan: Rp. 440.000 ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          Divider(
                            color: Color(0xFF8D99AE),
                            thickness: 1,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 180),
                              child: ElevatedButton(
                                child: const Text(
                                  'Hubungi Penjual',
                                  style: TextStyle(color: Color(0xFFEDF2F4)),
                                ),
                                style: TextButton.styleFrom(
                                    backgroundColor: Color(0xFFD90429),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(5.0))),
                                onPressed: () {
                                  //loginSumbimt();
                                },
                              )),
                        ]))
              ]),
              //Center(
              //child: Text('konfirmasi'),
              //),
              //ListView(
              //padding: const EdgeInsets.all(8),
              //children: <Widget>[
              //Card
              //child: ListTile(
              //title: Text("Kamis, 20 Oktober 2022"),
              //subtitle:
              //Text("Kaos Lengan Panjang S             x24"),
              //leading: CircleAvatar(
              //backgroundImage: NetworkImage(
              //"https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
              //trailing: Icon(Icons.star))
              //),

              //],
              //),
              //Center(
              //child: Text('Proses'),
              //),
              ListView(padding: const EdgeInsets.all(10), children: <Widget>[
                Container(
                    height: 240,
                    color: Color(0xFFEDF2F4),

                    //child: const Center
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5.0,
                          ),
                          Text.rich(
                            TextSpan(
                                text: "   Kamis, 22 Oktober 2022",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        "                          Sedang Diproses",
                                    style: TextStyle(
                                        color: Color(0xFF414460),
                                        fontWeight: FontWeight.w200,
                                        fontSize: 12),
                                  )
                                ]),
                          ),
                          Divider(
                            color: Color(0xFF8D99AE),
                            thickness: 1,
                          ),
                          Text(
                            "   Kaos Lengan Panjang S                                                           x24",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "                                                                                          Rp.240.000",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "   Kaos Lengan Pendek M                                                           x20",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "                                                                                          Rp.200.000",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                          Divider(
                            color: Color(0xFF8D99AE),
                            thickness: 1,
                          ),
                          Text(
                            "                                            Total Pesanan: Rp. 440.000 ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          Divider(
                            color: Color(0xFF8D99AE),
                            thickness: 1,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 220),
                              child: ElevatedButton(
                                child: const Text(
                                  'Pelunasan',
                                  style: TextStyle(color: Color(0xFFEDF2F4)),
                                ),
                                style: TextButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(104, 217, 4, 39),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(5.0))),
                                onPressed: () {
                                  //loginSumbimt();
                                },
                              )),
                        ]))
              ]),
              //Center(
              //child: Text('Selesai'),
              //),
              ListView(padding: const EdgeInsets.all(10), children: <Widget>[
                Container(
                    height: 240,
                    color: Color(0xFFEDF2F4),

                    //child: const Center
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5.0,
                          ),
                          Text.rich(
                            TextSpan(
                                text: "   Kamis, 22 Oktober 2022",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        "                                            Selesai",
                                    style: TextStyle(
                                        color: Color(0xFF414460),
                                        fontWeight: FontWeight.w200,
                                        fontSize: 12),
                                  )
                                ]),
                          ),
                          Divider(
                            color: Color(0xFF8D99AE),
                            thickness: 1,
                          ),
                          Text(
                            "   Kaos Lengan Panjang S                                                           x24",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "                                                                                          Rp.240.000",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "   Kaos Lengan Pendek M                                                           x20",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "                                                                                          Rp.200.000",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                          Divider(
                            color: Color(0xFF8D99AE),
                            thickness: 1,
                          ),
                          Text(
                            "                                            Total Pesanan: Rp. 440.000 ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          Divider(
                            color: Color(0xFF8D99AE),
                            thickness: 1,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 220),
                              child: ElevatedButton(
                                child: const Text(
                                  'Pelunasan',
                                  style: TextStyle(color: Color(0xFFEDF2F4)),
                                ),
                                style: TextButton.styleFrom(
                                    backgroundColor: Color(0xFFD90429),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(5.0))),
                                onPressed: () {
                                  //loginSumbimt();
                                },
                              )),
                        ]))
              ]),
              //Center(
              //child: Text('Riwayat'),
              //),
              ListView(padding: const EdgeInsets.all(10), children: <Widget>[
                Container(
                    height: 160,
                    color: Color(0xFFEDF2F4),

                    //child: const Center
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5.0,
                          ),
                          Text.rich(
                            TextSpan(
                              text: "   Kamis, 22 Oktober 2022         ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Divider(
                            color: Color(0xFF8D99AE),
                            thickness: 1,
                          ),
                          Text(
                            "   Kaos Lengan Panjang S                                                           x24",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "   Kaos Lengan Pendek M                                                           x20",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                          Divider(
                            color: Color(0xFF8D99AE),
                            thickness: 1,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 190),
                              child: ElevatedButton(
                                child: const Text(
                                  'Detail Pesanan',
                                  style: TextStyle(color: Color(0xFFEDF2F4)),
                                ),
                                style: TextButton.styleFrom(
                                    backgroundColor: Color(0xFFD90429),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(5.0))),
                                onPressed: () {
                                  //loginSumbimt();
                                },
                              )),
                        ]))
              ]),
            ])));
  }
}
