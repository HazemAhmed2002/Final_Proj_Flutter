import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

enum PrefKey{
  logged_In,email,name,passwored
}


class SharedPref {
  late SharedPreferences _sharedPreferences;
  SharedPref._internal();
 static final SharedPref _instance = SharedPref._internal();
  factory SharedPref(){
    return _instance;
  }
Future<void> initPreferences() async{
    _sharedPreferences =await SharedPreferences.getInstance();
}

Future<void> saveData({required User user})async {
await _sharedPreferences.setBool(PrefKey.logged_In.toString(), true);
await _sharedPreferences.setBool(PrefKey.email.toString(), true);
await _sharedPreferences.setBool(PrefKey.name.toString(), true);
await _sharedPreferences.setBool(PrefKey.passwored.toString(), true);

}
bool get loggedIn => _sharedPreferences.getBool(PrefKey.logged_In.toString()) ?? false;

  Object? getVlaue(String key){
 if(_sharedPreferences.containsKey(key)){
   return _sharedPreferences.get(key);

 }
 return null;
  }
  Future<bool> clear() async{
    return await _sharedPreferences.clear();
  }
}