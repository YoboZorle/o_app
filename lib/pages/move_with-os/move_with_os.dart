import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oapp/pages/settings/settings.dart';
import 'package:oapp/values/values.dart';
import 'package:readmore/readmore.dart';

// https://pbs.twimg.com/media/Ev5Ijr4XcAAp81K?format=jpg&name=medium

class MoveWithOs extends StatefulWidget {
  @override
  _MoveWithOsState createState() => new _MoveWithOsState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _MoveWithOsState extends State<MoveWithOs> {
  final String _star = 'assets/svg/star.svg';
  final String _settings = 'assets/svg/settings.svg';
  final String _search = 'assets/svg/search.svg';

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
    timeDilation = 1.0; // 1.0 means normal animation speed.

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(),
            child: new FlareActor("assets/flare/el_bg.flr",
                fit: BoxFit.cover), // bg_oapp.flr
          ),
          SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    header(),
                    title(),
                    Container(
                      // color: Colors.white.withOpacity(0.2),
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.only(left: 15, right: 15),
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: double.maxFinite,
                                height: 220.0,
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25.0)),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://pbs.twimg.com/media/EBMZaGPXkAE8Uxd.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              ReadMoreText(
                              'As elected CEO of KDSG, I take ultimate responsibility for every policy, action, even errors! That is why we do not always explain some of the nuances of state governance like the sharing of responsibilities, etc. Commentators must do better than tweet false, injurious ignorance!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Ubuntu',
                                    letterSpacing: 0.3,
                                    height: 1.3,
                                    fontSize: 14),
                                trimLines: 3,
                                colorClickableText: AppColors.primaryText,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: '...show more',
                                trimExpandedText: ' show less',
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Quotes',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.lightBlueAccent,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Ubuntu',
                                        letterSpacing: 0.3,
                                        height: 1.3,
                                        fontSize: 12),
                                  ),
                                  new Container(
                                    width: 4,
                                    height: 4,
                                    margin: EdgeInsets.symmetric(horizontal: 7),
                                    decoration: new BoxDecoration(
                                      color: Colors.grey[400],
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Text(
                                    '20 mins ago',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.grey[300],
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Ubuntu',
                                        letterSpacing: 0.3,
                                        height: 1.3,
                                        fontSize: 12),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: double.maxFinite,
                                height: 220.0,
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25.0)),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://i1.wp.com/naijabiography.com/wp-content/uploads/2020/09/118685787_2648547395362897_2798202860286714231_n.jpg?fit=453%2C301&ssl=1'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              ReadMoreText(
                              'When you pick people that has never achieved anything in their lives in senior government positions, they will do anything to remain there. - Nasir Ahmad el-Rufai',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Ubuntu',
                                    letterSpacing: 0.3,
                                    height: 1.3,
                                    fontSize: 14),
                                trimLines: 3,
                                colorClickableText: AppColors.primaryText,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: '...show more',
                                trimExpandedText: ' show less',
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Truths',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.pinkAccent,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Ubuntu',
                                        letterSpacing: 0.3,
                                        height: 1.3,
                                        fontSize: 12),
                                  ),
                                  new Container(
                                    width: 4,
                                    height: 4,
                                    margin: EdgeInsets.symmetric(horizontal: 7),
                                    decoration: new BoxDecoration(
                                      color: Colors.grey[400],
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Text(
                                    '1 hour ago',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.grey[300],
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Ubuntu',
                                        letterSpacing: 0.3,
                                        height: 1.3,
                                        fontSize: 12),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: double.maxFinite,
                                height: 220.0,
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25.0)),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://pbs.twimg.com/media/EuX-mhAXcAwIaii?format=jpg&name=large'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              ReadMoreText(
                               'When you do nothing and allow problems to escalate, you are not a leader. You are a joke - Nasir Ahmad el-Rufai',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Ubuntu',
                                    letterSpacing: 0.3,
                                    height: 1.3,
                                    fontSize: 14),
                                trimLines: 3,
                                colorClickableText: AppColors.primaryText,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: '...show more',
                                trimExpandedText: ' show less',
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Quotes',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.lightBlueAccent,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Ubuntu',
                                        letterSpacing: 0.3,
                                        height: 1.3,
                                        fontSize: 12),
                                  ),
                                  new Container(
                                    width: 4,
                                    height: 4,
                                    margin: EdgeInsets.symmetric(horizontal: 7),
                                    decoration: new BoxDecoration(
                                      color: Colors.grey[400],
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Text(
                                    '3 hours ago',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.grey[300],
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Ubuntu',
                                        letterSpacing: 0.3,
                                        height: 1.3,
                                        fontSize: 12),
                                  ),
                                ],
                              )
                            ],
                          ),

                          SizedBox(
                            height: 25,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: double.maxFinite,
                                height: 220.0,
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25.0)),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://pbs.twimg.com/media/EuU3JhlXMAApYYN?format=jpg&name=large'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              ReadMoreText(
                               'If our elite have chosen not to go into politics to set the tune, the bad ones will take over. - Nasir Ahmad el-Rufai ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Ubuntu',
                                    letterSpacing: 0.3,
                                    height: 1.3,
                                    fontSize: 14),
                                trimLines: 3,
                                colorClickableText: AppColors.primaryText,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: '...show more',
                                trimExpandedText: ' show less',
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Quotes',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.lightBlueAccent,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Ubuntu',
                                        letterSpacing: 0.3,
                                        height: 1.3,
                                        fontSize: 12),
                                  ),
                                  new Container(
                                    width: 4,
                                    height: 4,
                                    margin: EdgeInsets.symmetric(horizontal: 7),
                                    decoration: new BoxDecoration(
                                      color: Colors.grey[400],
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Text(
                                    'Aug 9, 2020',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.grey[300],
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Ubuntu',
                                        letterSpacing: 0.3,
                                        height: 1.3,
                                        fontSize: 12),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: double.maxFinite,
                                height: 220.0,
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25.0)),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://pbs.twimg.com/media/EuW3FrSXAAANJu9?format=jpg&name=medium'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              ReadMoreText(
                               'We need democracy and openness in governance in Africa. - Nasir Ahmad el-Rufai',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Ubuntu',
                                    letterSpacing: 0.3,
                                    height: 1.3,
                                    fontSize: 14),
                                trimLines: 3,
                                colorClickableText: AppColors.primaryText,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: '...show more',
                                trimExpandedText: ' show less',
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Quotes',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.lightBlueAccent,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Ubuntu',
                                        letterSpacing: 0.3,
                                        height: 1.3,
                                        fontSize: 12),
                                  ),
                                  new Container(
                                    width: 4,
                                    height: 4,
                                    margin: EdgeInsets.symmetric(horizontal: 7),
                                    decoration: new BoxDecoration(
                                      color: Colors.grey[400],
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Text(
                                    'Jul 14, 2020',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.grey[300],
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Ubuntu',
                                        letterSpacing: 0.3,
                                        height: 1.3,
                                        fontSize: 12),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(bottom: 50),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  header() => Container(
        height: 65,
        margin: EdgeInsets.only(left: 15, right: 15, top: 10),
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
                onTap: (){
                  Navigator.pop(context);
                }
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
                ],
              ),
            ),
          ],
        ),
      );

  title() => Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 20, bottom: 15, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Move With El-Rufai',
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Ubuntu',
                  fontSize: 22),
            ),
          ],
        ),
      );
}
