part of 'pages.dart';

class Dashboard extends StatefulWidget {
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
            height: 200,
            decoration: BoxDecoration(
              color: Color(0xFFEF233C),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(150),
                  bottomLeft: Radius.circular(150)),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: EdgeInsets.only(top: 50, left: 50, right: 50),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  color: Color(0xFF414460),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38, spreadRadius: 0.1, blurRadius: 5)
                  ])),
        ]));
  }
}
