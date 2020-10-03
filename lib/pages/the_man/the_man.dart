import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oapp/pages/settings/settings.dart';
import 'package:oapp/values/values.dart';

class TheMan extends StatefulWidget {
  @override
  _TheManState createState() => _TheManState();
}

class _TheManState extends State<TheMan> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(),
            child:
            new FlareActor("assets/flare/new_bg_oapp.flr", fit: BoxFit.cover), // bg_oapp.flr
          ),
          SafeArea(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
//            SliverPersistentHeader(
//              delegate: CustomSliverDelegate(),
//              pinned: true,
//            ),

                SliverToBoxAdapter(
                  child: Column(children: <Widget>[
                    header(),
                  title()]),
                ),
                GalleryStaggeredGridView(),

                //
                // Similarly we can add more scroll types
              ],
            ),
          ),
        ],
      ),
    );
  }

  header() => Container(
        height: 65,
        margin: EdgeInsets.only(left: 15, right: 15, top: 5),
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
    margin: EdgeInsets.only(top: 20, bottom: 15, left: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'The Man. The People. The Journey',
          style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.w800,
              fontFamily: 'Ubuntu',
              fontSize: 20),
        ),
      ],
    ),
  );
}

class GalleryStaggeredGridView extends StatelessWidget {
  int videoCount = 1;
  int videoIndex = 1;
  List<int> videosIndex = [];
  List<String> images = [
    'https://pbs.twimg.com/media/Ec8yzmGXkAAhEwF?format=jpg&name=medium',
    'https://pbs.twimg.com/media/Ec8yyqjX0AAOS3e?format=jpg&name=medium',
    'https://www.hopefornigeriaonline.com/wp-content/uploads/2018/03/4Osinbajo%E2%80%99s-daughter%E2%80%99s-traditional-wedding.jpg',
    'https://pbs.twimg.com/media/ESa75QPX0AEwehO?format=jpg&name=medium',
    'https://pbs.twimg.com/media/EPT9MUHWkAENG7L?format=jpg&name=medium',
    'https://i0.wp.com/www.chronicle.ng/wp-content/uploads/2020/05/A-baby-boy-shares-a-moment-with-Vice-President-Yemi-Osinbajo.jpeg?fit=612%2C408&ssl=1',
    'https://pbs.twimg.com/media/EL__g_eWwAEubnj?format=jpg&name=medium',
    'https://pbs.twimg.com/media/EL-YCeLXkAEVY1u?format=jpg&name=medium',
    'https://i1.wp.com/www.icirnigeria.org/wp-content/uploads/2018/12/Dogara-tackles-Buhari-says-FGs-Trader-Moni-is-a-form-of-voter-inducement-e1544519171448.jpg?resize=730%2C430&ssl=1',
    'https://pbs.twimg.com/media/EJt-IfkXkAIFYn6?format=jpg&name=medium',
    'https://www.africanweddingsng.com/wp-content/uploads/2018/03/29386552_2047340572174584_7981367448640600467_n.jpg',
    'https://pbs.twimg.com/media/EJVisbrXkAIVMyF?format=jpg&name=medium',
    'https://i1.wp.com/cdn.vanguardngr.com/wp-content/uploads/2019/02/Osinbajo-kogi-6.jpg?resize=600%2C420&ssl=1',
    'https://pbs.twimg.com/media/EJB1oJKX0AYAt3N?format=jpg&name=medium',
    'https://www.newsheadlines.com.ng/wp-content/uploads/2019/12/Buhari-sends-belated-birthday-wishes-to-Maryam-Uwais.jpg',
    'https://pbs.twimg.com/media/EDASbX7WkAIyKFg?format=jpg&name=medium',
    'https://pbs.twimg.com/media/D7vO2YqXsAA0IE1?format=jpg&name=medium',
    'https://pbs.twimg.com/media/D7LrM9AXsAEgjcV?format=jpg&name=900x900',
    'https://pbs.twimg.com/media/EgyeUm3WsAAbMPS?format=jpg&name=large',
    'https://pbs.twimg.com/media/D5_QXhRXkAAMQI2?format=jpg&name=medium',
    'https://thenewsguru.com/wp-content/uploads/2020/07/Kiki-Osinbajo.jpg',
    'https://netstorage-legit.akamaized.net/images/vllkyt2eoqvh8c0hgg.jpg?imwidth=1200&impolicy=default-amp',
    'https://storage.googleapis.com/thisday-846548948316-wp-data/wp-media/2019/11/798e0eb1-dolly-and-yemi-osinbajo.jpg',
    'https://pbs.twimg.com/media/D1CM6y1WsAEAnfu?format=jpg&name=medium',
  ];

  GalleryStaggeredGridView() {
    videosIndex.add(2);
    for (var i = 0; i <= images.length; i++) {
      if ((i == videoIndex + 8 && videoCount.isOdd) ||
          (i == videoIndex + 10 && videoCount.isEven)) {
        videoCount++;
        videoIndex = i;
        videosIndex.add(i);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return SliverStaggeredGrid.countBuilder(
      itemCount: images.length,
      crossAxisCount: 3, // Horizontal
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 4.0,

      itemBuilder: (BuildContext context, int index) {
        //
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[400],
          ),
          child: Image.network(
            // 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEyMDd9',
            // UIImageData.man2,
            images[index],
            fit: BoxFit.cover,
            frameBuilder: (BuildContext context, Widget child, int frame,
                bool wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) {
                return child;
              }
              return AnimatedOpacity(
                child: child,
                opacity: frame == null ? 0 : 1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeOut,
              );
            },
          ),
        );
      },

      staggeredTileBuilder: (int index) {
        return videosIndex.contains(index)
            ? StaggeredTile.count(2, 2)
            : StaggeredTile.count(1, 1);
      },
    );
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: EdgeInsets.only(bottom: 4.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 0.5,
          ),
        ),
      ),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int imndex) {
          return Container(
            margin: EdgeInsets.only(right: 8.0),
            child: Chip(
              label: Text('IGTV'),
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(
                  color: Colors.black12,
                  width: 0.5,
                ),
              ),
              backgroundColor: Colors.white,
            ),
          );
        },
        padding: EdgeInsets.only(left: 8.0),
        itemCount: 20,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  @override
  double get maxExtent => 50.0;

  @override
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return null;
  }
}
