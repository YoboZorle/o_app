import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oapp/pages/settings/settings.dart';
import 'package:oapp/values/values.dart';
import 'package:readmore/readmore.dart';

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
            child: new FlareActor("assets/flare/new_bg_oapp.flr",
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
                                        'https://pbs.twimg.com/media/Eg6m__UWsAY5Ahn?format=jpg&name=large'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              ReadMoreText(
                                'I am pleased that Simbo has taken the trouble to detail his thoughts and put them out for debate and analysis especially at a time when critical thinking on public affairs is narrowing.',
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
                                        'https://pbs.twimg.com/media/Eg6m9bZX0AgN7m_?format=jpg&name=small'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              ReadMoreText(
                                'Some have argued that one of the challenges we have faced as a nation is the reluctance of our best minds to get involved in politics. Simbo argues that we must approach this at retail level and not with wholesale mentality.',
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
                                        'https://pbs.twimg.com/media/EfpgiM-WkAY0Nyc?format=jpg&name=medium'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              ReadMoreText(
                                'Vision is important but so is memory. History is far too essential for us to de-prioritize. When the Federal Government decided to re-introduce history into the curriculum across schools, it was a decision to have our children understand the life that preceded them.',
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
                                        'https://pbs.twimg.com/media/Ee-XByFXgAAyJ60?format=jpg&name=medium'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              ReadMoreText(
                                'There is need for an urgent, honest and frank conversation about judicial reforms especially, the selection and appointment of judges in Nigeria, given the significant roles judges play in the polity, social justice and democracy itself.',
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
                                        'https://pbs.twimg.com/media/Ec6rS90X0AEENaa?format=jpg&name=medium'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              ReadMoreText(
                                'Our experience here in Nigeria is that that anonymous corporate ownership covers a multitude of sins including conflict of interest, corruption, tax evasion and even terrorism financing. \nNigeria is in the process of amending its law to mandate disclosure of beneficial interests.',
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
              'Move With Osinbajo',
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
