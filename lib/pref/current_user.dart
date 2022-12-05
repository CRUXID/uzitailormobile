import 'package:uzitailor/model/user.dart';
import 'package:uzitailor/pref/user_pref.dart';
import 'package:get/get.dart';
import 'package:uzitailor/model/user.dart';
import 'package:uzitailor/pref/user_pref.dart';

class CurrentUser extends GetxController {
  Rx<User> _currentUser = User(0, '', '', '', '', '').obs;

  User get user => _currentUser.value;
  getUserinfo() async {
    User? getUserInfoFromLocalStorage = await RememberUserPrefs.readUserInfo();
    _currentUser.value = getUserInfoFromLocalStorage!;
  }
}
