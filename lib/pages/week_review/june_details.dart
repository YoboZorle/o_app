import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oapp/values/values.dart';

class JuneDetails extends StatelessWidget {
  JuneDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(),
                child: new FlareActor("assets/flare/new_bg_oapp.flr",
                    fit: BoxFit.cover), // bg_oapp.flr
              ),
              Hero(
                tag: 'june',
                child: new Container(
                    constraints: BoxConstraints.expand(),
                    child: SafeArea(
                      child: new SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: new Column(
                          children: <Widget>[
                            Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width,
                              // color: Colors.yellow,
                              margin: EdgeInsets.only(
                                  left: 5, right: 20, bottom: 5),
                              child: Row(children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.arrow_back_ios,
                                      size: 22, color: AppColors.primaryText),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                                Expanded(child: SizedBox()),
                                Text('June 2020',
                                    style: TextStyle(
                                        color: AppColors.primaryText,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Ubuntu',
                                        fontSize: 17)),
                                SizedBox(width: 30),
                                Expanded(child: SizedBox()),
                              ]),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(left: 20, right: 20, top: 5),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: 160),
                                  Text('No reviews this month!',
                                      style: TextStyle(
                                          color: AppColors.primaryText,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Ubuntu',
                                          fontSize: 17)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          )),
    );
  }
}
