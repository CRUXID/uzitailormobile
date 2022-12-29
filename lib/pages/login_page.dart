part of 'pages.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late bool _obscureText = true;
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  var formkey = new GlobalKey<FormState>();

  Login() async {
    try {
      var res = await http.post(
        Uri.parse(API.Login),
        body: {
          'username': user.text.trim(),
          'password': pass.text.trim(),
        },
      );

      if (res.statusCode == 200) //Connection with API to server is succes
      {
        var result = jsonDecode(res.body);

        if (result['Berhasil'] == true) {
          Fluttertoast.showToast(msg: "Login Succesfully");

          User userinfo = User.fromJson(result["userData"]);

          // save userInfo to local storage pake Shared Preferences
          await RememberUserPrefs.storeUserInfo(userinfo);

          // Fungsi pindah Activity dari Login ke Dashboard
          Future.delayed(Duration(milliseconds: 2), () {
            Get.to(() => Home());
            print("Berhasil");
            print(User);
          });
        } else {
          Fluttertoast.showToast(msg: "Username atau Password Salah");
        }
      }
    } catch (errorMsg) {
      Fluttertoast.showToast(msg: "Error : " + errorMsg.toString());
      print("Error :: " + errorMsg.toString());
      print("hdbdkwbjhfw");
    }
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    user.addListener(_printValue);
    pass.addListener(_printValue);
  }

  _printValue() {
    print("Value: ${user.text}");
    print("Value: ${pass.text}");
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    GestureDetector(onTap: () => FocusScope.of(context).unfocus());
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
              "Log In",
              style: FontJudul,
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 04),
                    TextFormField(
                      controller: user,
                      validator: (val) =>
                          val == "" ? "Masukkan Username" : null,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: "Username"),
                      inputFormatters: [],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val == "" ? "Masukkan Password" : null,
                      controller: pass,
                      decoration: InputDecoration(
                          // suffixIcon: GestureDetector(
                          //   onTap: () {
                          //     setState(() {
                          //       _obscureText = !_obscureText;
                          //     });
                          //   },
                          //   child: Icon(_obscureText
                          //       ? Icons.visibility
                          //       : Icons.visibility_off),
                          // ),

                          prefixIcon: Icon(Icons.lock),
                          labelText: "Password"),
                      obscureText: _obscureText,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                height: 50,
                child: InkWell(
                  child: ElevatedButton(
                    child: Text('Log In'),
                    style: ElevatedButton.styleFrom(
                        primary: SecondaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100))),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => Home(),
                      //     ));

                      if (formKey.currentState!.validate()) {
                        _printValue();
                        Login();
                        // login2();
                        // login();
                      }
                    },
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "Don't Have Account? ",
                  style: FontButton.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF8D99AE)),
                ),
                TextSpan(
                    text: 'Sign Up',
                    style: FontButton.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD90429)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(() => Register());
                      }),
              ]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
