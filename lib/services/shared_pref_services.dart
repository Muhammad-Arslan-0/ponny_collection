import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefServices {
  static Future setValue(bool value) async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    await userPref.setBool("isBoardComplete", value);
  }

  static Future<bool?> getValue() async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    return await userPref.getBool("isBoardComplete");
  }
}
