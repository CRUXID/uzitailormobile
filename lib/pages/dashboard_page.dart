part of 'pages.dart';

class Dashboard extends StatefulWidget {
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late TabController _tabController; // ADD THIS

  final _pageController = PageController(viewportFraction: 0.877);

  double currentPage = 0;
  late String id;
  late Future<tanggal> futuretanggal;
  var data;
  Future<tanggal> fetchtanggal() async {
    final response = await http.get(Uri.parse(API.selecttanggal));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return tanggal.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future getDataTanggal() async {
    // MEMINTA DATA KE SERVER DENGAN KETENTUAN YANG DI ACCEPT ADALAH JSON
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
    var response = await http.post(Uri.parse(API.selecttanggal), body: {
      "id_pembeli": id,
    });
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
      print(data);
      return data;
    }
  }

  //indicator handler
  @override
  void initState() {
    //pagecontroller dibuat selalu listening
    //setiap pageview discrollke samping maka akan mengambil index page
    // _pageController.addListener(() {
    //   setState(() {
    //     currentPage = _pageController.page!.toDouble();
    //     print(currentPage);
    //   });
    // });
    super.initState();
    getDataTanggal();
    // futuretanggal = fetchtanggal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          SizedBox(
            height: 80,
          ),
          Text(
            "Status Pesanan",
            style: TextStyle(
                color: Color(0xFF8D99AE),
                fontWeight: FontWeight.w300,
                fontSize: 17),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Color(0xFF8D99AE),
            thickness: 1,
          ),
          Container(
            // margin: EdgeInsets.only(top:),
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: Color(0xFFEF233C),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(150),
                  bottomLeft: Radius.circular(150)),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: EdgeInsets.only(top: 80, left: 50, right: 50),
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                  color: Color(0xFF414460),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38, spreadRadius: 0.1, blurRadius: 5)
                  ]),
              child: Column(children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  'On Going Transaction',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Color(0xFF8D99AE),
                  thickness: 1,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Estimasi Pesanan Selesai',
                  style: TextStyle(
                      color: Color(0xFF8D99AE),
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '$data',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ])),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 280, 0, 0),
            child: Text(
              'Katalog Barang',
              style: TextStyle(
                  color: Color(0xFF8D99AE),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(15, 305, 15, 0),
              child: Divider(
                color: Color(0xFF8D99AE),
                thickness: 1,
              )),
          ListView(
            children: [
              SizedBox(
                height: 315,
              ),
              Container(
                height: 400,
                child: PageView(
                  //boucingscrollphysics() membuat efek mantul saat discroll ke samping
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,

                  //membuat pageview dapat discroll ke samping
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      // child: Text(
                      //   'Kemeja Lengan Panjang',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //       fontSize: 14,
                      //       color: SecondaryColor,
                      //       fontWeight: FontWeight.bold),
                      // ),
                      margin: EdgeInsets.only(right: 15),
                      width: 200,
                      height: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/kemeja.jpg'),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      width: 350,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/jas_almet.jpg'),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      width: 350,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/seragam_kerja.jpg'),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      width: 350,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/skaos.jpg'),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      width: 350,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/ukuran.jpg'),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      width: 350,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/ukuran-2.jpg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ]));
  }
}
