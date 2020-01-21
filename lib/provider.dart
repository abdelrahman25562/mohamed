

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Logic extends ChangeNotifier{
  SharedPreferences pref;
void initPref()async{
  SharedPreferences.getInstance().then((x){
    pref = x;
    print(pref.get('cartItems'));
    if (pref.get('cartItems') == null) {
      pref.setStringList('cartItems', []);
      print('if');
    }

    notifyListeners();
  });
}
  Logic(){
    initPref();

    }
}