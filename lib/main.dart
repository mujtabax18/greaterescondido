import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:greaterescondido/models/webviewurl.dart';
import 'package:greaterescondido/pages/splashpage.dart';
import 'package:greaterescondido/pages/homepage.dart';
import 'package:greaterescondido/pages/customwebview.dart';




void main() {
  runApp( ChangeNotifierProvider(
      create: (_)=>WebViewURL(),
      child: new MyApp()));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    // Fixing App Orientation.

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Great ',
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          hintColor: Colors.white,
          inputDecorationTheme: new InputDecorationTheme(
              labelStyle: new TextStyle(color: Colors.white),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0)))),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        SplashScreen.id: (BuildContext context) =>  SplashScreen(),
        HomePage.id: (BuildContext context) =>  HomePage(),
        CustomWebView.id:(BuildContext context) =>  CustomWebView(),

      },
    );
  }
}