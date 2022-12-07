part of 'pages.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          SizedBox(
            height: 54,
          ),
          Image.asset('assets/images/Uzi Logo 1.png',
              height: 226.01, width: 250),
          SizedBox(
            height: 15,
          ),
          Text(
            "Welcome",
            style: FontJudul,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Halo Deck \nSelamat Datang di Aplikasi Uzi Tailor ",
            style: FontIsi.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width - 2 * defaultMargin,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register(),
                    ));
              },
              child: Text(
                "Create Account",
                style: FontButton.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              style: ElevatedButton.styleFrom(
                  primary: SecondaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100))),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width - 2 * defaultMargin,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
              },
              child: Text(
                "Login",
                style: FontButton.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              style: ElevatedButton.styleFrom(
                  primary: SecondaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100))),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "All Right Reserved @2022",
            style: FontIsi.copyWith(fontSize: 10, color: SecondaryColor),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ));
  }
}
