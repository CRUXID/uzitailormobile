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
              height: 100,
              decoration: BoxDecoration(
                  color: Color(0xFF414460),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38, spreadRadius: 0.1, blurRadius: 5)
                  ])),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 280, 0, 0),
            child: Text(
              'Status Pesanan',
              style: TextStyle(
                  color: Color(0xFF8D99AE),
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
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
            child: ElevatedButton(
              child: const Text('1'),
              style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF8D99AE),
                  padding: EdgeInsets.symmetric(horizontal: 45, vertical: 40),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Tracking(),
                    ));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(140, 330, 0, 0),
            child: ElevatedButton(
              child: const Text('2'),
              style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF8D99AE),
                  padding: EdgeInsets.symmetric(horizontal: 45, vertical: 40),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Transaksi(),
                    ));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(270, 330, 15, 0),
            child: ElevatedButton(
              child: const Text('3'),
              style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF8D99AE),
                  padding: EdgeInsets.symmetric(horizontal: 45, vertical: 40),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Tracking(),
                    ));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 435, 15, 0),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'Tunggu Konfirmasi',
                    style: FontButton.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8D99AE)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //Navigator.push(
                        // context,
                        //MaterialPageRoute(
                        //builder: (context) => forgot(),
                        //));
                      }),
              ]),
              //textAlign: TextAlign.right,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(174, 435, 15, 0),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'Proses',
                    style: FontButton.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8D99AE)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //Navigator.push(
                        // context,
                        //MaterialPageRoute(
                        //builder: (context) => forgot(),
                        //));
                      }),
              ]),
              //textAlign: TextAlign.right,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(304, 435, 15, 0),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'Selesai',
                    style: FontButton.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8D99AE)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //Navigator.push(
                        // context,
                        //MaterialPageRoute(
                        //builder: (context) => forgot(),
                        //));
                      }),
              ]),
              //textAlign: TextAlign.right,
            ),
          ),
        ]));
  }
}
