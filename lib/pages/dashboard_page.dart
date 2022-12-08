part of 'pages.dart';

class Dashboard extends StatefulWidget {
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late TabController _tabController; // ADD THIS

  final _pageController = PageController(viewportFraction: 0.877);

  double currentPage = 0;

  //indicator handler
  @override
  void initState() {
    //pagecontroller dibuat selalu listening
    //setiap pageview discrollke samping maka akan mengambil index page
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.toDouble();
        print(currentPage);
      });
    });
    super.initState();
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
                  'Rabu, 10 Oktober 2022',
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
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
                          ),
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
                          image: NetworkImage(
                            "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
                          ),
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
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1584810359583-96fc3448beaa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
                          ),
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
