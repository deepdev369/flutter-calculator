import 'package:calculator/history.dart';
import 'package:shared_preferences/shared_preferences.dart';

class shHelper{
  static String history = "";
  //function to retrive data from the storege
  static Future<String> getData() async {
    SharedPreferences shInstance = await SharedPreferences.getInstance();
    String? a =await shInstance.getString('history');
    if(a == null){
      history = " ";
    }
    else{
      history = a;
    }
    print(history);
    return history;
  }

  //function to save the history to shared preference
  static Future setData(String history) async {
    SharedPreferences shInstance = await SharedPreferences.getInstance();
    await shInstance.setString('history', history);
  }

  static Future clearData() async {
    SharedPreferences shInstance = await SharedPreferences.getInstance();
    await shInstance.setString('history', " ");
  }
}