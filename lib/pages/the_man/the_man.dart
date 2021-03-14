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
            child: new FlareActor("assets/flare/el_bg.flr",
                fit: BoxFit.cover), // bg_oapp.flr
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
                  child: Column(children: <Widget>[header(), title()]),
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
    'https://lh3.googleusercontent.com/proxy/cj_hiLwUVg3k9pTCBLUhvcZfEAbpWKolGZuPHpbn2FxH4yIyac6SdZBJ_RhJRcMxXADVqyXgHY79g4lGybQD2qvTqhbRFl78MOdlDTQwZvyv29mL',
    'https://i.ytimg.com/vi/erAc_X2Bhl4/maxresdefault.jpg',
'https://guardian.ng/wp-content/uploads/2019/08/Nasir-el-Rufai-and-wife-Aisha.jpg',
    'https://i1.wp.com/dailynigerian.com/wp-content/uploads/2018/09/Nasir-Elrufai-El-Rufai.jpg',
    'https://pbs.twimg.com/media/EZ1Jpo1XkAE6nrm.jpg',
    'https://www.icirnigeria.org/wp-content/uploads/2018/05/Kaduna-State-Governor-Nasir-El-Rufai-with-President-Muhammadu-Buhari-at-Rigasa-train-station-in-Kaduna.jpg',
'https://pbs.twimg.com/media/D3OhRR9WkAAEYy7.jpg',
    'https://www.vanguardngr.com/wp-content/uploads/2020/04/EWPqJ_VWAAEEXY_.jpg',
    'https://www.channelstv.com/wp-content/uploads/2018/02/El-Rufai-Dalung8.jpg',
    'https://pbs.twimg.com/media/DwbDvdCX4AATjH_.jpg',
    'https://pbs.twimg.com/media/DrUqtsGWoAAJpmv.jpg',
'https://p.scooper.news/v2-EagleNews/Eagle-NewsImage/detail/20201224/e472c986e3707272b5fdab4863d0991c.webp',
    'https://2.bp.blogspot.com/-lHAgRwQvECU/W1gPRWgVYXI/AAAAAAAACy0/q-ZrOnv1R3YaQoHKMFzdgZy28dTLIzIDACLcBGAs/s1600/Governor-el-rufai-with-son.jpg',
'https://pbs.twimg.com/media/Dtk8icWXQAAgw9g.jpg',
    'https://pbs.twimg.com/media/D-EoOEQWwAAbBUD.jpg',
    'https://www.expressiveinfo.com/wp-content/uploads/2020/02/Nasir-El-Rufai.jpeg',
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
