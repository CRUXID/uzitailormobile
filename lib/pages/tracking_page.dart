part of 'pages.dart';

class Tracking extends StatefulWidget {
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking>
    with SingleTickerProviderStateMixin {
  late int currentTab;
  late TabController _tabController = new TabController(length: 4, vsync: this);
  List data = [];
  List data2 = [];
  List data3 = [];
  List data4 =
      []; //DEFINE VARIABLE data DENGAN TYPE List AGAR DAPAT MENAMPUNG COLLECTION / ARRAY

  Future getData() async {
    // MEMINTA DATA KE SERVER DENGAN KETENTUAN YANG DI ACCEPT ADALAH JSON (TRX STATUS 1)
    var response = await http.get(Uri.parse(API.selecttrx));
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
      print(data);
      return data;
    }
  }

  Future getData2() async {
    // MEMINTA DATA KE SERVER DENGAN KETENTUAN YANG DI ACCEPT ADALAH JSON (TRX STATUS 2)
    var response = await http.get(Uri.parse(API.selecttrx2));
    if (response.statusCode == 200) {
      setState(() {
        data2 = json.decode(response.body);
      });
      print(data2);
      return data2;
    }
  }

  Future getData3() async {
    // MEMINTA DATA KE SERVER DENGAN KETENTUAN YANG DI ACCEPT ADALAH JSON (TRX STATUS 3)
    var response = await http.get(Uri.parse(API.selecttrx3));
    if (response.statusCode == 200) {
      setState(() {
        data3 = json.decode(response.body);
      });
      print(data3);
      return data3;
    }
  }

  Future getData4() async {
    // MEMINTA DATA KE SERVER DENGAN KETENTUAN YANG DI ACCEPT ADALAH JSON (TRX STATUS 4)
    var response = await http.get(Uri.parse(API.selecttrx4));
    if (response.statusCode == 200) {
      setState(() {
        data4 = json.decode(response.body);
      });
      print(data4);
      return data4;
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
    getData2();
    getData3();
    getData4(); //PANGGIL FUNGSI YANG TELAH DIBUAT SEBELUMNYA
  }

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
              //pending
              ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (context, index) {
                    if (data.length == null) {
                      return Container(
                          child: Text("Tidak ada Transaksi Pending"));
                    } else {
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data[index]['waktu'],
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data[index]['nama_barang'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12),
                                    ),
                                    Text(
                                      data[index]['qty'],
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
                                        data[index]['sub_total'],
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
                                Divider(
                                  color: Color(0xFF8D99AE),
                                  thickness: 1,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        data[index]['total'],
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
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }), //end pending
              //proses
              ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: data2 == null ? 0 : data2.length,
                  itemBuilder: (context, index) {
                    if (data2.length == null) {
                      return Text("Tidak ada Transaksi Proses");
                    } else {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data2[index]['waktu'],
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data2[index]['nama_barang'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    data2[index]['qty'],
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
                                      data2[index]['sub_total'],
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
                              Divider(
                                color: Color(0xFF8D99AE),
                                thickness: 1,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      data2[index]['total'],
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
                                        primary:
                                            Color.fromARGB(104, 217, 4, 39),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 25, vertical: 10),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ));
                    }
                  }),
              //end proses

              //selesai pelunasan
              ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: data3 == null ? 0 : data3.length,
                  itemBuilder: (context, index) {
                    if (data3.length == null) {
                      return Text("Tidak ada Transaksi Proses");
                    } else {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data3[index]['waktu'],
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data3[index]['nama_barang'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    data3[index]['qty'],
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
                                      data3[index]['sub_total'],
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
                              Divider(
                                color: Color(0xFF8D99AE),
                                thickness: 1,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      data3[index]['total'],
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
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ));
                    }
                  }),
              //end selesai

              //Riwayat
              ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: data4 == null ? 0 : data4.length,
                  itemBuilder: (context, index) {
                    if (data4.length == null) {
                      return Text("Tidak ada Transaksi Proses");
                    } else {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data4[index]['waktu'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    data4[index]['kode_transaksi'],
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data4[index]['nama_barang'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    data4[index]['qty'],
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
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ));
                    }
                  })
            ])));
    //Riwayat
  }

  void _openWA() async {
    String phoneNumber = '+6282337842227';
    var url = 'https://wa.me/6282337842227';
    await launch(url);
  }
}
