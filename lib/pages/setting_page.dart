part of 'pages.dart';

class Setting extends StatefulWidget {
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(50),
            child: const Text(
              'Profile',
              style: TextStyle(
                  color: Color(0xFFEDF2F4),
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            ),
            width: double.infinity,
            height: 250,
            decoration: const BoxDecoration(
              color: Color(0xFFEF233C),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(150),
                  bottomLeft: Radius.circular(150)),
            ),
          ),

          Column(children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(370, 95, 15, 15)),
            CircleAvatar(
              radius: 60,
              backgroundColor: primaryColor,
              child:
                  Icon(CupertinoIcons.person_fill, size: 50, color: FifthColor),
            ),
          ]),
          Container(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 300),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline),
                        labelText: "Username"),
                    inputFormatters: [],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.tag_faces_outlined),
                        labelText: "Fullname"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.house_outlined),
                        labelText: "Alamat"),
                    inputFormatters: [],
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_android_outlined),
                        labelText: "No Hp"),
                    inputFormatters: [],
                  ),
                  TextFormField(
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
                        prefixIcon: Icon(Icons.lock_outline),
                        labelText: "Password"),
                    inputFormatters: [],
                  ),
                  SizedBox(height: 20),
                  Padding(
                      padding: EdgeInsets.fromLTRB(134, 15, 10, 10),
                      child: ElevatedButton(
                        child: const Text(
                          'Submit',
                          style: TextStyle(color: Color(0xFFEDF2F4)),
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: SecondaryColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5.0))),
                        onPressed: () {
                          //loginSumbimt();
                        },
                      )),
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
}
