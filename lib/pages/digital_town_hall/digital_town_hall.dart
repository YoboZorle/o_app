/*
*  fresh_widget.dart
*  OApp
*
*  Created by Yobo Zorle .
*  Copyright © 2018 Klynox. All rights reserved.
    */

import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oapp/pages/settings/settings.dart';
import 'package:oapp/values/values.dart';

import 'townhall_live.dart';

class DigitalTownhall extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DigitalTownhallState();
}

class _DigitalTownhallState extends State<DigitalTownhall>
    with SingleTickerProviderStateMixin {
  final String _search = 'assets/svg/search.svg';
  final String _settings = 'assets/svg/settings.svg';
  final String _star = 'assets/svg/star.svg';

  bool _show = true;
  Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(milliseconds: 700), (_) {
      setState(() => _show = !_show);
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(),
          child: new FlareActor("assets/flare/el_bg.flr",
              fit: BoxFit.cover), // bg_oapp.flr
        ),
        SafeArea(child: _body()),
      ],
    ));
  }

  _body() => Container(
        // color: Colors.yellow.withOpacity(0.04),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 15, right: 15, top: 5),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              header(),
              title(),
              banner(),
              subtitle(),
              inviteBtn(),
              backBtn(),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
              )
            ],
          ),
        ),
      );

  header() => Container(
        height: 65,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
                child: Stack(children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    width: 50,
                    child: new FlareActor("assets/flare/logo_oapp_small.flr",
                        fit: BoxFit.contain),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: SvgPicture.asset(_star, // Bright shade at the top
                        height: 18,
                        width: 18,
                        color: _show ? Color(0xFFFFBB1F) : Colors.transparent,
                        semanticsLabel: 'star notif icon'),
                  ),
                ]),
                onTap: () {
                  Navigator.pop(context);
                }),
            Container(
              padding: EdgeInsets.only(top: 5),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                      child: Container(
                        height: 25,
                        width: 35,
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(right: 10),
                        child:
                            SvgPicture.asset(_search, // Bright shade at the top
                                height: 22,
                                width: 22,
                                semanticsLabel: 'bg bottom image'),
                      ),
                      onTap: () {}),
                  GestureDetector(
                    child: Container(
                      height: 25,
                      width: 30,
                      alignment: Alignment.centerRight,
                      child:
                          SvgPicture.asset(_settings, // Bright shade at the top
                              height: 22,
                              width: 22,
                              color: AppColors.primaryText,
                              semanticsLabel: 'bg bottom image'),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Settings(),
                            fullscreenDialog: true),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  title() => Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 30, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'DIGITAL TOWN HALL',
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Ubuntu',
                  fontSize: 21),
            ),
          ],
        ),
      );

  banner() => Container(
        height: 180,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/townhall.png'),
            fit: BoxFit.cover,
          ),
          shape: BoxShape.rectangle,
        ),
      );

  subtitle() => Container(
      margin: EdgeInsets.only(top: 15),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('THU, 25 MAR at 09:00 AM',
              style: TextStyle(
                  color: Colors.lightGreenAccent,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Ubuntu',
                  letterSpacing: 0.2,
                  fontSize: 14.5)),
          SizedBox(height: 6),
          Text(
            'VP Osinbajo Prisides Over The Next Virtual Townhall Meeting To Discuss\n\"Encouraging Entreprenuership Amongst Nigerian Youths\"',
            style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.w800,
                fontFamily: 'Ubuntu',
                letterSpacing: 0.2,
                fontSize: 17),
          ),
          SizedBox(height: 15),
          Text(
            'MUST USE HASHTAGS',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontFamily: 'Ubuntu',
                fontSize: 18),
          ),
          SizedBox(height: 15),
          Text(
            'Join the LIVE discussion and also an opportunity to ask questions directly to the Governor of Kaduna State, Nigeria.\n',
            style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.w500,
                fontFamily: 'Ubuntu',
                fontSize: 14),
          ),
        ],
      ));

  inviteBtn() => Container(
        height: 47,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 40),
        child: FlatButton(
          color: AppColors.redButton,
          splashColor: Colors.grey[200],
          child: Text('JOIN TOWN HALL',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Ubuntu',
                  fontSize: 15)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TownHallLive()),
            );
          },
        ),
      );

  backBtn() => Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 30),
        child: FlatButton(
          child: Text('Go back',
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Ubuntu',
                  fontSize: 15)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
}
