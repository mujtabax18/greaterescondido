import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:greaterescondido/Models/webviewbrains.dart';
import 'package:greaterescondido/pages/customwebview.dart';

class WebViewURL extends ChangeNotifier {
 late WebViewBrain _weburl;
  bool _homepage=false;

 bool get homepage => _homepage;

  void addURL({required String url,required BuildContext context}){
  _weburl=new WebViewBrain(name: url);
  gotowebview(context);
}

void toggleNotHomePage(){
    _homepage=false;
    notifyListeners();
}
void toggleHomePage(){
  _homepage=true;
  notifyListeners();
}
String getURL(){
 return _weburl.name;
}
  bool chkurl(){
    return _weburl.name==null ? false: true;
  }
 void gotowebview(BuildContext context) {
   Navigator.pushNamed(context, CustomWebView.id);
 }
}