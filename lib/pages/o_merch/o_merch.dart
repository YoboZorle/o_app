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
import 'package:oapp/values/borders.dart';
import 'package:oapp/values/values.dart';

class OMerch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OMerchState();
}

class _OMerchState extends State<OMerch> with SingleTickerProviderStateMixin {
  final String _search = 'assets/svg/search.svg';
  final String _settings = 'assets/svg/settings.svg';
  final String _star = 'assets/svg/star.svg';

  final String _1 = 'assets/svg/1.svg';
  final String _2 = 'assets/svg/2.svg';
  final String _3 = 'assets/svg/3.svg';
  final String _4 = 'assets/svg/4.svg';
  final String _5 = 'assets/svg/5.svg';

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
        SafeArea(
            child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: _body())),
      ],
    ));
  }

  _body() => Container(
        // color: Colors.yellow.withOpacity(0.04),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              header(),
              title(),
              // stocks(),
//              banner(),
//              subtitle(),
            Container(height: 350, width: 200,
            child: Center(child: Text('Coming soon', style: TextStyle(color: Colors.white),))),
              inviteBtn(),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
              )
            ],
          ),
        ),
      );

  header() => Container(
        height: 65,
        margin: EdgeInsets.only(top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(children: <Widget>[
              GestureDetector(
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: 50,
                    child: new FlareActor("assets/flare/logo_oapp_small.flr",
                        fit: BoxFit.contain),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  }),
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
        // height: 50,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 15, bottom: 13),
        child: Column(
          children: <Widget>[
            Container(
              height: 0.7,
              width: MediaQuery.of(context).size.width,
              color: AppColors.primaryText,
              margin: EdgeInsets.only(bottom: 15),
            ),
            Container(
              height: 22,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 22,
                      width: 60,
                      child: Icon(Icons.arrow_back_ios,
                          size: 21, color: AppColors.primaryText),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    'El-Merch.',
                    style: TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Ubuntu',
                        fontSize: 21),
                  ),
                  SizedBox(width: 60),
                  Expanded(child: SizedBox()),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 36,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                border: Border.fromBorderSide(Borders.secondaryBorder),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 10),
                  Icon(Icons.search, size: 25, color: AppColors.primaryText),
                  Container(
                      height: MediaQuery.of(context).size.height,
                      color: AppColors.primaryText,
                      width: 0.7,
                      margin: EdgeInsets.only(left: 10)),
                  Expanded(
                    child: TextFormField(
                      cursorColor: Colors.black,
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 10, top: 10, right: 15),
                        labelStyle: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Ubuntu',
                            fontSize: 17),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Ubuntu',
                            fontSize: 17),
                      ),
                    ),
                  ),
                ],
              ),
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
          Text(
            'VP Osinbajo Presides Over Virtual Meeting Of The National Economic Council On 09/07/2020',
            style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.w800,
                fontFamily: 'Ubuntu',
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
            'Want to stay up to date on what Team Osinbajo, #MoveWithOsinbajo #MakeNigeriaGreatAgain\n'
            'Hashtags are a great way to make sure you see what we and all your fellow supporters are saying online.\n\n'
            'It is also the best way to make sure the Prof and all the team is seeing...',
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
        margin: EdgeInsets.only(top: 30, left: 10, right: 10),
        child: FlatButton(
          color: AppColors.redButton,
          splashColor: Colors.grey[200],
          child: Text('MORE',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Ubuntu',
                  fontSize: 15)),
          onPressed: () {
            //  Navigator.pop(context);
          },
        ),
      );

  stocks() => Column(
        children: <Widget>[
          Container(
            child: Row(children: <Widget>[
              Expanded(
                child: SvgPicture.asset(_1, // Bright shade at the top
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 5,
                    semanticsLabel: 'star notif icon'),
              ),
              Expanded(
                  child: SvgPicture.asset(_2, // Bright shade at the top
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 5,
                      semanticsLabel: 'star notif icon')),
            ]),
          ),
          Container(
            child: Row(children: <Widget>[
//          Container(
//            height: 200.0,
//            width: 200.0,
//            decoration: BoxDecoration(
//              image: DecorationImage(
//                image: AssetImage('assets/images/1.png'),
//                fit: BoxFit.cover,
//              ),
//              shape: BoxShape.rectangle,
//            ),
//          ),
              Expanded(
                child: SvgPicture.asset(_3, // Bright shade at the top
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 5,
                    semanticsLabel: 'star notif icon'),
              ),
              Expanded(
                  child: SvgPicture.asset(_4, // Bright shade at the top
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 5,
                      semanticsLabel: 'star notif icon')),
            ]),
          ),
          Container(
            child: Row(children: <Widget>[
              Expanded(
                child: SvgPicture.asset(_5, // Bright shade at the top
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 5,
                    semanticsLabel: 'star notif icon'),
              ),
              Expanded(
                  child: SvgPicture.asset('', // Bright shade at the top
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 5,
                      semanticsLabel: 'star notif icon')),
            ]),
          ),
        ],
      );
}
