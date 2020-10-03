import 'package:carousel_pro/carousel_pro.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:oapp/values/values.dart';
import 'package:readmore/readmore.dart';

class AugDetails extends StatelessWidget {
  AugDetails({Key key}) : super(key: key);

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
                child:
                new FlareActor("assets/flare/new_bg_oapp.flr", fit: BoxFit.cover), // bg_oapp.flr
              ),
              Hero(
                tag: 'aug',
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
                                Text('August 2020',
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
                                  EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 40),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: <Widget>[

                                  new Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          height: 180.0,
                                          margin: EdgeInsets.only(bottom: 15),
                                          width:
                                          MediaQuery.of(context).size.width,
                                          child: Carousel(
                                            images: [
                                              NetworkImage(
                                                  'https://1.bp.blogspot.com/-MSRHppFV14Y/X00jKuKrxyI/AAAAAAACVZI/N4T_w3pdQQ4fmeBYGnPs1FsAIfm-DOq8gCNcBGAsYHQ/s720/FB_IMG_1598890442448.jpg'),
                                              NetworkImage('https://gcfrng.com/wp-content/uploads/2020/08/Pastor-Adeboye-3.jpg'),
                                              NetworkImage('https://dailypost.ng/wp-content/uploads/2020/08/IMG-20200831-WA0016.jpg'),
                                              NetworkImage('https://i0.wp.com/media.premiumtimesng.com/wp-content/files/2020/08/ADEBO-e1598895965932.jpg?resize=1018%2C570&ssl=1'),
                                              NetworkImage('https://newsdirect.ng/wp-content/uploads/2020/08/4a122162-7cf2-4c14-b6ce-6e8af58dffd2-1000x600.jpg'),
                                            ],
                                            dotSize: 3.0,
                                            dotSpacing: 13.0,
                                            dotColor:
                                            Colors.white.withOpacity(0.5),
                                            indicatorBgPadding: 5.0,
                                            // animationDuration: Duration(seconds: 3),
                                            autoplayDuration:
                                            Duration(seconds: 6),
                                            dotBgColor:
                                            Colors.purple.withOpacity(0.0),
                                            borderRadius: true,
                                          )),
                                      Text('Monday, 31st August 2020.',
                                          style: TextStyle(
                                              color: AppColors.primaryText,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Ubuntu',
                                              fontSize: 14)),
                                      Container(
                                          height: 3,
                                          width: 80,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          color: AppColors.primaryText),
                                      ReadMoreText(
                                        'President Muhammadu Buhari inaugurated the Executive, Legislative Party Consultative'
                                        ' Committee to be chaired by Vice-President Yemi Osinbajo.\n'
                                        'President Muhammadu Buhari received in audience the General Overseer of the Redeemed Christian Church of God, Pastor E.A Adeboye.',
                                        style: TextStyle(
                                            height: 1.3,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Ubuntu',
                                            fontSize: 14),
                                        trimLines: 3,
                                        colorClickableText:
                                        AppColors.primaryText,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: '...read more',
                                        trimExpandedText: ' show less',
                                      ),
                                      SizedBox(height: 25),
                                    ],
                                  ),

                                  // LATEST FIRST AUG
                                  new Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          height: 180.0,
                                          margin: EdgeInsets.only(bottom: 15),
                                          width:
                                          MediaQuery.of(context).size.width,
                                          child: Carousel(
                                            images: [
                                              NetworkImage(
                                                  'https://www.yemiosinbajo.ng/wp-content/uploads/2020/08/ongoing-60th-Annual-General-Conference-of-the-NBA-on-27082020.jpeg'),
                                              ExactAssetImage("assets/images/b0.png")
                                            ],
                                            dotSize: 3.0,
                                            dotSpacing: 13.0,
                                            dotColor:
                                            Colors.white.withOpacity(0.5),
                                            indicatorBgPadding: 5.0,
                                            // animationDuration: Duration(seconds: 3),
                                            autoplayDuration:
                                            Duration(seconds: 6),
                                            dotBgColor:
                                            Colors.purple.withOpacity(0.0),
                                            borderRadius: true,
                                          )),
                                      Text('Friday, 28th August 2020.',
                                          style: TextStyle(
                                              color: AppColors.primaryText,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Ubuntu',
                                              fontSize: 14)),
                                      Container(
                                          height: 3,
                                          width: 80,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          color: AppColors.primaryText),
                                      ReadMoreText(
                                        'Vice-President Yemi Osinbajo virtually presided over the Presidential Power Working Group meeting.',
                                        style: TextStyle(
                                            height: 1.3,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Ubuntu',
                                            fontSize: 14),
                                        trimLines: 3,
                                        colorClickableText:
                                        AppColors.primaryText,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: '...read more',
                                        trimExpandedText: ' show less',
                                      ),
                                      SizedBox(height: 25),
                                    ],
                                  ),

                                  // LATEST SECOND AUG
                                  new Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          height: 180.0,
                                          margin: EdgeInsets.only(bottom: 15),
                                          width:
                                          MediaQuery.of(context).size.width,
                                          child: Carousel(
                                            images: [
                                              NetworkImage(
                                                  'https://alexis.lindaikejisblog.com/photos/shares/5f47b3e2cf8ce.jpg'),
                                              NetworkImage(
                                                  'https://www.yemiosinbajo.ng/wp-content/uploads/2020/08/vFEC-on-19082020-4.jpeg'),
                                              NetworkImage(
                                                  'https://i0.wp.com/www.tori.ng/userfiles/image/2020/aug/04/buhari-meeting.jpg?resize=350%2C200&ssl=1'),
                                              NetworkImage(
                                                  'https://thestreetjournal.s3.us-west-2.amazonaws.com/wp-content/uploads/2020/08/27114224/188257-breaking-buhari-presides-over-council-of-state-meeting.jpg'),
                                              NetworkImage(
                                                  'https://guardian.ng/wp-content/uploads/2020/08/Muhammadu-Buhari-3.jpg'),
                                            ],
                                            dotSize: 3.0,
                                            dotSpacing: 13.0,
                                            dotColor:
                                            Colors.white.withOpacity(0.5),
                                            indicatorBgPadding: 5.0,
                                            // animationDuration: Duration(seconds: 3),
                                            autoplayDuration:
                                            Duration(seconds: 6),
                                            dotBgColor:
                                            Colors.purple.withOpacity(0.0),
                                            borderRadius: true,
                                          )),
                                      Text('Thursday, 27th August 2020.',
                                          style: TextStyle(
                                              color: AppColors.primaryText,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Ubuntu',
                                              fontSize: 14)),
                                      Container(
                                          height: 3,
                                          width: 80,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          color: AppColors.primaryText),
                                      ReadMoreText(
                                        'Vice-President Yemi Osinbajo was in attendance at the Council of State Meeting presided over by President Muhammadu Buhari.\n\n.'
                                        'Vice-President Yemi Osinbajo had a Q&A session at the Nigerian Annual General Conference.\n'
                                        'He answered questions on the economy, the role the FG has played toward the Southern Kaduna situation, the Company and Allied Matters Act, plans for 2023 and the Economic Sustainability Plan.',
                                        style: TextStyle(
                                            height: 1.3,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Ubuntu',
                                            fontSize: 14),
                                        trimLines: 3,
                                        colorClickableText:
                                        AppColors.primaryText,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: '...read more',
                                        trimExpandedText: ' show less',
                                      ),
                                      SizedBox(height: 25),
                                    ],
                                  ),

                                  // LATEST THIRD AUG
                                  new Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          height: 180.0,
                                          margin: EdgeInsets.only(bottom: 15),
                                          width:
                                          MediaQuery.of(context).size.width,
                                          child: Carousel(
                                            images: [
                                              NetworkImage(
                                                  'https://www.yemiosinbajo.ng/wp-content/uploads/2020/08/Members-of-ITF-and-NECA-on-25082020.jpeg'),
                                              NetworkImage(
                                                  'https://www.yemiosinbajo.ng/wp-content/uploads/2020/08/Wole-Olanipekun-Justice-Summit-on-22082020-1.jpeg'),

                                            ],
                                            dotSize: 3.0,
                                            dotSpacing: 13.0,
                                            dotColor:
                                            Colors.white.withOpacity(0.5),
                                            indicatorBgPadding: 5.0,
                                            // animationDuration: Duration(seconds: 3),
                                            autoplayDuration:
                                            Duration(seconds: 4),
                                            dotBgColor:
                                            Colors.purple.withOpacity(0.0),
                                            borderRadius: true,
                                          )),
                                      Text('Wednesday, 26th August 2020.',
                                          style: TextStyle(
                                              color: AppColors.primaryText,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Ubuntu',
                                              fontSize: 14)),
                                      Container(
                                          height: 3,
                                          width: 80,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          color: AppColors.primaryText),
                                      ReadMoreText(
                                        'Vice-President Yemi Osinbajo delivered a speech on behalf of President Muhammadu Buhari at the virtual declaration opening of the 60th Nigerian Bar Association Annual General Conference.\n\n'
                                        'The President\'s speech focused on the slow pace of trials, conflicting orders of court and seeming bias towards technicality over common-sense justice. ',
                                        style: TextStyle(
                                            height: 1.3,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Ubuntu',
                                            fontSize: 14),
                                        trimLines: 3,
                                        colorClickableText:
                                        AppColors.primaryText,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: '...read more',
                                        trimExpandedText: ' show less',
                                      ),
                                      SizedBox(height: 25),
                                    ],
                                  ),

                                  // LATEST FOURTH AUG
                                  new Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          height: 180.0,
                                          margin: EdgeInsets.only(bottom: 15),
                                          width:
                                          MediaQuery.of(context).size.width,
                                          child: Carousel(
                                            images: [
                                              NetworkImage(
                                                  'https://www.today.ng/wp-content/uploads/2020/08/20201947-696x464.jpeg'),
                                              NetworkImage(
                                                  'https://i2.wp.com/www.von.gov.ng/wp-content/uploads/2020/09/91754f8b-yemi-osinbajo-1.jpg?fit=1200%2C900&ssl=1'),
                                              NetworkImage(
                                                  'https://i0.wp.com/www.thenewsnigeria.com.ng/wp-content/uploads/2020/07/osinbajo-NEC-e1599023798375.jpg?ssl=1'),
                                            ],
                                            dotSize: 3.0,
                                            dotSpacing: 13.0,
                                            dotColor:
                                            Colors.white.withOpacity(0.5),
                                            indicatorBgPadding: 5.0,
                                            // animationDuration: Duration(seconds: 3),
                                            autoplayDuration:
                                            Duration(seconds: 4),
                                            dotBgColor:
                                            Colors.purple.withOpacity(0.0),
                                            borderRadius: true,
                                          )),
                                      Text('Tuesday, 25th August 2020.',
                                          style: TextStyle(
                                              color: AppColors.primaryText,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Ubuntu',
                                              fontSize: 14)),
                                      Container(
                                          height: 3,
                                          width: 80,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          color: AppColors.primaryText),
                                      ReadMoreText(
                                        'Vice-President Yemi Osinbajo held a virtual meeting with cabinet ministers and some officials from the Industrial Training Fund (ITF) and the National Employers\' Consultative Association (NECA) on technical skills and development. ',
                                        style: TextStyle(
                                            height: 1.3,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Ubuntu',
                                            fontSize: 14),
                                        trimLines: 3,
                                        colorClickableText:
                                        AppColors.primaryText,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: '...read more',
                                        trimExpandedText: ' show less',
                                      ),
                                      SizedBox(height: 25),
                                    ],
                                  ),







                                  // First AUG
                                  new Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          height: 180.0,
                                          margin: EdgeInsets.only(bottom: 15),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Carousel(
                                            images: [
                                              NetworkImage(
                                                  'https://pbs.twimg.com/media/EfXOuGoXkAYK-Bw?format=jpg&name=small'),
                                              NetworkImage(
                                                  'https://pbs.twimg.com/media/EfXOvA5XoAI9Z7U?format=jpg&name=medium'),
                                              // ExactAssetImage("assets/images/b.jpeg")
                                            ],
                                            dotSize: 3.0,
                                            dotSpacing: 13.0,
                                            dotColor:
                                                Colors.white.withOpacity(0.5),
                                            indicatorBgPadding: 5.0,
                                            // animationDuration: Duration(seconds: 3),
                                            autoplayDuration:
                                                Duration(seconds: 4),
                                            dotBgColor:
                                                Colors.purple.withOpacity(0.0),
                                            borderRadius: true,
                                          )),
                                      Text('Friday, 14th August 2020.',
                                          style: TextStyle(
                                              color: AppColors.primaryText,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Ubuntu',
                                              fontSize: 14)),
                                      Container(
                                          height: 3,
                                          width: 80,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          color: AppColors.primaryText),
                                      ReadMoreText(
                                        'Vice-President Yemi Osinbajo delivered a keynote speech at the virtual '
                                        'Legal Tech Conference organised by Law Pavillion in partnership with '
                                        'TELNET Nigeria Limited.\n\n'
                                        'For the administration of justice system, change has surely come and I am pesonally '
                                        'excited to see how easily our entire judicial syste, is willingly adapting to innovation.',
                                        style: TextStyle(
                                            height: 1.3,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Ubuntu',
                                            fontSize: 14),
                                        trimLines: 3,
                                        colorClickableText:
                                            AppColors.primaryText,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: '...read more',
                                        trimExpandedText: ' show less',
                                      ),
                                      SizedBox(height: 25),
                                    ],
                                  ),

                                  // Second AUG
                                  new Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          height: 180.0,
                                          margin: EdgeInsets.only(bottom: 15),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Carousel(
                                            images: [
                                              NetworkImage(
                                                  'https://i0.wp.com/www.chronicle.ng/wp-content/uploads/2020/08/President-Muhammadu-Buhari-and-Vice-President-Yemi-Osinbajo-attend-the-National-Security-Council-meeting.jpeg'),
                                              NetworkImage(
                                                  'https://tribuneonlineng.com/wp-content/uploads/2020/06/Buhari-Osinbajo.jpg'),
                                              NetworkImage(
                                                  'https://alexis.lindaikejisblog.com/photos/shares/5f31728dc7391.jpg'),
                                              NetworkImage(
                                                  'https://i0.wp.com/alexis.lindaikejisblog.com/photos/shares/5f31720cab9ee.jpg?w=640&ssl=1'),
                                              // ExactAssetImage("assets/images/b.jpeg")
                                            ],
                                            dotSize: 3.0,
                                            dotSpacing: 13.0,
                                            dotColor:
                                                Colors.white.withOpacity(0.5),
                                            indicatorBgPadding: 5.0,
                                            // animationDuration: Duration(seconds: 3),
                                            autoplayDuration:
                                                Duration(seconds: 4),
                                            dotBgColor:
                                                Colors.purple.withOpacity(0.0),
                                            borderRadius: true,
                                          )),
                                      Text('Friday, 11th - 12th August 2020.',
                                          style: TextStyle(
                                              color: AppColors.primaryText,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Ubuntu',
                                              fontSize: 14)),
                                      Container(
                                          height: 3,
                                          width: 80,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          color: AppColors.primaryText),
                                      ReadMoreText(
                                        'Vice-President Yemi Osinbajo joined President Muhammadu Buhari in a meeting with governors of the North Eastern states.',
                                        style: TextStyle(
                                            height: 1.3,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Ubuntu',
                                            fontSize: 14),
                                        trimLines: 3,
                                        colorClickableText:
                                            AppColors.primaryText,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: '...read more',
                                        trimExpandedText: ' show less',
                                      ),
                                    ],
                                  ),
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
