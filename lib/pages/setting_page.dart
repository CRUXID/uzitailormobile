part of 'pages.dart';

class Setting extends StatefulWidget {
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  TextEditingController user = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController nohp = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController id = TextEditingController();

  EditData() async {
    try {
      var res = await http.post(
        Uri.parse(API.edit),
        body: {
          'id': id.text.trim(),
          'username': user.text.trim(),
          'nama_pembeli': nama.text.trim(),
          'alamat': alamat.text.trim(),
          'no_hp': nohp.text.trim(),
          'password': password.text.trim(),
        },
      );
      if (res.statusCode == 200) //Connection with API to server is succes
      {
        var result = jsonDecode(res.body);

        if (result['berhasil'] == true) {
          Fluttertoast.showToast(msg: "Data Berhasil Di Edit");
          // Fungsi pindah Activity dari Login ke Dashboard
          Future.delayed(Duration(milliseconds: 2), () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Setting(),
                ));
            print("berhasil");
          });
        } else {
          Fluttertoast.showToast(msg: "Data Gagal Di Edit");
          print("jsdbskjdbka");
        }
      }
    } catch (errorMsg) {
      Fluttertoast.showToast(msg: "Error : " + errorMsg.toString());
      print("Error :: " + errorMsg.toString());
      print("hdbdkwbjhfw");
    }
  }

  _retrieveValues() async {
    User? currentUserInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userinfo = preferences.getString("currentUser");
    if (userinfo != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userinfo);
      currentUserInfo = User.fromJson(userDataMap);
      setState(() {
        id.text = currentUserInfo?.id.toString() ?? "";
        nama.text = currentUserInfo?.nama.toString() ?? "";
        user.text = currentUserInfo?.username.toString() ?? "";
        password.text = currentUserInfo?.password.toString() ?? "";
        alamat.text = currentUserInfo?.alamat.toString() ?? "";
        nohp.text = currentUserInfo?.nohp.toString() ?? "";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _retrieveValues();
  }

  bool isObscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                onPressed: () async {
                  await RememberUserPrefs.removeUserInfo();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                  Fluttertoast.showToast(msg: "Logout ");
                },
                icon: new Icon(
                  Icons.logout_outlined,
                  color: primaryColor,
                ))
          ],
          title: Text("Setting"),
          centerTitle: true,
          backgroundColor: SecondaryColor,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.white,
        body: Stack(children: [
          Container(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Stack(children: [
                      Container(
                          width: 120,
                          height: 130,
                          decoration: BoxDecoration(
                              border: Border.all(width: 4, color: Colors.white),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1))
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png')))),
                    ]),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: user,
                    enabled: false,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline),
                        labelText: "Username"),
                  ),
                  TextFormField(
                    controller: nama,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.face_unlock_outlined),
                        labelText: "Nama"),
                  ),
                  TextFormField(
                    controller: alamat,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.home_outlined),
                        labelText: "Alamat"),
                  ),
                  TextFormField(
                    controller: nohp,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_android_outlined),
                        hintText: "nohp"),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        labelText: "Password"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      EditData();
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                          fontSize: 13, color: Colors.white, letterSpacing: 2),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: SecondaryColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                  )
                ],
              ),
            ),
          ),

          // Container(
          //   // margin: EdgeInsets.only(top:),
          //   width: double.infinity,
          //   height: 250,
          //   decoration: BoxDecoration(
          //     color: Color(0xFFEF233C),
          //     borderRadius: BorderRadius.only(
          //         bottomRight: Radius.circular(150),
          //         bottomLeft: Radius.circular(150)),
          //   ),
          // ),
        ]));
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        cursorColor: SecondaryColor,
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isObscurePassword = !isObscurePassword;
                    });
                  })
              : null,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, color: FifthColor),
        ),
      ),
    );
  }
}
