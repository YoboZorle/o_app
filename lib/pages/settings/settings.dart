/*
*  fresh_widget.dart
*  OApp
*
*  Created by Yobo Zorle .
*  Copyright © 2018 Klynox. All rights reserved.
    */

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:oapp/values/values.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(),
          child:
              new FlareActor("assets/flare/new_bg_oapp.flr", fit: BoxFit.cover),
        ),
        SafeArea(child: _body()),
      ],
    ));
  }

  _body() => Container(
        // color: Colors.yellow.withOpacity(0.04),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              SizedBox(height: 5),
              appBar(),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 5),
                  padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  color: Colors.white.withOpacity(0.09),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 33,
                        width: 33,
                        margin: EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://pbs.twimg.com/profile_images/1282055533093171206/1iIQxCaf_400x400.jpg'),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text('@tolu_ahmed',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Ubuntu',
                              fontSize: 16)),
                    ],
                  )),
              firstList(),
              secondList(),
              thirdList(),
              fourthList(),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  color: Colors.white.withOpacity(0.09),
                  child: Text('General',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Ubuntu',
                          fontSize: 16))),
              fifthList(),
              sixthList(),
              seventhList(),
              eightList(),
              ninthList(),
              Container(height: 200)
            ],
          ),
        ),
      );

  Widget appBar() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.arrow_back_ios,
                  color: AppColors.primaryText, size: 23),
              onPressed: () {
                Navigator.pop(context);
              }),
          Text(
            'Settings and privacy',
            style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.w900,
                fontFamily: 'Ubuntu',
                fontSize: 18),
          ),
          Container(
            height: 25,
            width: 45,
            color: Colors.transparent,
          )
        ],
      );

  firstList() => Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Account',
                  style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Ubuntu',
                      fontSize: 15),
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 18, color: AppColors.primaryText),
              ],
            ),
            Container(
                height: 1,
                margin: EdgeInsets.only(top: 15),
                width: MediaQuery.of(context).size.width,
                color: AppColors.primaryText),
          ],
        ),
      );

  secondList() => Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Privacy and safety',
                  style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Ubuntu',
                      fontSize: 15),
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 18, color: AppColors.primaryText),
              ],
            ),
            Container(
                height: 1,
                margin: EdgeInsets.only(top: 15),
                width: MediaQuery.of(context).size.width,
                color: AppColors.primaryText),
          ],
        ),
      );

  thirdList() => Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Notifications',
                  style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Ubuntu',
                      fontSize: 15),
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 18, color: AppColors.primaryText),
              ],
            ),
            Container(
                height: 1,
                margin: EdgeInsets.only(top: 15),
                width: MediaQuery.of(context).size.width,
                color: AppColors.primaryText),
          ],
        ),
      );

  fourthList() => Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Content preference',
                  style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Ubuntu',
                      fontSize: 15),
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 18, color: AppColors.primaryText),
              ],
            ),
          ],
        ),
      );

  fifthList() => Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Display and sound',
                  style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Ubuntu',
                      fontSize: 15),
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 18, color: AppColors.primaryText),
              ],
            ),
            Container(
                height: 1,
                margin: EdgeInsets.only(top: 15),
                width: MediaQuery.of(context).size.width,
                color: AppColors.primaryText),
          ],
        ),
      );

  sixthList() => Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Data usage',
                  style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Ubuntu',
                      fontSize: 15),
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 18, color: AppColors.primaryText),
              ],
            ),
            Container(
                height: 1,
                margin: EdgeInsets.only(top: 15),
                width: MediaQuery.of(context).size.width,
                color: AppColors.primaryText),
          ],
        ),
      );

  seventhList() => Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Accessibilty',
                  style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Ubuntu',
                      fontSize: 15),
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 18, color: AppColors.primaryText),
              ],
            ),
            Container(
                height: 1,
                margin: EdgeInsets.only(top: 15),
                width: MediaQuery.of(context).size.width,
                color: AppColors.primaryText),
          ],
        ),
      );

  eightList() => Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'About OApp',
                  style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Ubuntu',
                      fontSize: 15),
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 18, color: AppColors.primaryText),
              ],
            ),
            Container(
                height: 1,
                margin: EdgeInsets.only(top: 15),
                width: MediaQuery.of(context).size.width,
                color: AppColors.primaryText),
          ],
        ),
      );

  ninthList() => Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Sign out',
                  style: TextStyle(
                      color: AppColors.redButton,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Ubuntu',
                      fontSize: 16),
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 18, color: AppColors.redButton),
              ],
            ),
          ],
        ),
      );
}
