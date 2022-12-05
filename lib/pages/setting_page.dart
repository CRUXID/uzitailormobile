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
  final CurrentUser _currentUser = Get.put(CurrentUser());

  _retrieveValues() async {
    User? currentUserInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userinfo = preferences.getString("currentUser");
    if (userinfo != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userinfo);
      currentUserInfo = User.fromJson(userDataMap);
      setState(() {
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

  Widget userInfoItemProfile(IconData iconData, String user) {
    return Container(
      child: Row(
        children: [
          Icon(
            iconData,
            size: 30,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            user,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  bool isObscurePassword = true;
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         actions: <Widget>[
  //           IconButton(
  //               onPressed: () async {
  //                 await RememberUserPrefs.removeUserInfo();
  //                 Navigator.push(
  //                     context,
  //                     MaterialPageRoute(
  //                       builder: (context) => Login(),
  //                     ));
  //                 Fluttertoast.showToast(msg: "Logout ");
  //               },
  //               icon: new Icon(
  //                 Icons.logout_outlined,
  //                 color: primaryColor,
  //               ))
  //         ],
  //         title: Text("Setting"),
  //         centerTitle: true,
  //         backgroundColor: SecondaryColor,
  //         automaticallyImplyLeading: false,
  //       ),
  //       body: ListView(padding: const EdgeInsets.all(32), children: [
  //         Container(
  //             width: 120,
  //             height: 130,
  //             decoration: BoxDecoration(
  //                 border: Border.all(width: 4, color: Colors.white),
  //                 boxShadow: [
  //                   BoxShadow(
  //                       spreadRadius: 2,
  //                       blurRadius: 10,
  //                       color: Colors.black.withOpacity(0.1))
  //                 ],
  //                 shape: BoxShape.circle,
  //                 image: DecorationImage(
  //                     fit: BoxFit.contain,
  //                     image: NetworkImage(
  //                         'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png')))),
  //         const SizedBox(
  //           height: 20,
  //         ),
  //         userInfoItemProfile(Icons.person, _currentUser.user.username),
  //         const SizedBox(
  //           height: 20,
  //         ),
  //         userInfoItemProfile(Icons.email, _currentUser.user.nama),
  //         const SizedBox(
  //           height: 20,
  //         ),
  //         userInfoItemProfile(Icons.email, _currentUser.user.alamat),
  //         const SizedBox(
  //           height: 20,
  //         ),
  //         userInfoItemProfile(Icons.email, _currentUser.user.nohp),
  //         const SizedBox(
  //           height: 20,
  //         ),
  //         userInfoItemProfile(Icons.email, _currentUser.user.password),
  //         SizedBox(
  //           height: 30,
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             OutlinedButton(
  //               onPressed: () {},
  //               child: Text(
  //                 "Cancel",
  //                 style: TextStyle(
  //                     fontSize: 13, letterSpacing: 2, color: primaryColor),
  //               ),
  //               style: ElevatedButton.styleFrom(
  //                   primary: ForthColor,
  //                   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
  //                   shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(5))),
  //             ),
  //             ElevatedButton(
  //               onPressed: () {},
  //               child: Text(
  //                 "Save",
  //                 style: TextStyle(
  //                     fontSize: 13, color: Colors.white, letterSpacing: 2),
  //               ),
  //               style: ElevatedButton.styleFrom(
  //                   primary: SecondaryColor,
  //                   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
  //                   shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(5))),
  //             )
  //           ],
  //         ),
  //       ]));

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              fontSize: 13,
                              letterSpacing: 2,
                              color: primaryColor),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: ForthColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              letterSpacing: 2),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: SecondaryColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                      )
                    ],
                  ),
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
