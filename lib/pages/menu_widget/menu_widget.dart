/*
*  fresh_widget.dart
*  OApp
*
*  Created by Yobo Zorle .
*  Copyright © 2018 Klynox. All rights reserved.
    */

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oapp/pages/digital_activitist/digital_ac.dart';
import 'package:oapp/pages/digital_town_hall/digital_town_hall.dart';
import 'package:oapp/pages/move_with-os/move_with_os.dart';
import 'package:oapp/pages/o_meetup/o_meetup.dart';
import 'package:oapp/pages/o_merch/o_merch.dart';
import 'package:oapp/pages/settings/settings.dart';
import 'package:oapp/pages/the_man/the_man.dart';
import 'package:oapp/pages/week_review/week_review.dart';
import 'package:oapp/values/borders.dart';
import 'package:oapp/values/values.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MenuWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> with TickerProviderStateMixin {
  final String _search = 'assets/svg/search.svg';
  final String _settings = 'assets/svg/settings.svg';
  final String _connect = 'assets/svg/connect.svg';

  final List<YoutubePlayerController> _controllers = [
    'KDpw-6QneYo',
    'Ff-ZbwLnglA',
    'ixR9QS26RcU',
  ]
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        ),
      )
      .toList();

  final List<String> imgList = [
    'assets/images/tube.png',
    'assets/images/web.png',
    'assets/images/tweet.png',
    'assets/images/ig.png'
  ];


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
              header(),
              title(),
//              Container(
//                  child: CarouselSlider(
//                enlargeCenterPage: true,
//                pauseAutoPlayOnTouch: Duration(seconds: 5),
//                autoPlay: true,
//                initialPage: 1,
//                items: imgList
//                    .map((item) => Container(
//                          child: Center(
//                              child: Container(
//                            padding: const EdgeInsets.all(2.0),
//                            child: Image.asset(item,
//                                fit: BoxFit.cover, width: 1000),
//                          )),
//                        ))
//                    .toList(),
//              )),
              Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      pauseAutoPlayOnTouch: true,
                      scrollPhysics: BouncingScrollPhysics(),
                      aspectRatio: 18/9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 1000),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: imgList.map((item) => Container(
                      child: Container(
                          padding: const EdgeInsets.all(0.0),
                          child: Image.asset(item, fit: BoxFit.cover, width: 1000)
                      ),
                    )).toList(),
                  )
              ),
              // youtube(),
              subtitle(),
              menu(),
            ],
          ),
        ),
      );

  header() => Container(
        height: 65,
        margin: EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              width: 50,
              child: new FlareActor("assets/flare/logo_oapp_small.flr",
                  fit: BoxFit.contain),
            ),
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
//                  GestureDetector(
//                      child: Container(
//                        height: 25,
//                        width: 30,
//                        alignment: Alignment.centerRight,
//                        child: SvgPicture.asset(
//                            _settings, // Bright shade at the top
//                            height: 22,
//                            width: 22,
//                            color: AppColors.primaryText,
//                            semanticsLabel: 'bg bottom image'),
//                      ),
//                      onTap: () {}),

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
                        MaterialPageRoute(builder: (context) => Settings()),
                      );
                    },
                  ),
//                  PopupMenuButton<String>(
//                      onSelected: null,
//                      child: Container(
//                        height: 25,
//                        width: 30,
//                        alignment: Alignment.centerRight,
//                        child: SvgPicture.asset(
//                            _settings, // Bright shade at the top
//                            height: 22,
//                            width: 22,
//                            color: AppColors.primaryText,
//                            semanticsLabel: 'bg bottom image'),
//                      ),
//                      color: AppColors.primaryText,
//                      itemBuilder: (BuildContext context) {
//                        return Constants.choices.map((String choice) {
//                          return PopupMenuItem<String>(
//                            value: choice,
//                            child: Center(
//                              child: Text(
//                                choice,
//                                style: TextStyle(
//                                    color: AppColors.bgLowerGreen,
//                                    fontFamily: 'Ubuntu',
//                                fontWeight: FontWeight.w500,
//                                fontSize: 15),
//                              ),
//                            ),
//                          );
//                        }).toList();
//                      }),
                ],
              ),
            ),
          ],
        ),
      );

  title() => Container(
        height: 22,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 35, bottom: 15, left: 15, right: 15),
        child: SvgPicture.asset(_connect, // Bright shade at the top
            height: 21,
            semanticsLabel: 'bg bottom image'),
      );

  subtitle() => Container(
      margin: EdgeInsets.only(top: 15, left: 15, right: 15),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Making The Nigeria Of Our Dreams',
            style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.w800,
                fontFamily: 'Ubuntu',
                fontSize: 17),
          ),
          SizedBox(height: 2),
          Text(
            'Join the movement now!',
            style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.w400,
                fontFamily: 'Ubuntu',
                fontSize: 14),
          ),
        ],
      ));

  menu() => Container(
        margin: EdgeInsets.only(left: 40, right: 40),
        child: Column(
          children: <Widget>[
            Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(Borders.primaryBorder),
                ),
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: AppColors.primaryText.withOpacity(0.4),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 7),
                        // color: Colors.white.withOpacity(0.2),
                        child: Row(
                          children: [
                            Container(
                              width: 27,
                              height: 27,
                              margin: EdgeInsets.only(left: 18),
                              decoration: BoxDecoration(
                                border: Border.fromBorderSide(
                                    Borders.secondaryBorder),
                                borderRadius: Radii.k16pxRadius,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 25),
                              child: Text(
                                "Join Our Community",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontFamily: "Ubuntu",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  letterSpacing: -0.3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DigitalAc()),
                        );
                      },
                    ))),
            Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(Borders.primaryBorder),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: AppColors.primaryText.withOpacity(0.4),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 7),
                      // color: Colors.white.withOpacity(0.2),
                      child: Row(
                        children: [
                          Container(
                            width: 27,
                            height: 27,
                            margin: EdgeInsets.only(left: 18),
                            decoration: BoxDecoration(
                              border: Border.fromBorderSide(
                                  Borders.secondaryBorder),
                              borderRadius: Radii.k16pxRadius,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25),
                            child: Text(
                              "The Week in Review",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                letterSpacing: -0.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WeekReview()),
                      );
                    },
                  ),
                )),
            Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(Borders.primaryBorder),
                ),
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: AppColors.primaryText.withOpacity(0.4),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 7),
                        // color: Colors.white.withOpacity(0.2),
                        child: Row(
                          children: [
                            Container(
                              width: 27,
                              height: 27,
                              margin: EdgeInsets.only(left: 18),
                              decoration: BoxDecoration(
                                border: Border.fromBorderSide(
                                    Borders.secondaryBorder),
                                borderRadius: Radii.k16pxRadius,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 25),
                              child: Text(
                                "Move with Osinbajo",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontFamily: "Ubuntu",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  letterSpacing: -0.3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MoveWithOs()),
                        );
                      },
                    ))),
            Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(Borders.primaryBorder),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: AppColors.primaryText.withOpacity(0.4),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 7),
                      // color: Colors.white.withOpacity(0.2),
                      child: Row(
                        children: [
                          Container(
                            width: 27,
                            height: 27,
                            margin: EdgeInsets.only(left: 18),
                            decoration: BoxDecoration(
                              border: Border.fromBorderSide(
                                  Borders.secondaryBorder),
                              borderRadius: Radii.k16pxRadius,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25),
                            child: Text(
                              "The Man. The People. The Journey",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                letterSpacing: -0.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TheMan(),
                          ));
                    },
                  ),
                )),
            Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(Borders.primaryBorder),
                ),
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        splashColor: AppColors.primaryText.withOpacity(0.4),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 7),
                          // color: Colors.white.withOpacity(0.2),
                          child: Row(
                            children: [
                              Container(
                                width: 27,
                                height: 27,
                                margin: EdgeInsets.only(left: 18),
                                decoration: BoxDecoration(
                                  border: Border.fromBorderSide(
                                      Borders.secondaryBorder),
                                  borderRadius: Radii.k16pxRadius,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 25),
                                child: Text(
                                  "Digital Townhall Meeting",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontFamily: "Ubuntu",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DigitalTownhall()),
                          );
                        }))),
            Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(Borders.primaryBorder),
                ),
                margin: EdgeInsets.only(bottom: 0),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      splashColor: AppColors.primaryText.withOpacity(0.4),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 7),
                        // color: Colors.white.withOpacity(0.2),
                        child: Row(
                          children: [
                            Container(
                              width: 27,
                              height: 27,
                              margin: EdgeInsets.only(left: 18),
                              decoration: BoxDecoration(
                                border: Border.fromBorderSide(
                                    Borders.secondaryBorder),
                                borderRadius: Radii.k16pxRadius,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 25),
                              child: Text(
                                "O-MEET UP",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontFamily: "Ubuntu",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  letterSpacing: -0.3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OMeetUp()),
                        );
                      }),
                )),
            Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(Borders.primaryBorder),
                ),
                margin: EdgeInsets.only(bottom: 100),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      splashColor: AppColors.primaryText.withOpacity(0.4),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 7),
                        // color: Colors.white.withOpacity(0.2),
                        child: Row(
                          children: [
                            Container(
                              width: 27,
                              height: 27,
                              margin: EdgeInsets.only(left: 18),
                              decoration: BoxDecoration(
                                border: Border.fromBorderSide(
                                    Borders.secondaryBorder),
                                borderRadius: Radii.k16pxRadius,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 25),
                              child: Text(
                                "O-Merch",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontFamily: "Ubuntu",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  letterSpacing: -0.3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OMerch()),
                        );
                      }),
                )),
          ],
        ),
      );

  void onButtonPressed(BuildContext context) {
    print('Oga has clicked 0!');
  }

  youtube() => Container(
        height: 185,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: YoutubePlayer(
          controller: _controllers[0],
          bottomActions: [
            CurrentPosition(),
            const SizedBox(width: 10.0),
            ProgressBar(isExpanded: true),
            // TotalDuration(),
            const SizedBox(width: 10.0),
            RemainingDuration(),
            FullScreenButton(),
          ],
        ),
      );
}
