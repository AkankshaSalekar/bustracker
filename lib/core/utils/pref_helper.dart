import 'package:shared_preferences/shared_preferences.dart';

class PerfsHelper {
  static const _roleKey="isDriver";
  static const _mobileKey="mobile";

  static Future<void> saveRole(bool isDriver)async{
    final prefs=await SharedPreferences.getInstance();
    await prefs.setBool(_roleKey,isDriver);
  } 

  static Future<bool> getRole()async{
    final prefs=await SharedPreferences.getInstance();
    return prefs.getBool(_roleKey)??true;
  }

  static Future<void> saveMobile(String mobile)async {
    final prefs=await SharedPreferences.getInstance();
    await prefs.setString(_mobileKey,mobile);
  }

  static Future<String?> getMobile() async{
    final prefs=await SharedPreferences.getInstance();
    return prefs.getString(_mobileKey);
  }
}