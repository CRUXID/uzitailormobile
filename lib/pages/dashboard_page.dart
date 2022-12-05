part of 'pages.dart';

class Dashboard extends StatefulWidget {
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late TabController _tabController; // ADD THIS

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
              'Status Pesanan',
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
          Padding(
              padding: EdgeInsets.fromLTRB(15, 330, 0, 0),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF8D99AE),
                          spreadRadius: 0.1,
                          blurRadius: 3,
                          offset: Offset(0.0, 4.0))
                    ]),
                child: TextButton(
                  child: Icon(
                    Icons.add_to_home_screen_outlined,
                    color: SecondaryColor,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => track()));
                  },
                ),
              )),
          Padding(
              padding: EdgeInsets.fromLTRB(140, 330, 0, 0),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF8D99AE),
                          spreadRadius: 0.1,
                          blurRadius: 3,
                          offset: Offset(0.0, 4.0))
                    ]),
                child: TextButton(
                  child: Icon(
                    Icons.av_timer_outlined,
                    color: SecondaryColor,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Tracking()));
                  },
                ),
              )),
          Padding(
              padding: EdgeInsets.fromLTRB(270, 330, 15, 0),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF8D99AE),
                          spreadRadius: 0.1,
                          blurRadius: 3,
                          offset: Offset(0.0, 4.0))
                    ]),
                child: TextButton(
                  child: Icon(
                    Icons.checklist,
                    color: SecondaryColor,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                ),
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 440, 15, 0),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Tunggu Konfirmasi',
                  style: FontButton.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8D99AE)),
                ),
              ]),
              //textAlign: TextAlign.right,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(174, 440, 15, 0),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Proses',
                  style: FontButton.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8D99AE)),
                ),
              ]),
              //textAlign: TextAlign.right,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(304, 440, 15, 0),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Selesai',
                  style: FontButton.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8D99AE)),
                ),
              ]),
              //textAlign: TextAlign.right,
            ),
          ),
        ]));
  }
}
