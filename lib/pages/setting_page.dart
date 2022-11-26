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
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      child: Text('Log In'),
                      style: ElevatedButton.styleFrom(
                          primary: SecondaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ));
                      },
                    ),
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
}
