import 'dart:async';

import 'package:oapp/values/values.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TownHallLive extends StatefulWidget {
  @override
  _TownHallLiveState createState() => _TownHallLiveState();
}

class _TownHallLiveState extends State<TownHallLive> {
  VideoPlayerController _controller;

  bool _show = true;
  Timer _timer;

  final String _love = 'assets/svg/love.svg';
  final String _comment = 'assets/svg/comment.svg';
  final String _share = 'assets/svg/share_live.svg';
  final String _send = 'assets/svg/send.svg';

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/live.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        _controller.setLooping(true);
        _controller.play();
      });
    _timer = Timer.periodic(Duration(milliseconds: 700), (_) {
      setState(() => _show = !_show);
    });
  }
// make nigeria great again - making the nigeria of our dreams

//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Video Demo',
//      home: Scaffold(
//        body: Center(
//          child: _controller.value.initialized
//              ? AspectRatio(
//                  aspectRatio: _controller.value.aspectRatio,
//                  child: VideoPlayer(_controller),
//                )
//              : Container(),
//        ),
//        floatingActionButton: FloatingActionButton(
//          onPressed: () {
//            setState(() {
//              _controller.value.isPlaying
//                  ? _controller.pause()
//                  : _controller.play();
//            });
//          },
//          child: Icon(
//            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//          ),
//        ),
//      ),
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Adjusted theme colors to match logo.
        primaryColor: Color(0xffb55e28),
        accentColor: Color(0xffffd544),
      ),
      home: Scaffold(
        // TODO 6: Create a Stack Widget
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              // TODO 7: Add a SizedBox to contain our video.
              SizedBox.expand(
                child: FittedBox(
                  // If your background video doesn't look right, try changing the BoxFit property.
                  // BoxFit.fill created the look I was going for.
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size?.width ?? 0,
                    height: _controller.value.size?.height ?? 0,
//                  width: MediaQuery.of(context).size.width,
//                    height: MediaQuery.of(context).size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
              Positioned(
                  top: 15,
                  left: 15,
                  child: Container(
                    height: 18,
                    width: 45,
                    color: _show ? Color(0xFFF81616) : Colors.transparent,
                    alignment: Alignment.center,
                    child: Text('LIVE',
                        style: TextStyle(
                            color: _show ? Colors.white : Colors.transparent,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Ubuntu',
                            fontSize: 13)),
                  )),
              Positioned(
                  top: 10,
                  right: 5,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
              Positioned(
                  top: 0,
                  right: 25,
                  bottom: -145,
                  // left: 0,
                  child: SvgPicture.asset(_share, // Bright shade at the top
                      height: 46,
                      semanticsLabel: 'star notif icon')),
              Positioned(
                  top: 0,
                  right: 25,
                  bottom: 160,
                  // left: 0,
                  child: SvgPicture.asset(_love, // Bright shade at the top
                      height: 50,
                      semanticsLabel: 'star notif icon')),
              Positioned(
                  top: 0,
                  right: 25,
                  bottom: 0,
                  // left: 0,
                  child: SvgPicture.asset(_comment, // Bright shade at the top
                      height: 45,
                      semanticsLabel: 'star notif icon')),
              Positioned(
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.grey.withOpacity(0.4),
                    margin: EdgeInsets.only(left: 15, bottom: 15, right: 20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(splashColor: Colors.transparent),
                            child: TextField(
                              autofocus: false,
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    AppColors.bgLowerGreen.withOpacity(0.3),
                                hintText: 'Comment',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily: 'Ubuntu'),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontFamily: 'Ubuntu'),
                                contentPadding: const EdgeInsets.only(
                                    left: 18.0, bottom: 12.0, top: 12.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.bgLowerGreen
                                          .withOpacity(0.3)),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.bgLowerGreen
                                          .withOpacity(0.3)),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, top: 5, bottom: 5),
                          child:
                              SvgPicture.asset(_send, // Bright shade at the top
                                  height: 50,
                                  semanticsLabel: 'star notif icon'),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _timer?.cancel();
  }
}
