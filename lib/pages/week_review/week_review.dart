import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oapp/pages/settings/settings.dart';
import 'package:oapp/values/values.dart';
import 'aug_details.dart';
import 'data.dart';
import 'dart:math';

import 'july_details.dart';
import 'june_details.dart';
import 'sept_details.dart';

class WeekReview extends StatefulWidget {
  @override
  _WeekReviewState createState() => new _WeekReviewState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _WeekReviewState extends State<WeekReview> {
  var currentPage = images.length - 1.0;

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
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    timeDilation = 1.0; // 1.0 means normal animation speed.

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(),
            child:
            // new FlareActor("assets/flare/bg_oapp.flr", fit: BoxFit.fill),
            new FlareActor("assets/flare/new_bg_oapp.flr", fit: BoxFit.cover), // bg_oapp.flr
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
                    thisWeek(),
                    Stack(
                      children: <Widget>[
                        CardScrollWidget(currentPage),
                        Positioned.fill(
                          child: PageView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: images.length,
                            controller: controller,
                            reverse: true,
                            itemBuilder: (context, index) {
                              return Container();
                            },
                          ),
                        )
                      ],
                    ),
                    thisMonth(),
                    Container(
                      height: 150,
                      // color: Colors.white.withOpacity(0.2),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 20),
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
//                        children:
//                            _userlist.map((user) => Reviews(user)).toList(),
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(right: 10, top: 8),
                                child: Row(
                                  children: <Widget>[
                                    Hero(
                                      tag: 'sept',
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SeptDetails(),
                                              ));
                                        },
                                        child: Container(
                                          child: Stack(
                                            children: <Widget>[
                                              Container(
                                                width: 250.0,
                                                height: 150.0,
                                                margin:
                                                EdgeInsets.only(right: 0),
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          'assets/images/june.png')),
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          18.0)),
                                                  // color: Colors.redAccent,
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                EdgeInsets.only(left: 25),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      'September',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          fontFamily: 'Ubuntu',
                                                          letterSpacing: 0.3,
                                                          fontSize: 20),
                                                    ),
                                                    SizedBox(height: 3),
                                                    Text(
                                                      "2020",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                          FontWeight.w400,
                                                          fontFamily: 'Ubuntu',
                                                          letterSpacing: 0.3,
                                                          fontSize: 15),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 10, top: 8),
                                child: Row(
                                  children: <Widget>[
                                    Hero(
                                      tag: 'aug',
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AugDetails(),
                                              ));
                                        },
                                        child: Container(
                                          child: Stack(
                                            children: <Widget>[
                                              Container(
                                                width: 250.0,
                                                height: 150.0,
                                                margin:
                                                    EdgeInsets.only(right: 0),
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          'assets/images/aug.png')),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              18.0)),
                                                  // color: Colors.redAccent,
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 25),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      'AUGUST',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontFamily: 'Ubuntu',
                                                          letterSpacing: 0.3,
                                                          fontSize: 20),
                                                    ),
                                                    SizedBox(height: 3),
                                                    Text(
                                                      "2020",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Ubuntu',
                                                          letterSpacing: 0.3,
                                                          fontSize: 15),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 10, top: 8),
                                child: Row(
                                  children: <Widget>[
                                    Hero(
                                      tag: 'july',
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    JulyDetails(),
                                              ));
                                        },
                                        child: Container(
                                          child: Stack(
                                            children: <Widget>[
                                              Container(
                                                width: 250.0,
                                                height: 150.0,
                                                margin:
                                                    EdgeInsets.only(right: 0),
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          'assets/images/july.png')),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              18.0)),
                                                  // color: Colors.redAccent,
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 25),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      'JULY',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontFamily: 'Ubuntu',
                                                          letterSpacing: 0.3,
                                                          fontSize: 20),
                                                    ),
                                                    SizedBox(height: 3),
                                                    Text(
                                                      "2020",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Ubuntu',
                                                          letterSpacing: 0.3,
                                                          fontSize: 15),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 10, top: 8),
                                child: Row(
                                  children: <Widget>[
                                    Hero(
                                      tag: 'june',
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    JuneDetails(),
                                              ));
                                        },
                                        child: Container(
                                          child: Stack(
                                            children: <Widget>[
                                              Container(
                                                width: 250.0,
                                                height: 150.0,
                                                margin:
                                                    EdgeInsets.only(right: 0),
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          'assets/images/june.png')),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              18.0)),
                                                  // color: Colors.redAccent,
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 25),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      'JUNE',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontFamily: 'Ubuntu',
                                                          letterSpacing: 0.3,
                                                          fontSize: 20),
                                                    ),
                                                    SizedBox(height: 3),
                                                    Text(
                                                      "2020",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Ubuntu',
                                                          letterSpacing: 0.3,
                                                          fontSize: 15),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
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
        margin: EdgeInsets.only(left: 15, right: 15, top: 7),
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
        margin: EdgeInsets.only(top: 30, bottom: 15, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'WEEK IN REVIEW',
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Ubuntu',
                  fontSize: 22),
            ),
          ],
        ),
      );

  thisWeek() => Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFff6e6e),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 22.0, vertical: 6.0),
                  child: Text("This Week",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Ubuntu',
                          fontSize: 14)),
                ),
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text("4+ reviews",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Ubuntu',
                    fontSize: 14)),
          ],
        ),
      );

  thisMonth() => Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 13, top: 4, bottom: 4),
                child: Text("View all",
                    style: TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Ubuntu',
                        fontSize: 14)),
              ),
            ),
          ],
        ),
      );
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.bgLowerGreen,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(3.0, 6.0),
                          blurRadius: 10.0)
                    ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(images[i], fit: BoxFit.cover),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          // color: AppColors.bgLowerGreen.withOpacity(0.7),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                AppColors.bgLowerGreen.withOpacity(0.0),
                                AppColors.bgLowerGreen.withOpacity(1)
                              ])),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Text(title[i],
                                    maxLines: 3,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontFamily: "Ubuntu")),
                              ),
//                              SizedBox(
//                                height: 10.0,
//                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 13.0, bottom: 12),
                                child: Text(dates[i],
                                    style: TextStyle(
                                        color: AppColors.primaryText,
                                        fontSize: 13,
                                        fontFamily: "Ubuntu")),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, bottom: 12.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 22.0, vertical: 6.0),
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryText,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Text("Read more",
                                      style: TextStyle(
                                          fontFamily: "Ubuntu",
                                          color: AppColors.bgLowerGreen)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
