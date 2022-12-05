import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uzitailor/model/user.dart';

class RememberUserPrefs {
  // SAVE USER INFO
  static Future<void> storeUserInfo(User userinfo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userJsonData = jsonEncode(userinfo.toJson());
    await preferences.setString("currentUser", userJsonData);
  }

  // get-read user-info
  static Future<User?> readUserInfo() async {
    User? currentUserInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userinfo = preferences.getString("currentUser");
    if (userinfo != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userinfo);
      currentUserInfo = User.fromJson(userDataMap);
    }
    return currentUserInfo;
  }

  static Future getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt("valueSharedPreferences");
  }

  static Future<void> removeUserInfo() async {
    User? currentUserInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove("currentUser");
  }
}
