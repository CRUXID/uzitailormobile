part of 'pages.dart';

class Tracking extends StatefulWidget {
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking>
    with SingleTickerProviderStateMixin {
  late int currentTab;
  late TabController _tabController = new TabController(length: 4, vsync: this);

  late String id;
  List<Trackstatus> _list1 = [];
  List<Trackstatus> _list2 = [];
  List<Trackstatus> _list3 = [];
  List<Trackstatus> _list4 = [];

  var loading = false;

  Future<Null> _ambildata1() async {
    setState(() {
      loading = true;
    });
    User? currentUserInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userinfo = preferences.getString("currentUser");
    if (userinfo != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userinfo);
      currentUserInfo = User.fromJson(userDataMap);
      setState(() {
        id = currentUserInfo?.id.toString() ?? "";
      });
      print(id);
    }
    final response = await http.post(Uri.parse(API.status1), body: {
      "id_pembeli": id,
    });
    if (response.statusCode == 200) {
      final ambill = jsonDecode(response.body);
      setState(() {
        for (Map i in ambill) {
          _list1.add(Trackstatus.fromJson(ambill[_list1.length]));
        }
        loading = false;
        print('data status 1 $ambill');
      });
    }
  }

  Future<Null> _ambildata2() async {
    setState(() {
      loading = true;
    });
    User? currentUserInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userinfo = preferences.getString("currentUser");
    if (userinfo != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userinfo);
      currentUserInfo = User.fromJson(userDataMap);
      setState(() {
        id = currentUserInfo?.id.toString() ?? "";
      });
      print(id);
    }

    final response = await http.post(Uri.parse(API.status2), body: {
      "id_pembeli": id,
    });
    if (response.statusCode == 200) {
      final ambill = jsonDecode(response.body);
      setState(() {
        for (Map i in ambill) {
          _list2.add(Trackstatus.fromJson(ambill[_list2.length]));
        }
        loading = false;
        print('data status 2 $ambill');
      });
    }
  }

  Future<Null> _ambildata3() async {
    setState(() {
      loading = true;
    });
    User? currentUserInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userinfo = preferences.getString("currentUser");
    if (userinfo != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userinfo);
      currentUserInfo = User.fromJson(userDataMap);
      setState(() {
        id = currentUserInfo?.id.toString() ?? "";
      });
      print(id);
    }

    final response = await http.post(Uri.parse(API.status3), body: {
      "id_pembeli": id,
    });
    if (response.statusCode == 200) {
      final ambill = jsonDecode(response.body);
      setState(() {
        for (Map i in ambill) {
          _list3.add(Trackstatus.fromJson(ambill[_list3.length]));
        }
        loading = false;
        print('data status 3 $ambill');
      });
    }
  }

  Future<Null> _ambildata4() async {
    setState(() {
      loading = true;
    });
    User? currentUserInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userinfo = preferences.getString("currentUser");
    if (userinfo != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userinfo);
      currentUserInfo = User.fromJson(userDataMap);
      setState(() {
        id = currentUserInfo?.id.toString() ?? "";
      });
      print(id);
    }

    final response = await http.post(Uri.parse(API.status4), body: {
      "id_pembeli": id,
    });
    if (response.statusCode == 200) {
      final ambill = jsonDecode(response.body);
      setState(() {
        for (Map i in ambill) {
          _list4.add(Trackstatus.fromJson(ambill[_list4.length]));
        }
        loading = false;
        print('data status 4 $ambill');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _ambildata1();
    _ambildata2();
    _ambildata3();
    _ambildata4();
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
                  itemCount: _list1.length,
                  itemBuilder: (context, i) {
                    final x1 = _list1[i];
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
                                    x1.waktu,
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
                              //COBA
                              ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.all(10),
                                  itemCount: x1.barang.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        child: Card(
                                            shadowColor: Colors.black,
                                            clipBehavior: Clip.antiAlias,
                                            elevation: 8,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    primaryColor,
                                                    primaryColor
                                                  ],
                                                ),
                                              ),
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          x1.barang[index]
                                                              .namaBarang
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 12),
                                                        ),
                                                        Text(
                                                          x1.barang[index].qty
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 12),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            x1.barang[index]
                                                                .subTotal
                                                                .toString(),
                                                            textAlign:
                                                                TextAlign.end,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontSize: 12),
                                                          ),
                                                        ]),
                                                  ]),
                                            )));
                                  }),

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
                                      x1.total,
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
                  }),
              //end pending
              //proses
              ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: _list2.length,
                  itemBuilder: (context, i) {
                    final x = _list2[i];
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
                                  x.waktu,
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
                            //COBA
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(10),
                                itemCount: x.barang.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                      child: Card(
                                          shadowColor: Colors.black,
                                          clipBehavior: Clip.antiAlias,
                                          elevation: 8,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  primaryColor,
                                                  primaryColor
                                                ],
                                              ),
                                            ),
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        x.barang[index]
                                                            .namaBarang
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 12),
                                                      ),
                                                      Text(
                                                        x.barang[index].qty
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 12),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          x.barang[index]
                                                              .subTotal
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 12),
                                                        ),
                                                      ]),
                                                ]),
                                          )));
                                }),

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
                                    x.total,
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
                                  onPressed: null,
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
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ));
                  }),
              //end proses

              //Mulai selesai
              ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: _list3.length,
                  itemBuilder: (context, i) {
                    final x = _list3[i];
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
                                  x.waktu,
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
                            //COBA
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(10),
                                itemCount: x.barang.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                      child: Card(
                                          shadowColor: Colors.black,
                                          clipBehavior: Clip.antiAlias,
                                          elevation: 8,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  primaryColor,
                                                  primaryColor
                                                ],
                                              ),
                                            ),
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        x.barang[index]
                                                            .namaBarang
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 12),
                                                      ),
                                                      Text(
                                                        x.barang[index].qty
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 12),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          x.barang[index]
                                                              .subTotal
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 12),
                                                        ),
                                                      ]),
                                                ]),
                                          )));
                                }),

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
                                    x.total,
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
                                    Get.to(faktur(),
                                        duration: Duration(seconds: 1),
                                        arguments: [x.kodeTransaksi]);
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
                  }),
              //end selesai

              //Riwayat
              ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: _list4.length,
                  itemBuilder: (context, i) {
                    final x = _list4[i];

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
                                  x.waktu,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Text(
                                  x.kodeTransaksi,
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
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(10),
                                itemCount: x.barang.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                      child: Card(
                                          shadowColor: Colors.black,
                                          clipBehavior: Clip.antiAlias,
                                          elevation: 8,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  primaryColor,
                                                  primaryColor
                                                ],
                                              ),
                                            ),
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        x.barang[index]
                                                            .namaBarang
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 12),
                                                      ),
                                                      Text(
                                                        x.barang[index].qty
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 12),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10.0,
                                                  ),
                                                ]),
                                          )));
                                }),
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
                                    Get.to(() => Riwayat(),
                                        arguments: [x.kodeTransaksi]);
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
