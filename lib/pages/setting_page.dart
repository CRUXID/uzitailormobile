part of 'pages.dart';

class Setting extends StatefulWidget {
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isObscurePassword = true;
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
            padding: EdgeInsets.only(left: 15, top: 70, right: 15),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                            width: 120,
                            height: 130,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 4, color: Colors.white),
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  buildTextField("Full Name", "Demon", false),
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
          obscureText: isPasswordTextField ? isObscurePassword : false,
          decoration: InputDecoration(
              suffixIcon: isPasswordTextField
                  ? IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                      ),
                      onPressed: () {})
                  : null,
              contentPadding: EdgeInsets.only(bottom: 5),
              labelText: labelText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: placeholder,
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey))),
    );
  }
}
