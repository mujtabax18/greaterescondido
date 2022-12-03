import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';
import 'package:greaterescondido/models/webviewurl.dart';

class CustomWebView extends StatefulWidget {
   CustomWebView({
    Key? key}) : super(key: key);
   static String id='CustomWebView';

  @override
  CustomWebViewState createState() => CustomWebViewState();
}

class CustomWebViewState extends State<CustomWebView> {

  late WebViewController controllerGlobal;
  Future<bool> browserBack(BuildContext context) async{
    print('activated');
    if (await controllerGlobal.canGoBack()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Loading....")),
      );
      print("onwill goback");
      controllerGlobal.goBack();
    }
    else {
      Navigator.pop(context);
      return Future.value(false);
     }
    return Future.value(false);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<WebViewURL>(
        builder: (_,WebViewURL,child){
          return WillPopScope(
            onWillPop: () => browserBack(context),
            child: SafeArea(
              child: Scaffold(
                  body: WebView(
                    initialUrl: WebViewURL.getURL(),
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      controllerGlobal = webViewController;
                    },
                  )),
            ),
          );});
  }
}

