part of 'pages.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nama = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController nohp = TextEditingController();
  TextEditingController alamat = TextEditingController();
  var formkey = new GlobalKey<FormState>();

  //nyoba yg lebih rapih
  validateUsername() async {
    try {
      var res = await http.post(
        Uri.parse(API.validate),
        body: {
          'username': username.text.trim(),
        },
      );

      if (res.statusCode == 200) //Connection with API to server is succes
      {
        var result = jsonDecode(res.body);
        // var resbodyofvalidateEmail = await json.decode(json.encode(res.body));

        if (result['user'] == true) {
          Fluttertoast.showToast(msg: "Username Telah Terdaftar");
        } else {
          // Register & save new user record to database
          RegisterAndsaveUserRecord();
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  RegisterAndsaveUserRecord() async {
    User userModel = User(1, nama.text.trim(), alamat.text.trim(),
        nohp.text.trim(), username.text.trim(), password.text.trim());

    try {
      var res = await http.post(
        Uri.parse(API.Register),
        body: userModel.toJson(),
      );
      if (res.statusCode == 200) {
        // var resbodyofSignUp = await jsonDecode(jsonEncode(res.body));
        var resbodyofSignUp = jsonDecode(res.body);
        if (resbodyofSignUp['Berhasil'] == true) {
          Fluttertoast.showToast(msg: "Register Berhasil");

          setState(() {
            nama.clear();
            username.clear();
            password.clear();
            alamat.clear();
            nohp.clear();
          });
          Get.to(Login());
        } else {
          Fluttertoast.showToast(msg: "Register Gagal");
        }
      }
    } catch (e) {
      print(e.toString());
      print("sndsdkkdand");
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: primaryColor,
        body: Center(
            child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset('assets/images/Uzi Logo 1.png',
                height: 226.01, width: 250),
            SizedBox(
              height: 10,
            ),
            Text(
              "Register",
              style: FontJudul,
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 15,
            ),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2),
                  TextFormField(
                    validator: (val) => val == "" ? "Masukkan Username" : null,
                    controller: username,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outlined),
                        labelText: "Username"),
                  ),
                  TextFormField(
                    validator: (val) => val == "" ? "Masukkan Nama" : null,
                    controller: nama,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.face_unlock_outlined),
                        labelText: "Nama"),
                  ),
                  TextFormField(
                    validator: (val) => val == "" ? "Masukkan Alamat" : null,
                    controller: alamat,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.home_outlined),
                        labelText: "Alamat"),
                  ),
                  TextFormField(
                    validator: (val) => val == "" ? "Masukkan No HP" : null,
                    controller: nohp,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_android_outlined),
                        labelText: "No HP"),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    validator: (val) => val == "" ? "Masukkan Password" : null,
                    controller: password,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        labelText: "Password"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "By signing up, you’re agree to our \nTerms & Conditions ",
              style: FontIsi.copyWith(fontSize: 12),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 50,
                child: InkWell(
                  child: ElevatedButton(
                    child: Text('Register'),
                    style: ElevatedButton.styleFrom(
                        primary: SecondaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100))),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        validateUsername();
                      }

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => Login(),
                      //     ));
                    },
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Already have account? ',
                  style: FontButton.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF8D99AE)),
                ),
                TextSpan(
                    text: 'Sign In',
                    style: FontButton.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD90429)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(() => Login());
                      }),
              ]),
              textAlign: TextAlign.center,
            ),
          ],
        )));
  }
}
