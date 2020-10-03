import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:oapp/values/values.dart';
import 'package:readmore/readmore.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

import 'create_post.dart';

class DigitalAc extends StatefulWidget {
  @override
  _DigitalAcState createState() => _DigitalAcState();
}

class _DigitalAcState extends State<DigitalAc>
    with SingleTickerProviderStateMixin {
  var _controller = SnappingSheetController();
  AnimationController _arrowIconAnimationController;
  Animation<double> _arrowIconAnimation;

  double _moveAmount = 0.0;

  @override
  void initState() {
    super.initState();
    _arrowIconAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _arrowIconAnimation = Tween(begin: 0.0, end: 0.5).animate(CurvedAnimation(
        curve: Curves.elasticOut,
        reverseCurve: Curves.elasticIn,
        parent: _arrowIconAnimationController));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(),
            child:
                // new FlareActor("assets/flare/bg_oapp.flr", fit: BoxFit.fill),
                new FlareActor("assets/flare/new_bg_oapp.flr",
                    fit: BoxFit.cover), // bg_oapp.flr
          ),
          SnappingSheet(
            sheetAbove: new Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Align(
                  alignment: Alignment(0.90, 1.0),
                  child: FloatingActionButton(
                    backgroundColor: AppColors.bgUpperGreen,
                    onPressed: () {
                      if (_controller.snapPositions.last !=
                          _controller.currentSnapPosition) {
                        _controller
                            .snapToPosition(_controller.snapPositions.last);
                      } else {
                        _controller
                            .snapToPosition(_controller.snapPositions.first);
                      }
                    },
                    child: RotationTransition(
                      child: Icon(
                        Icons.arrow_upward,
                        color: AppColors.primaryText,
                      ),
                      turns: _arrowIconAnimation,
                    ),
                  ),
                ),
              ),

            onSnapEnd: () {
              if (_controller.snapPositions.last !=
                  _controller.currentSnapPosition) {
                _arrowIconAnimationController.reverse();
              } else {
                _arrowIconAnimationController.forward();
              }
            },
            onMove: (moveAmount) {
              setState(() {
                _moveAmount = moveAmount;
              });
            },
            snappingSheetController: _controller,
            snapPositions: const [
              SnapPosition(
                  positionPixel: 0.0,
                  snappingCurve: Curves.elasticOut,
                  snappingDuration: Duration(milliseconds: 800)),
              SnapPosition(positionFactor: 0.4),
              SnapPosition(positionFactor: 0.5),
            ],
            child: SafeArea(
              child: DefaultTabController(
                length: 2, // This is the number of tabs.
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                  child: NestedScrollView(
                    physics: BouncingScrollPhysics(),
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverOverlapAbsorber(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                          child: SliverSafeArea(
                            top: false,
                            sliver: SliverAppBar(
                              floating: true,
                              pinned: false,
                              snap: false,
                              primary: true,
                              forceElevated: innerBoxIsScrolled,
                              elevation: 0,
                              centerTitle: true,
                              backgroundColor: Colors.transparent,
                              expandedHeight: 0.0,
                              title: title(),
                              leading: leading(),
                              actions: actions(),
                              bottom: TabBar(
                                isScrollable: false,
                                labelPadding: EdgeInsets.only(
                                    left: 15, right: 15, top: 0),
                                indicatorPadding:
                                    EdgeInsets.only(left: 15, right: 15),
                                labelStyle: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.6,
                                    color: AppColors.primaryText),
                                indicatorColor: AppColors.primaryText,
                                labelColor: AppColors.primaryText,
                                indicatorWeight: 1.5,
                                unselectedLabelColor: Colors.grey[400],
                                tabs: [
                                  Tab(text: "Community Feeds"),
                                  Tab(text: "What to Know Today"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ];
                    },
                    body: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        Container(
                          // color: Colors.red.withOpacity(0.2),
                          child: new ListView(
                              physics: BouncingScrollPhysics(),
                              children: <Widget>[
                                postA(),
                                postOne(),
                                post1(),
                                postB(),
                                postTwo(),
                                postC(),
                                postThree(),
                                postFour(),
                              ]),
                        ),
                        Container(
                          // color: Colors.red.withOpacity(0.2),
                          child: new ListView(
                              physics: BouncingScrollPhysics(),
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    newsA1(),
                                    newsA(),
                                    newsTwo(),
                                    newsThree(),
                                  ],
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            grabbingHeight: MediaQuery.of(context).padding.bottom + 45,
            grabbing: GrabSection(),
            sheetBelow: new SheetContent(),
          ),
        ],
      ),
    );
  }

  Widget title() => new Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(3),
        width: 50,
        height: 55,
        child: new FlareActor("assets/flare/logo_oapp_small.flr",
            fit: BoxFit.contain),
      );

  Widget leading() => IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          size: 24,
          color: AppColors.primaryText,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      );

  List<Widget> actions() => <Widget>[
        Row(
          children: <Widget>[
//            Badge(
//              animationType: BadgeAnimationType.slide,
//              badgeColor: Colors.red,
//              badgeContent: Text(
//                '3',
//                style: TextStyle(
//                    color: Colors.white,
//                    fontFamily: 'Ubuntu',
//                    fontSize: 14,
//                    fontWeight: FontWeight.w400),
//              ),
//              child: Icon(Icons.notifications_none,
//                  color: AppColors.primaryText, size: 25),
//            ),
            Icon(Icons.notifications_none, color: AppColors.primaryText),
            SizedBox(width: 18),
          ],
        ),
      ];

  postA() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              maxHeight: 160.0, // changed to 400
              minHeight: 100.0, // changed to 200
              maxWidth: double.infinity,
              minWidth: double.infinity,
            ),
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(),
            child: Image.network(
              'https://pbs.twimg.com/media/EHZU591WwAAyF63?format=jpg&name=large',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 15),
              Container(
                height: 33,
                width: 33,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://pbs.twimg.com/profile_images/1271596707101450241/54Z2cH5W_400x400.jpg'),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "tolanialli",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryText,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          WidgetSpan(
                            child: Container(
                              margin: EdgeInsets.only(left: 4, bottom: 1),
                              child: Icon(Icons.check_circle,
                                  size: 16, color: AppColors.primaryText),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: <Widget>[
                        Text(
                          'Somewhere making the...',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        ),
                        Container(
                            height: 10,
                            width: 1,
                            color: Colors.grey,
                            margin: EdgeInsets.symmetric(horizontal: 7)),
                        Text(
                          '33 mins ago ',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 33,
                  child: IconButton(
                      icon:
                          Icon(Icons.more_horiz, size: 22, color: Colors.grey),
                      onPressed: null)),
            ],
          ),
          Container(
            padding: new EdgeInsets.only(left: 15.0, right: 15, top: 5.0),
            child: ReadMoreText(
              'There is nothing like the unadulterated joy that comes with interacting with children. I hope this flutters your heart as it did mine. Have a great week.\n'
              '- -\n'
              '#TheHat (how appropriate for this picture'
              'Smiling face'
              ') #TolaniAlli | #PYO',
              style: TextStyle(
                  wordSpacing: 1.3,
                  color: Colors.white,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w400,
                  fontSize: 13.8,
                  height: 1.33),
              trimLines: 3,
              colorClickableText: AppColors.primaryText,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...read more',
              trimExpandedText: ' show less',
            ),
          ),
          Container(
            height: 20,
            margin: EdgeInsets.only(bottom: 35, left: 15, right: 15, top: 15),
            child: Row(
              children: <Widget>[
                Container(
                  width: 55,
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.repeat, size: 20, color: Colors.grey),
                        SizedBox(width: 3),
                        Text(
                          '378',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  width: 55,
                  margin: EdgeInsets.only(left: 8),
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 2),
                            child: Icon(Icons.reply,
                                size: 19, color: Colors.grey)),
                        SizedBox(width: 3),
                        Text(
                          '18',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                LikeButton(
                  size: 20,
                  circleColor: CircleColor(
                      start: Colors.pinkAccent, end: Color(0xff0099cc)),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Colors.red,
                    dotSecondaryColor: Colors.orangeAccent,
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? AppColors.primaryText : Colors.grey,
                      size: 18,
                    );
                  },
                  likeCount: 734,
                  countBuilder: (int count, bool isLiked, String text) {
                    var color = isLiked ? AppColors.primaryText : Colors.grey;
                    Widget result;
                    if (count == 0) {
                      result = Text(
                        "love",
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Ubuntu',
                            fontSize: 14),
                      );
                    } else
                      result = Text(
                        text,
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Ubuntu',
                            fontSize: 14),
                      );
                    return result;
                  },
                ),
                Expanded(child: SizedBox()),
                Container(
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Text(
                          '65 comments',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          // yobo_z(),
          SizedBox(height: 15),
        ],
      );

  postOne() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              maxHeight: 160.0, // changed to 400
              minHeight: 100.0, // changed to 200
              maxWidth: double.infinity,
              minWidth: double.infinity,
            ),
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(),
            child: Image.network(
              'https://pbs.twimg.com/media/EeAwYoxXgAAeaa-?format=jpg&name=large',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 15),
              Container(
                height: 33,
                width: 33,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://pbs.twimg.com/profile_images/1292457301543133185/p95CSX9c_400x400.jpg'),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "ayoo_akanji",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryText,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          WidgetSpan(
                            child: Container(
                              margin: EdgeInsets.only(left: 4, bottom: 1),
                              child: Icon(Icons.check_circle,
                                  size: 16, color: AppColors.primaryText),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: <Widget>[
                        Text(
                          'Politicking Boulevard.',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        ),
                        Container(
                            height: 10,
                            width: 1,
                            color: Colors.grey,
                            margin: EdgeInsets.symmetric(horizontal: 7)),
                        Text(
                          '46 mins ago ',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 33,
                  child: IconButton(
                      icon:
                          Icon(Icons.more_horiz, size: 22, color: Colors.grey),
                      onPressed: null)),
            ],
          ),
          Container(
            padding: new EdgeInsets.only(left: 15.0, right: 15, top: 5.0),
            child: ReadMoreText(
              'I’m really excited to read that @akin_adesina 😍 '
              'has been given a clean bill of health, the trio panel  experts, '
              'led by Robinson alongside Justice Hassan Jallow & the @WorldBank integrity '
              'VP Leonard McCarthy, cleared him of all charges alleged by whistleblowers. Congrats Africa! 😃',
              style: TextStyle(
                  wordSpacing: 1.3,
                  color: Colors.white,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w400,
                  fontSize: 13.8,
                  height: 1.33),
              trimLines: 3,
              colorClickableText: AppColors.primaryText,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...read more',
              trimExpandedText: ' show less',
            ),
          ),
          Container(
            height: 20,
            margin: EdgeInsets.only(bottom: 35, left: 15, right: 15, top: 15),
            child: Row(
              children: <Widget>[
                Container(
                  width: 55,
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.repeat, size: 20, color: Colors.grey),
                        SizedBox(width: 3),
                        Text(
                          '203',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  width: 55,
                  margin: EdgeInsets.only(left: 8),
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 2),
                            child: Icon(Icons.reply,
                                size: 19, color: Colors.grey)),
                        SizedBox(width: 3),
                        Text(
                          '26',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                LikeButton(
                  size: 20,
                  circleColor: CircleColor(
                      start: Colors.pinkAccent, end: Color(0xff0099cc)),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Colors.red,
                    dotSecondaryColor: Colors.orangeAccent,
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? AppColors.primaryText : Colors.grey,
                      size: 18,
                    );
                  },
                  likeCount: 896,
                  countBuilder: (int count, bool isLiked, String text) {
                    var color = isLiked ? AppColors.primaryText : Colors.grey;
                    Widget result;
                    if (count == 0) {
                      result = Text(
                        "love",
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Ubuntu',
                            fontSize: 14),
                      );
                    } else
                      result = Text(
                        text,
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Ubuntu',
                            fontSize: 14),
                      );
                    return result;
                  },
                ),
                Expanded(child: SizedBox()),
                Container(
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Text(
                          '22 comments',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          // yobo_z(),
          SizedBox(height: 15),
        ],
      );

  // Quote
  post1() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: new EdgeInsets.only(left: 15.0, right: 15, top: 5.0),
            child: ReadMoreText(
              'Osinbajo is a great with empathy, he has the ability to understand and share the feelings of another.\nAm sure today\'s meeting will also help bring solutions to the N-Power challenge on ground.',
              style: TextStyle(
                  wordSpacing: 1.3,
                  color: AppColors.primaryText,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w600,
                  fontSize: 15.5,
                  height: 1.33),
              trimLines: 5,
              colorClickableText: AppColors.primaryText,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...read more',
              trimExpandedText: ' show less',
            ),
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 15),
              Container(
                height: 33,
                width: 33,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://pbs.twimg.com/profile_images/1269587105317097474/zZ2dqNJY_400x400.jpg'),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "onyedikachi_kalu",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryText,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
//                      WidgetSpan(
//                        child: Container(
//                          margin: EdgeInsets.only(left: 4, bottom: 1),
//                          child: Icon(Icons.check_circle,
//                              size: 16, color: AppColors.primaryText),
//                        ),
//                      ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: <Widget>[
                        Text(
                          'Lagos, Nigeria',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        ),
                        Container(
                            height: 10,
                            width: 1,
                            color: Colors.grey,
                            margin: EdgeInsets.symmetric(horizontal: 7)),
                        Text(
                          '1 hour ago ',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 33,
                  child: IconButton(
                      icon:
                          Icon(Icons.more_horiz, size: 22, color: Colors.grey),
                      onPressed: null)),
            ],
          ),
          Container(
            height: 20,
            margin: EdgeInsets.only(bottom: 35, left: 15, right: 15, top: 15),
            child: Row(
              children: <Widget>[
                Container(
                  width: 55,
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.repeat, size: 20, color: Colors.grey),
                        SizedBox(width: 3),
                        Text(
                          '1.5k',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  width: 55,
                  margin: EdgeInsets.only(left: 8),
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 2),
                            child: Icon(Icons.reply,
                                size: 19, color: Colors.grey)),
                        SizedBox(width: 3),
                        Text(
                          '500',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                LikeButton(
                  size: 20,
                  circleColor: CircleColor(
                      start: Colors.pinkAccent, end: Color(0xff0099cc)),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Colors.red,
                    dotSecondaryColor: Colors.orangeAccent,
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? AppColors.primaryText : Colors.grey,
                      size: 18,
                    );
                  },
                  likeCount: 392,
                  countBuilder: (int count, bool isLiked, String text) {
                    var color = isLiked ? AppColors.primaryText : Colors.grey;
                    Widget result;
                    if (count == 0) {
                      result = Text(
                        "love",
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Ubuntu',
                            fontSize: 14),
                      );
                    } else
                      result = Text(
                        text,
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Ubuntu',
                            fontSize: 14),
                      );
                    return result;
                  },
                ),
                Expanded(child: SizedBox()),
                Container(
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Text(
                          '686 comments',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          // yobo_z(),
          SizedBox(height: 15),
        ],
      );

  postB() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              maxHeight: 160.0, // changed to 400
              minHeight: 100.0, // changed to 200
              maxWidth: double.infinity,
              minWidth: double.infinity,
            ),
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(),
            child: Image.network(
              'https://pbs.twimg.com/media/EJa_nXXXsAAYA2k?format=jpg&name=medium',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 15),
              Container(
                height: 33,
                width: 33,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://pbs.twimg.com/profile_images/1195361748741697537/0qaGTKCa_400x400.jpg'),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "mobrimah",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryText,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          WidgetSpan(
                            child: Container(
                              margin: EdgeInsets.only(left: 4, bottom: 1),
                              child: Icon(Icons.check_circle,
                                  size: 16, color: AppColors.primaryText),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: <Widget>[
                        Text(
                          'Abuja, Nigeria',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        ),
                        Container(
                            height: 10,
                            width: 1,
                            color: Colors.grey,
                            margin: EdgeInsets.symmetric(horizontal: 7)),
                        Text(
                          '2 hours ago ',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 33,
                  child: IconButton(
                      icon:
                          Icon(Icons.more_horiz, size: 22, color: Colors.grey),
                      onPressed: null)),
            ],
          ),
          Container(
            padding: new EdgeInsets.only(left: 15.0, right: 15, top: 5.0),
            child: ReadMoreText(
              'The future of Tech in Nigeria is definitely bright with d deliberate steps this Administration is taking. Tech heavyweights r pouring in with intent to invest,most recent of which was Jack Ma of Alibaba. Also gives hope to a reduction in unemployment. Get digitally trained TODAY!',
              style: TextStyle(
                  wordSpacing: 1.3,
                  color: Colors.white,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w400,
                  fontSize: 13.8,
                  height: 1.33),
              trimLines: 3,
              colorClickableText: AppColors.primaryText,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...read more',
              trimExpandedText: ' show less',
            ),
          ),
          Container(
            height: 20,
            margin: EdgeInsets.only(bottom: 35, left: 15, right: 15, top: 15),
            child: Row(
              children: <Widget>[
                Container(
                  width: 55,
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.repeat, size: 20, color: Colors.grey),
                        SizedBox(width: 3),
                        Text(
                          '48',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  width: 55,
                  margin: EdgeInsets.only(left: 8),
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 2),
                            child: Icon(Icons.reply,
                                size: 19, color: Colors.grey)),
                        SizedBox(width: 3),
                        Text(
                          '6',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                LikeButton(
                  size: 20,
                  circleColor: CircleColor(
                      start: Colors.pinkAccent, end: Color(0xff0099cc)),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Colors.red,
                    dotSecondaryColor: Colors.orangeAccent,
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? AppColors.primaryText : Colors.grey,
                      size: 18,
                    );
                  },
                  likeCount: 112,
                  countBuilder: (int count, bool isLiked, String text) {
                    var color = isLiked ? AppColors.primaryText : Colors.grey;
                    Widget result;
                    if (count == 0) {
                      result = Text(
                        "love",
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Ubuntu',
                            fontSize: 14),
                      );
                    } else
                      result = Text(
                        text,
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Ubuntu',
                            fontSize: 14),
                      );
                    return result;
                  },
                ),
                Expanded(child: SizedBox()),
                Container(
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Text(
                          '173 comments',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          // yobo_z(),
          SizedBox(height: 15),
        ],
      );

  postTwo() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              maxHeight: 160.0, // changed to 400
              minHeight: 100.0, // changed to 200
              maxWidth: double.infinity,
              minWidth: double.infinity,
            ),
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(),
            child: Image.network(
              'https://pbs.twimg.com/media/EJ7B2doXkAEBn95?format=jpg&name=medium',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 15),
              Container(
                height: 33,
                width: 33,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://pbs.twimg.com/profile_images/1188379257799622656/7Go8UDfA_400x400.jpg'),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Ilsa_essien",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryText,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
//                      WidgetSpan(
//                        child: Container(
//                          margin: EdgeInsets.only(left: 4, bottom: 1),
//                          child: Icon(Icons.check_circle,
//                              size: 16, color: AppColors.primaryText),
//                        ),
//                      ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: <Widget>[
                        Text(
                          'Abuja, Nigeria.',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        ),
                        Container(
                            height: 10,
                            width: 1,
                            color: Colors.grey,
                            margin: EdgeInsets.symmetric(horizontal: 7)),
                        Text(
                          '6th Aug 2020',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 33,
                  child: IconButton(
                      icon:
                          Icon(Icons.more_horiz, size: 22, color: Colors.grey),
                      onPressed: null)),
            ],
          ),
          Container(
            padding: new EdgeInsets.only(left: 15.0, right: 15, top: 5.0),
            child: ReadMoreText(
              'This look! 😍😍😍',
              style: TextStyle(
                  wordSpacing: 1.3,
                  color: Colors.white,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w400,
                  fontSize: 13.8,
                  height: 1.33),
              trimLines: 3,
              colorClickableText: AppColors.primaryText,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...read more',
              trimExpandedText: ' show less',
            ),
          ),
          Container(
            height: 20,
            margin: EdgeInsets.only(bottom: 35, left: 15, right: 15, top: 15),
            child: Row(
              children: <Widget>[
                Container(
                  width: 55,
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.repeat, size: 20, color: Colors.grey),
                        SizedBox(width: 3),
                        Text(
                          '271',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  width: 55,
                  margin: EdgeInsets.only(left: 8),
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 2),
                            child: Icon(Icons.reply,
                                size: 19, color: Colors.grey)),
                        SizedBox(width: 3),
                        Text(
                          '47',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                LikeButton(
                  size: 20,
                  circleColor: CircleColor(
                      start: Colors.pinkAccent, end: Color(0xff0099cc)),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Colors.red,
                    dotSecondaryColor: Colors.orangeAccent,
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? AppColors.primaryText : Colors.grey,
                      size: 18,
                    );
                  },
                  likeCount: 934,
                  countBuilder: (int count, bool isLiked, String text) {
                    var color = isLiked ? AppColors.primaryText : Colors.grey;
                    Widget result;
                    if (count == 0) {
                      result = Text(
                        "love",
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Ubuntu',
                            fontSize: 14),
                      );
                    } else
                      result = Text(
                        text,
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Ubuntu',
                            fontSize: 14),
                      );
                    return result;
                  },
                ),
                Expanded(child: SizedBox()),
                Container(
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Text(
                          '103 comments',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          // yobo_z(),
          SizedBox(height: 15),
        ],
      );

  postC() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              maxHeight: 160.0, // changed to 400
              minHeight: 100.0, // changed to 200
              maxWidth: double.infinity,
              minWidth: double.infinity,
            ),
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(),
            child: Image.network(
              'https://pbs.twimg.com/media/EgrTzByXcAAZ6w-?format=jpg&name=medium',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 15),
              Container(
                height: 33,
                width: 33,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://pbs.twimg.com/profile_images/529179557459685376/xIaOuyQh_400x400.jpeg'),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "bisuclef",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryText,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          WidgetSpan(
                            child: Container(
                              margin: EdgeInsets.only(left: 4, bottom: 1),
                              child: Icon(Icons.check_circle,
                                  size: 16, color: AppColors.primaryText),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: <Widget>[
                        Text(
                          'Lagos, Nigeria',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        ),
                        Container(
                            height: 10,
                            width: 1,
                            color: Colors.grey,
                            margin: EdgeInsets.symmetric(horizontal: 7)),
                        Text(
                          '5th Aug 2020',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 33,
                  child: IconButton(
                      icon:
                          Icon(Icons.more_horiz, size: 22, color: Colors.grey),
                      onPressed: null)),
            ],
          ),
          Container(
            padding: new EdgeInsets.only(left: 15.0, right: 15, top: 5.0),
            child: ReadMoreText(
              '2023 yesterday, 2023 today and 2023 tomorrow but Asiwaju Bola Tinubu and Vice President Yemi Osinbajo remain tight.\n'
              'That should tell you a thing or two, politics has got NOTHING on friendship.',
              style: TextStyle(
                  wordSpacing: 1.3,
                  color: Colors.white,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w400,
                  fontSize: 13.8,
                  height: 1.33),
              trimLines: 3,
              colorClickableText: AppColors.primaryText,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...read more',
              trimExpandedText: ' show less',
            ),
          ),
          Container(
            height: 20,
            margin: EdgeInsets.only(bottom: 35, left: 15, right: 15, top: 15),
            child: Row(
              children: <Widget>[
                Container(
                  width: 55,
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.repeat, size: 20, color: Colors.grey),
                        SizedBox(width: 3),
                        Text(
                          '35',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  width: 55,
                  margin: EdgeInsets.only(left: 8),
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 2),
                            child: Icon(Icons.reply,
                                size: 19, color: Colors.grey)),
                        SizedBox(width: 3),
                        Text(
                          '12',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                LikeButton(
                  size: 20,
                  circleColor: CircleColor(
                      start: Colors.pinkAccent, end: Color(0xff0099cc)),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Colors.red,
                    dotSecondaryColor: Colors.orangeAccent,
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? AppColors.primaryText : Colors.grey,
                      size: 18,
                    );
                  },
                  likeCount: 465,
                  countBuilder: (int count, bool isLiked, String text) {
                    var color = isLiked ? AppColors.primaryText : Colors.grey;
                    Widget result;
                    if (count == 0) {
                      result = Text(
                        "love",
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Ubuntu',
                            fontSize: 14),
                      );
                    } else
                      result = Text(
                        text,
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Ubuntu',
                            fontSize: 14),
                      );
                    return result;
                  },
                ),
                Expanded(child: SizedBox()),
                Container(
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Text(
                          '9 comments',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          // yobo_z(),
          SizedBox(height: 15),
        ],
      );

  // Quote
  postThree() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: new EdgeInsets.only(left: 15.0, right: 15, top: 5.0),
            child: ReadMoreText(
              '"Promote hardwork.\nTalk about it repeatedly. Stop giving the impression that what you do is easy or how you amassed your wealth was easy."',
              style: TextStyle(
                  wordSpacing: 1.3,
                  color: AppColors.primaryText,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w600,
                  fontSize: 15.5,
                  height: 1.33),
              trimLines: 5,
              colorClickableText: AppColors.primaryText,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...read more',
              trimExpandedText: ' show less',
            ),
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 15),
              Container(
                height: 33,
                width: 33,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://pbs.twimg.com/profile_images/1188379257799622656/7Go8UDfA_400x400.jpg'),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Ilsa_essien",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryText,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
//                      WidgetSpan(
//                        child: Container(
//                          margin: EdgeInsets.only(left: 4, bottom: 1),
//                          child: Icon(Icons.check_circle,
//                              size: 16, color: AppColors.primaryText),
//                        ),
//                      ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: <Widget>[
                        Text(
                          'Abuja, Nigeria.',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        ),
                        Container(
                            height: 10,
                            width: 1,
                            color: Colors.grey,
                            margin: EdgeInsets.symmetric(horizontal: 7)),
                        Text(
                          '5th Aug 2020',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 33,
                  child: IconButton(
                      icon:
                          Icon(Icons.more_horiz, size: 22, color: Colors.grey),
                      onPressed: null)),
            ],
          ),
          Container(
            height: 20,
            margin: EdgeInsets.only(bottom: 35, left: 15, right: 15, top: 15),
            child: Row(
              children: <Widget>[
                Container(
                  width: 55,
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.repeat, size: 20, color: Colors.grey),
                        SizedBox(width: 3),
                        Text(
                          '17',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  width: 55,
                  margin: EdgeInsets.only(left: 8),
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 2),
                            child: Icon(Icons.reply,
                                size: 19, color: Colors.grey)),
                        SizedBox(width: 3),
                        Text(
                          '110',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                LikeButton(
                  size: 20,
                  circleColor: CircleColor(
                      start: Colors.pinkAccent, end: Color(0xff0099cc)),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Colors.red,
                    dotSecondaryColor: Colors.orangeAccent,
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? AppColors.primaryText : Colors.grey,
                      size: 18,
                    );
                  },
                  likeCount: 794,
                  countBuilder: (int count, bool isLiked, String text) {
                    var color = isLiked ? AppColors.primaryText : Colors.grey;
                    Widget result;
                    if (count == 0) {
                      result = Text(
                        "love",
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Ubuntu',
                            fontSize: 14),
                      );
                    } else
                      result = Text(
                        text,
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Ubuntu',
                            fontSize: 14),
                      );
                    return result;
                  },
                ),
                Expanded(child: SizedBox()),
                Container(
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Text(
                          '218 comments',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          // yobo_z(),
          SizedBox(height: 15),
        ],
      );

  postFour() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              maxHeight: 160.0, // changed to 400
              minHeight: 100.0, // changed to 200
              maxWidth: double.infinity,
              minWidth: double.infinity,
            ),
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(),
            child: Image.network(
              'https://pbs.twimg.com/media/EeZvdCcXYAAJgrw?format=jpg&name=medium',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 15),
              Container(
                height: 33,
                width: 33,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://pbs.twimg.com/profile_images/1077163046739562496/xgChktaF_400x400.jpg'),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "TPLeagueng",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryText,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          WidgetSpan(
                            child: Container(
                              margin: EdgeInsets.only(left: 4, bottom: 1),
                              child: Icon(Icons.check_circle,
                                  size: 16, color: AppColors.primaryText),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: <Widget>[
                        Text(
                          'Lagos, Nigeria.',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        ),
                        Container(
                            height: 10,
                            width: 1,
                            color: Colors.grey,
                            margin: EdgeInsets.symmetric(horizontal: 7)),
                        Text(
                          '4th Aug 2020',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 33,
                  child: IconButton(
                      icon:
                          Icon(Icons.more_horiz, size: 22, color: Colors.grey),
                      onPressed: null)),
            ],
          ),
          Container(
            padding: new EdgeInsets.only(left: 15.0, right: 15, top: 5.0),
            child: ReadMoreText(
              '"And yet, nation-building is hard work and bringing together the multiplicity of ethnicities under one banner is an onerous but necessary task" Professor Yemi Osinbajo\n\n'
              '@ileowokikiowo\n@mobrimah\n@ProfOsinbajo\n@WahidSaka\n@akandeoj\n@ifeadebayo\n@MrRefor',
              style: TextStyle(
                  wordSpacing: 1.3,
                  color: Colors.white,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w400,
                  fontSize: 13.8,
                  height: 1.33),
              trimLines: 3,
              colorClickableText: AppColors.primaryText,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...read more',
              trimExpandedText: ' show less',
            ),
          ),
          Container(
            height: 20,
            margin: EdgeInsets.only(bottom: 35, left: 15, right: 15, top: 15),
            child: Row(
              children: <Widget>[
                Container(
                  width: 55,
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.repeat, size: 20, color: Colors.grey),
                        SizedBox(width: 3),
                        Text(
                          '284',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  width: 55,
                  margin: EdgeInsets.only(left: 8),
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 2),
                            child: Icon(Icons.reply,
                                size: 19, color: Colors.grey)),
                        SizedBox(width: 3),
                        Text(
                          '146',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                LikeButton(
                  size: 20,
                  circleColor: CircleColor(
                      start: Colors.pinkAccent, end: Color(0xff0099cc)),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Colors.red,
                    dotSecondaryColor: Colors.orangeAccent,
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? AppColors.primaryText : Colors.grey,
                      size: 18,
                    );
                  },
                  likeCount: 606,
                  countBuilder: (int count, bool isLiked, String text) {
                    var color = isLiked ? AppColors.primaryText : Colors.grey;
                    Widget result;
                    if (count == 0) {
                      result = Text(
                        "love",
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Ubuntu',
                            fontSize: 14),
                      );
                    } else
                      result = Text(
                        text,
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Ubuntu',
                            fontSize: 14),
                      );
                    return result;
                  },
                ),
                Expanded(child: SizedBox()),
                Container(
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Text(
                          '304 comments',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          Container(height: 150),
        ],
      );

  newsOne() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              maxHeight: 160.0, // changed to 400
              minHeight: 100.0, // changed to 200
              maxWidth: double.infinity,
              minWidth: double.infinity,
            ),
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(),
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRUr_fDBPze71epy8TVoNjLD9pBreMOjXnWEQ&usqp=CAU',
              fit: BoxFit.cover,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 15),
              Container(
                height: 33,
                width: 33,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://pbs.twimg.com/profile_images/835558527347355648/5Om8__a3_400x400.jpg'),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "daily_post_ng",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryText,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          WidgetSpan(
                            child: Container(
                              margin: EdgeInsets.only(left: 4, bottom: 1),
                              child: Icon(Icons.check_circle,
                                  size: 16, color: AppColors.primaryText),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: <Widget>[
                        Text(
                          'Published 25th August, 2020 ',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 33,
                  child: IconButton(
                      icon:
                          Icon(Icons.more_horiz, size: 22, color: Colors.grey),
                      onPressed: null)),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Text(
              "Nigerian Newspapers: 10 things you need to know this Tuesday morning.",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w700,
                fontSize: 16,
                letterSpacing: -0.28,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 8),
            child: ReadMoreText(
              'Good morning! Here is today’s summary from Nigerian Newspapers.\n\n'
              '1. The Senate of the University of Lagos has elected Prof. Folasade Ogunsola as Acting Vice-Chancellor. Ogunsola polled 135 votes to defeat Prof. Ben Oghojafor, who got 31 votes.\n\n'
              '2. The Lagos State Commissioner for Health, Professor Akin Abayomi, has tested positive for the deadly coronavirus disease. The state’s Commissioner for Information and Strategy Gbenga Omotoso, who announced this via his Twitter account on Monday, said the health commissioner is doing well with no symptoms.\n\n'
              '3. The Inspector-General of Police, Mohammed Adamu, has suspended entry requirements for applicants who wished to join the Nigeria Police Force as constables. The IG in a signal dated August 24 directed that no candidate should be disqualified irrespective of their physical appearance, age and qualification.',
              trimLines: 4,
              colorClickableText: AppColors.primaryText,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...read more',
              trimExpandedText: ' show less',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w400,
                fontSize: 14.5,
                letterSpacing: -0.28,
              ),
            ),
          ),
          Container(
            // height: 20,
            margin: EdgeInsets.only(bottom: 30, left: 15, right: 15, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 55,
                      child: InkWell(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.repeat, size: 20, color: Colors.grey),
                            SizedBox(width: 3),
                            Text(
                              '13',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Ubuntu',
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      width: 55,
                      margin: EdgeInsets.only(left: 8),
                      child: InkWell(
                        child: Row(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(bottom: 2),
                                child: Icon(Icons.remove_red_eye,
                                    size: 18, color: Colors.grey)),
                            SizedBox(width: 3),
                            Text(
                              '6',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Ubuntu',
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    LikeButton(
                      size: 20,
                      circleColor: CircleColor(
                          start: Colors.pinkAccent, end: Color(0xff0099cc)),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: Colors.red,
                        dotSecondaryColor: Colors.orangeAccent,
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.insert_emoticon,
                          color: isLiked ? AppColors.primaryText : Colors.grey,
                          size: 18,
                        );
                      },
                      likeCount: 0,
                      countBuilder: (int count, bool isLiked, String text) {
                        var color =
                            isLiked ? AppColors.primaryText : Colors.grey;
                        Widget result;
                        if (count == 0) {
                          result = Text(
                            "React",
                            style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Ubuntu',
                                fontSize: 14),
                          );
                        } else
                          result = Text(
                            text,
                            style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Ubuntu',
                                fontSize: 14),
                          );
                        return result;
                      },
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      child: InkWell(
                        child: Row(
                          children: <Widget>[
                            Text(
                              '22 comments',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Ubuntu',
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      );

  newsA1() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              maxHeight: 160.0, // changed to 400
              minHeight: 100.0, // changed to 200
              maxWidth: double.infinity,
              minWidth: double.infinity,
            ),
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(),
            child: Image.network(
              'https://ocdn.eu/pulscms-transforms/1/81wk9kpTURBXy80ZDM0OTdjYzhhOGJkMjA0YThjY2YzZDcxMWJhYWRmMi5qcGeRkwXNAxTNAbyBoTAF',
              fit: BoxFit.cover,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 15),
              Container(
                height: 33,
                width: 33,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://image.winudf.com/v2/image/Y29tLnJpbmdpZXIucHVsc2UubmdfaWNvbl8wX2JkZTQyOWM3/icon.png?w=170&fakeurl=1'),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "pulse_ng",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryText,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          WidgetSpan(
                            child: Container(
                              margin: EdgeInsets.only(left: 4, bottom: 1),
                              child: Icon(Icons.check_circle,
                                  size: 16, color: AppColors.primaryText),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: <Widget>[
                        Text(
                          'Published September 8, 2020',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 33,
                  child: IconButton(
                      icon:
                          Icon(Icons.more_horiz, size: 22, color: Colors.grey),
                      onPressed: null)),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Text(
              "UK judge explains how Osinbajo detected P&ID fraud against Nigeria",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w700,
                fontSize: 16,
                letterSpacing: -0.28,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 8),
            child: ReadMoreText(
              'The vice president\'s intervention may have saved the day for Nigeria.'
              '\nA United Kingdom judge says the timely observation and intervention of Vice President Yemi Osinbajo was instrumental in how the Process and Industrial Development Limited (P&ID) deal with Nigeria became known and identified as a fraudulent endeavour.'
              '\n\nSir Ross Cranston of the UK High Court of Justice Queen’s Bench Division Commercial Court explained that the vice president was a regular fixture all through the review process.'
              '\nCranston noted that Osinbajo\'s “fraud on the nation” statement in June of 2018 worked in Nigeria\'s favour.A brief overview of a deal gone wrong'
              '\nOn January 11, 2010, British firm P&ID inked a gas supply and processing deal with the Ministry of Petroleum Resources on behalf of the Nigerian government.'
              '\nP&ID was expected to build and operate an Accelerated Gas Development project in Adiabo in Odukpani Local Government Area of Cross River State, going by the provisions of the contract.',
              trimLines: 4,
              colorClickableText: AppColors.primaryText,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...read more',
              trimExpandedText: ' show less',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w400,
                fontSize: 14.5,
                letterSpacing: -0.28,
              ),
            ),
          ),
          Container(
            // height: 20,
            margin: EdgeInsets.only(bottom: 30, left: 15, right: 15, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 55,
                      child: InkWell(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.repeat, size: 20, color: Colors.grey),
                            SizedBox(width: 3),
                            Text(
                              '2.1k',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Ubuntu',
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      width: 55,
                      margin: EdgeInsets.only(left: 8),
                      child: InkWell(
                        child: Row(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(bottom: 2),
                                child: Icon(Icons.remove_red_eye,
                                    size: 18, color: Colors.grey)),
                            SizedBox(width: 3),
                            Text(
                              '8.4k',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Ubuntu',
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    LikeButton(
                      size: 20,
                      circleColor: CircleColor(
                          start: Colors.pinkAccent, end: Color(0xff0099cc)),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: Colors.red,
                        dotSecondaryColor: Colors.orangeAccent,
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.insert_emoticon,
                          color: isLiked ? AppColors.primaryText : Colors.grey,
                          size: 18,
                        );
                      },
                      likeCount: 892,
                      countBuilder: (int count, bool isLiked, String text) {
                        var color =
                            isLiked ? AppColors.primaryText : Colors.grey;
                        Widget result;
                        if (count == 0) {
                          result = Text(
                            "React",
                            style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Ubuntu',
                                fontSize: 14),
                          );
                        } else
                          result = Text(
                            text,
                            style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Ubuntu',
                                fontSize: 14),
                          );
                        return result;
                      },
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      child: InkWell(
                        child: Row(
                          children: <Widget>[
                            Text(
                              '32.9k comments',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Ubuntu',
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      );

  newsA() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              maxHeight: 160.0, // changed to 400
              minHeight: 100.0, // changed to 200
              maxWidth: double.infinity,
              minWidth: double.infinity,
            ),
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(),
            child: Image.network(
              'https://www.yemiosinbajo.ng/wp-content/uploads/2020/08/Virtual-Townhall-of-Law-Students-Association-of-Nigeria-on-06082020-2.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 15),
              Container(
                height: 33,
                width: 33,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://pbs.twimg.com/profile_images/1160567667574677505/VcYeM9xh_400x400.jpg'),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "office_of_the_vp",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryText,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          WidgetSpan(
                            child: Container(
                              margin: EdgeInsets.only(left: 4, bottom: 1),
                              child: Icon(Icons.check_circle,
                                  size: 16, color: AppColors.primaryText),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: <Widget>[
                        Text(
                          'Published August 6, 2020',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 33,
                  child: IconButton(
                      icon:
                          Icon(Icons.more_horiz, size: 22, color: Colors.grey),
                      onPressed: null)),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Text(
              "VP’s Remarks At The Virtual Law Students Association Of Nigeria Townhall Meeting",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w700,
                fontSize: 16,
                letterSpacing: -0.28,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 8),
            child: ReadMoreText(
              'OSINBAJO TO YOUNG NIGERIANS: REVERSE NEGATIVE IMPACT OF COVID-19 PANDEMIC THROUGH INNOVATIONS'
              '\n*VP details FG’s economic response to pandemic at Law Students Townhall Meeting'
              '\n*Adds: “Today’s lawyer must be multidisciplinary, multi-tasking, digitally strong men or women of affairs'
              '\n\nThough the COVID-19 pandemic presents the most challenging times in recent history, it can also be a turning point for innovative thinking especially towards resolving the numerous challenges faced by humanity, according to Vice President Yemi Osinbajo, SAN.'
              'Prof. Osinbajo stated this on Thursday at the virtual Townhall meeting of the Law Students Association of Nigeria (LAWSAN) themed “How to build the right mindset for a better Nigeria, post COVID-19”.'
              '\nAccording to the Vice President, “We are faced with a two-fold global crisis. First is a health crisis and then there is an economic crisis and the combined effects have resulted in possibly the greatest socio-economic crisis in recent history.'
              '\nContinuing Prof. Osinbajo noted “…at the moment, we are also at a turning point with new opportunities to turn under-consumption into thriving business models if only we effectively innovate. We are seeing some of this emerge already.”',
              trimLines: 4,
              colorClickableText: AppColors.primaryText,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...read more',
              trimExpandedText: ' show less',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w400,
                fontSize: 14.5,
                letterSpacing: -0.28,
              ),
            ),
          ),
          Container(
            // height: 20,
            margin: EdgeInsets.only(bottom: 30, left: 15, right: 15, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 55,
                      child: InkWell(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.repeat, size: 20, color: Colors.grey),
                            SizedBox(width: 3),
                            Text(
                              '2.1k',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Ubuntu',
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      width: 55,
                      margin: EdgeInsets.only(left: 8),
                      child: InkWell(
                        child: Row(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(bottom: 2),
                                child: Icon(Icons.remove_red_eye,
                                    size: 18, color: Colors.grey)),
                            SizedBox(width: 3),
                            Text(
                              '8.4k',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Ubuntu',
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    LikeButton(
                      size: 20,
                      circleColor: CircleColor(
                          start: Colors.pinkAccent, end: Color(0xff0099cc)),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: Colors.red,
                        dotSecondaryColor: Colors.orangeAccent,
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.insert_emoticon,
                          color: isLiked ? AppColors.primaryText : Colors.grey,
                          size: 18,
                        );
                      },
                      likeCount: 892,
                      countBuilder: (int count, bool isLiked, String text) {
                        var color =
                            isLiked ? AppColors.primaryText : Colors.grey;
                        Widget result;
                        if (count == 0) {
                          result = Text(
                            "React",
                            style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Ubuntu',
                                fontSize: 14),
                          );
                        } else
                          result = Text(
                            text,
                            style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Ubuntu',
                                fontSize: 14),
                          );
                        return result;
                      },
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      child: InkWell(
                        child: Row(
                          children: <Widget>[
                            Text(
                              '32.9k comments',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Ubuntu',
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      );

  newsTwo() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              maxHeight: 160.0, // changed to 400
              minHeight: 100.0, // changed to 200
              maxWidth: double.infinity,
              minWidth: double.infinity,
            ),
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(),
            child: Image.network(
              'https://businessday.ng/wp-content/uploads/2020/08/Yemi-Osinbajo.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 15),
              Container(
                height: 33,
                width: 33,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://as01.epimg.net/img/amp/as-logo.png'),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "diario_online",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryText,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          WidgetSpan(
                            child: Container(
                              margin: EdgeInsets.only(left: 4, bottom: 1),
                              child: Icon(Icons.check_circle,
                                  size: 16, color: AppColors.primaryText),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: <Widget>[
                        Text(
                          'Published 23th August, 2020 ',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 33,
                  child: IconButton(
                      icon:
                          Icon(Icons.more_horiz, size: 22, color: Colors.grey),
                      onPressed: null)),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Text(
              "Allegations of withdrawal of N10billion from TSA made against His Excellency, Prof. Yemi Osinbajo, SAN, GCON.",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w700,
                fontSize: 16,
                letterSpacing: -0.28,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 8),
            child: ReadMoreText(
              'That story failed to meet the editorial standards of BusinessDay Newspaper, as we have since discovered that the story was baseless, unfounded and unsupported by any factual substance.',
              trimLines: 4,
              colorClickableText: AppColors.primaryText,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...read more',
              trimExpandedText: ' show less',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w400,
                fontSize: 14.5,
                letterSpacing: -0.28,
              ),
            ),
          ),
          Container(
            // height: 20,
            margin: EdgeInsets.only(bottom: 30, left: 15, right: 15, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 55,
                      child: InkWell(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.repeat, size: 20, color: Colors.grey),
                            SizedBox(width: 3),
                            Text(
                              '10',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Ubuntu',
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      width: 55,
                      margin: EdgeInsets.only(left: 8),
                      child: InkWell(
                        child: Row(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(bottom: 2),
                                child: Icon(Icons.remove_red_eye,
                                    size: 18, color: Colors.grey)),
                            SizedBox(width: 3),
                            Text(
                              '500',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Ubuntu',
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    LikeButton(
                      size: 20,
                      circleColor: CircleColor(
                          start: Colors.pinkAccent, end: Color(0xff0099cc)),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: Colors.red,
                        dotSecondaryColor: Colors.orangeAccent,
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.insert_emoticon,
                          color: isLiked ? AppColors.primaryText : Colors.grey,
                          size: 18,
                        );
                      },
                      likeCount: 100,
                      countBuilder: (int count, bool isLiked, String text) {
                        var color =
                            isLiked ? AppColors.primaryText : Colors.grey;
                        Widget result;
                        if (count == 0) {
                          result = Text(
                            "React",
                            style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Ubuntu',
                                fontSize: 14),
                          );
                        } else
                          result = Text(
                            text,
                            style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Ubuntu',
                                fontSize: 14),
                          );
                        return result;
                      },
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      child: InkWell(
                        child: Row(
                          children: <Widget>[
                            Text(
                              '308 comments',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Ubuntu',
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      );

  newsThree() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              maxHeight: 160.0, // changed to 400
              minHeight: 100.0, // changed to 200
              maxWidth: double.infinity,
              minWidth: double.infinity,
            ),
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(),
            child: Image.network(
              'https://www.yemiosinbajo.ng/wp-content/uploads/2020/08/Virtual-Townhall-of-Law-Students-Association-of-Nigeria-on-06082020-1.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 15),
              Container(
                height: 33,
                width: 33,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://pbs.twimg.com/profile_images/1083976198609350656/CJzypjqN.jpg'),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "the_guardian_ng",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryText,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          WidgetSpan(
                            child: Container(
                              margin: EdgeInsets.only(left: 4, bottom: 1),
                              child: Icon(Icons.check_circle,
                                  size: 16, color: AppColors.primaryText),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: <Widget>[
                        Text(
                          'Published 22th August, 2020 ',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 33,
                  child: IconButton(
                      icon:
                          Icon(Icons.more_horiz, size: 22, color: Colors.grey),
                      onPressed: null)),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Text(
              "\"You must be intentional about understanding technology, information systems and artificial intelligence. This sort of radical versatility is the new normal, you can’t be a lawyer such as we were. You are in a completely new world.\" - VP Osinbajo",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w700,
                fontSize: 16,
                letterSpacing: -0.28,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 8),
            child: ReadMoreText(
              'Though the COVID-19 pandemic presents the most challenging times in recent history, it can also be a turning point for innovative thinking especially towards resolving the numerous challenges faced by humanity, according to Vice President Yemi Osinbajo, SAN.',
              trimLines: 4,
              colorClickableText: AppColors.primaryText,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...read more',
              trimExpandedText: ' show less',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w400,
                fontSize: 14.5,
                letterSpacing: -0.28,
              ),
            ),
          ),
          Container(
            // height: 20,
            margin: EdgeInsets.only(bottom: 30, left: 15, right: 15, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 55,
                      child: InkWell(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.repeat, size: 20, color: Colors.grey),
                            SizedBox(width: 3),
                            Text(
                              '33',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Ubuntu',
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      width: 55,
                      margin: EdgeInsets.only(left: 8),
                      child: InkWell(
                        child: Row(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(bottom: 2),
                                child: Icon(Icons.remove_red_eye,
                                    size: 18, color: Colors.grey)),
                            SizedBox(width: 3),
                            Text(
                              '206',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Ubuntu',
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    LikeButton(
                      size: 20,
                      circleColor: CircleColor(
                          start: Colors.pinkAccent, end: Color(0xff0099cc)),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: Colors.red,
                        dotSecondaryColor: Colors.orangeAccent,
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.insert_emoticon,
                          color: isLiked ? AppColors.primaryText : Colors.grey,
                          size: 18,
                        );
                      },
                      likeCount: 902,
                      countBuilder: (int count, bool isLiked, String text) {
                        var color =
                            isLiked ? AppColors.primaryText : Colors.grey;
                        Widget result;
                        if (count == 0) {
                          result = Text(
                            "902",
                            style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Ubuntu',
                                fontSize: 14),
                          );
                        } else
                          result = Text(
                            text,
                            style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Ubuntu',
                                fontSize: 14),
                          );
                        return result;
                      },
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      child: InkWell(
                        child: Row(
                          children: <Widget>[
                            Text(
                              '299 comments',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Ubuntu',
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(height: 130),
        ],
      );
}

class SheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgUpperGreen,
      child: CreatePost(),
    );
  }
}

class GrabSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgUpperGreen,
        boxShadow: [
          BoxShadow(
            blurRadius: 20.0,
            color: Colors.black.withOpacity(0.2),
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.0),
          topRight: Radius.circular(35.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 100.0,
            height: 9.0,
            margin: EdgeInsets.only(top: 18.0),
            decoration: BoxDecoration(
                color: AppColors.bgLowerGreen.withOpacity(0.4),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
          ),
//          Container(
//            height: 1.0,
//            margin: EdgeInsets.only(left: 20, right: 20),
//            color: AppColors.bgLowerGreen.withOpacity(0.4),
//          ),
        ],
      ),
    );
  }
}
