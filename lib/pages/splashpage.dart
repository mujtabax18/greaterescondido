import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:greaterescondido/pages/homepage.dart';


class SplashScreen extends StatefulWidget {
 static String id='SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashDelay = 2;
  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, checkFirstSeen);
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _introSeen = (prefs.getBool('intro_seen') ?? false);
    Navigator.pop(context);
    if (_introSeen) {
      Navigator.pushNamed(context, HomePage.id);
    } else {
      await prefs.setBool('intro_seen', true);
      Navigator.pushNamed(context, SplashScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: new Image.asset('images/background.png', fit: BoxFit.fill));
  }
}



