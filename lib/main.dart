/*
*  main.dart
*  OApp
*
*  Created by Yobo Zorle .
*  Copyright © 2018 Klynox. All rights reserved.
    */

import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/reg_widget/reg_widget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: RegWidget(),
//    );
    return MaterialApp(
      title: 'OApp Welcome',
      debugShowCheckedModeBanner: false,
//      home: Container(
//        color: Colors.red,
//        child: SplashScreen(
//          'assets/flare/oapp_logo_try.flr',
//          RegWidget(),
//          until: () => Future.delayed(Duration(seconds: 20)),
//          width: double.infinity,
//          height: double.infinity,
//          startAnimation: 'anim_splash',
//          // backgroundColor: Color(0xff181818),
//        ),
//      ),
      home: SplashSscreen(),
    );
  }
}

class SplashSscreen extends StatefulWidget {
  final Color backgroundColor = Colors.white;
  final TextStyle styleTextUnderTheLoader = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  _SplashSscreenState createState() => _SplashSscreenState();
}

class _SplashSscreenState extends State<SplashSscreen> {
  String _versionName = 'V1.0';
  final splashDelay = 6;

  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context,

        MaterialPageRoute(builder: (BuildContext context) => RegWidget()));
//        PageRouteBuilder(
//            transitionDuration: Duration(milliseconds: 900),
//            pageBuilder: (_, __, ___) => RegWidget()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        // fit: StackFit.expand,
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(),
            child:
                // new FlareActor("assets/flare/bg_oapp.flr", fit: BoxFit.fill),
                new FlareActor("assets/flare/new_bg_oapp2.flr",
                    fit: BoxFit.cover), // bg_oapp.flr
          ),
          Center(
            child: new Container(
                height: 300,
                width: 300,
                decoration: new BoxDecoration(),
                child:
                    // new FlareActor("assets/flare/bg_oapp.flr", fit: BoxFit.fill),
                    new FlareActor("assets/flare/anim_try3.flr",
                        animation: 'intro',
                        fit: BoxFit.contain), // bg_oapp.flr
              ),
          ),
        ],
      ),
    );
  }
}
