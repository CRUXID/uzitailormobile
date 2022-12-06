part of 'pages.dart';

class Tracking extends StatefulWidget {
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking>
    with SingleTickerProviderStateMixin {
  late int currentTab;
  late TabController _tabController = new TabController(length: 4, vsync: this);
  // void initState() {
  //   super.initState();
  //   _tabController = new TabController(vsync: this, length: 4);
  // }

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
                    Tab(
                      child: Text("Pending", style: TextStyle(fontSize: 13.5)),
                    ),
                    Tab(
                      child: Text("Proses", style: TextStyle(fontSize: 13.5)),
                    ),
                    Tab(
                      child: Text("Selesai", style: TextStyle(fontSize: 13.5)),
                    ),
                    Tab(
                      child: Text("Riwayat", style: TextStyle(fontSize: 13.5)),
                    ),
                  ],
                )),
            body: TabBarView(controller: _tabController, children: [
              ListView(padding: const EdgeInsets.all(10), children: <Widget>[
                Card(
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
                              "Kamis, 22 Oktober 2022",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            Text(
                              "Menunggu Konfirmasi",
                              style: TextStyle(
                                  color: Color(0xFF414460),
                                  fontWeight: FontWeight.w200,
                                  fontSize: 12),
                            )
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
                              "Kaos Lengan Panjang S",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            ),
                            Text(
                              "x24",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Rp.240.000",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12),
                              ),
                            ]),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Kaos Lengan Panjang M",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            ),
                            Text(
                              "x20",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Rp. 200.000",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12),
                              )
                            ]),
                        Divider(
                          color: Color(0xFF8D99AE),
                          thickness: 1,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Total Pesanan : Rp.440.000",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            ]),
                        Divider(
                          color: Color(0xFF8D99AE),
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _openWA();
                                //_tabController
                                //.animateTo((_tabController.index + 1) % 2);
                              },
                              child: Text(
                                "Hubungi Penjual",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    letterSpacing: 2),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: ThirdColor,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
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
                Card(
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
                              "Kamis, 22 Oktober 2022",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            Text(
                              "Sedang Diproses",
                              style: TextStyle(
                                  color: Color(0xFF414460),
                                  fontWeight: FontWeight.w200,
                                  fontSize: 12),
                            )
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
                              "Kaos Lengan Panjang S",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            ),
                            Text(
                              "x24",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Rp.240.000",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12),
                              ),
                            ]),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Kaos Lengan Panjang M",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            ),
                            Text(
                              "x20",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Rp. 200.000",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12),
                              )
                            ]),
                        Divider(
                          color: Color(0xFF8D99AE),
                          thickness: 1,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Total Pesanan : Rp.440.000",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            ]),
                        Divider(
                          color: Color(0xFF8D99AE),
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Pelunasan",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    letterSpacing: 2),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(104, 217, 4, 39),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ]),
              //Center(
              //child: Text('Selesai'),
              //),
              ListView(padding: const EdgeInsets.all(10), children: <Widget>[
                Card(
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
                              "Kamis, 22 Oktober 2022",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            Text(
                              "Selesai",
                              style: TextStyle(
                                  color: Color(0xFF414460),
                                  fontWeight: FontWeight.w200,
                                  fontSize: 12),
                            )
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
                              "Kaos Lengan Panjang S",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            ),
                            Text(
                              "x24",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Rp.240.000",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12),
                              ),
                            ]),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Kaos Lengan Panjang M",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            ),
                            Text(
                              "x20",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Rp. 200.000",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12),
                              )
                            ]),
                        Divider(
                          color: Color(0xFF8D99AE),
                          thickness: 1,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Total Pesanan : Rp.440.000",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            ]),
                        Divider(
                          color: Color(0xFF8D99AE),
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => faktur(),
                                    ));
                              },
                              child: Text(
                                "Pelunasan",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    letterSpacing: 2),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: ThirdColor,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ]),
              //Center(
              //child: Text('Riwayat'),
              //),
              ListView(padding: const EdgeInsets.all(10), children: <Widget>[
                Card(
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
                              "Kamis, 22 Oktober 2022",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
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
                              "Kaos Lengan Panjang S",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            ),
                            Text(
                              "x24",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Kaos Lengan Panjang M",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            ),
                            Text(
                              "x20",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            )
                          ],
                        ),
                        Divider(
                          color: Color(0xFF8D99AE),
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Riwayat(),
                                    ));
                              },
                              child: Text(
                                "Detail Pesanan",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    letterSpacing: 2),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: ThirdColor,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            ])));
  }

  void _openWA() async {
    String phoneNumber = '+6282228654386';
    var url = 'https://wa.me/6282228654386';
    await launch(url);
  }
}
