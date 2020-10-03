import 'package:carousel_pro/carousel_pro.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:oapp/values/values.dart';
import 'package:readmore/readmore.dart';

class SeptDetails extends StatelessWidget {
  SeptDetails({Key key}) : super(key: key);

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
                tag: 'sept',
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
                                Text('September 2020',
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

                                  // New 5
                                  new Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          height: 180.0,
                                          margin: EdgeInsets.only(bottom: 15),
                                          color: Colors.yellow,
                                          width:
                                          MediaQuery.of(context).size.width,
                                          child: Carousel(
                                            images: [
                                              NetworkImage(
                                                  'https://www.truenews.ng/wp-content/uploads/2020/09/VP-NES.jpg'),
                                              NetworkImage(
                                                  'https://1.bp.blogspot.com/-s1N_eIp6Q0c/X1vFdKMIYBI/AAAAAAAB3Ko/TeJDaC0UeOIRyi03aRX0VsDKAmklZzy-QCNcBGAsYHQ/s1600/a.jpg'),
                                              NetworkImage(
                                                  'https://live.mrf.io/statics/i/ps/i2.wp.com/www.dateline.ng/wp-content/uploads/2020/08/Osinbajo-e1598244391172.jpg?fit=800%2C533&ssl=1'),
                                              NetworkImage(
                                                  'https://i1.wp.com/www.chronicle.ng/wp-content/uploads/2020/05/Vice-President-Yemi-Osinbajo-inaugurates-Clean-Nigeria-campaign.jpeg?fit=768%2C512&ssl=1'),
                                            ],
                                            dotSize: 3.0,
                                            dotSpacing: 13.0,
                                            dotColor:
                                            Colors.transparent,
                                            indicatorBgPadding: 5.0,
                                            // animationDuration: Duration(seconds: 3),
                                            autoplayDuration:
                                            Duration(seconds: 5),
                                            dotBgColor:
                                            Colors.purple.withOpacity(0.0),
                                            borderRadius: true,
                                          )),
                                      Text('Friday, 11th September 2020.',
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
                                        'Vice-President Yemi Osinbajo delivered the keynote address at the 2020 Virtual Conference Of The Nigerian Economic Society,\n'
                                        'Themed: African Continental Free Trade Area (AFCFTA) In Post COVID-19 Era.'
                                        '\nNigeria has interest in promoting an AfCFTA that catlysts regional value chains, enable free movement of people, attracts onvestments and improve the continental payments system. If the AfCFTA is to achieve the desired objectives, then it is also very important that Nigeria should push for the implementation of complementary progs and protocols including the Protocol on Free Movement of Persons, the pan-African payments system and other sectoral programmes.',
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
                                  // New 4
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
                                                  'https://thewillnigeria.com/news/wp-content/uploads/2020/03/Osinbajo.jpeg'),
                                              NetworkImage(
                                                  'https://cdn.punchng.com/wp-content/uploads/2019/10/23120857/Osinbajo-at-the-meeting-1024x735.jpeg'),
                                              NetworkImage(
                                                  'https://leadership.ng/wp-content/uploads/2020/09/yemi-osinbajo-1200x900.jpg'),
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
                                            Colors.transparent,
                                            borderRadius: true,
                                          )),
                                      Text('Thursday, 10th September 2020.',
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
                                        'Vice-President Yemi Osinbajo presided over the first meeting of the APC Tripartite Consultative Committee of the Executive, Legislature and Leadership of the party.\n\n'
                                        'Vice-President Yemi Osinbajo delivered the keynote remarks at a webinar by the US Nigeria Council and Milken Institute themed "COVID 19 in Nigeria; Health Tech Rising to the Challenge".'
                                        'These interventions are contained in our Economic Sustainability Plan which has a section on technology in rejigging the economy by providing relevant skills, building of call centers, robotic laboratories and support for technology entrepreneurs.',
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
                                  // New 3
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
                                                  'https://i1.wp.com/www.greenbreporters.com/wp-content/uploads/2020/08/Osinbajo.jpg?fit=960%2C640&ssl=1'),
                                              NetworkImage(
                                                  'https://i2.wp.com/www.von.gov.ng/wp-content/uploads/2020/09/91754f8b-yemi-osinbajo-1.jpg?fit=1200%2C900&ssl=1'),
                                              NetworkImage(
                                                  'https://thenigerialawyer.com/wp-content/uploads/2020/05/Yemi-Osinbajo.jpg'),
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
                                      Text('Wednesday, 9th September 2020.',
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
                                        'Vice-President Yemi Osinbajo delivered the keynote remarks at the webinar "Finding Safe Spaces for Female Students in Nigeria Universities" organized by OAU based on Segun Adeniyi\'s book "Naked Abused: Sex for Grades in African Universities".\n'
                                        '"The notion that the vitim might have brought the offence upon themselves by their attitude, dress or willingness to be in a compromising place with the lecturer, is one that must be resisted.'
                                        'The victim must always be seen as the victim. There can not be an excuse especially given the power configuration between students and lecturers that the victim culd have somehow invited the abuse."'
                                        'President Muhammadu Buhari inaugurated the National Steering Committee (NSC) for the preparation of medium-term National Development Plan 2021 - 2025 and Nigeria Agenda 2050.',
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
                                  // New 2
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
                                                  'https://www.channelstv.com/wp-content/uploads/2020/09/FIRST-RETREAT.jpg'),
                                              NetworkImage(
                                                  'https://www.naijanews.com/wp-content/uploads/2020/09/20200908_115801-1280x720.jpg'),
                                              NetworkImage(
                                                  'https://statesman.ng/wp-content/uploads/2020/09/FB_IMG_1599627923599.jpg'),
                                              NetworkImage(
                                                  'https://www.channelstv.com/wp-content/uploads/2020/09/DSC01710-2.jpg'),
                                              NetworkImage(
                                                  'https://i1.wp.com/www.tvcnews.tv/wp-content/uploads/2020/09/Ministerial-Performance-Review-Retreat.jpeg?ssl=1'),
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
                                      Text('Tuesday, 8th September 2020.',
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
                                        'President Muhammadu Buhari attended Day 2 of the Ministerial Performance Review Retreat alongside Vice-President Yemi Osinbajo.',
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
                                  // New 1
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
                                                  'https://pbs.twimg.com/media/EhVsAocWsAA4Vl9?format=jpg&name=medium'),
                                              NetworkImage(
                                                  'https://pbs.twimg.com/media/EhVsBHrWsAMEmOr?format=jpg&name=medium'),
                                              NetworkImage(
                                                  'https://pbs.twimg.com/media/EhVsBgEXsAETzZA?format=jpg&name=medium'),
                                              NetworkImage(
                                                  'https://pbs.twimg.com/media/EhVsH25WAAERrCU?format=jpg&name=medium'),
                                              NetworkImage(
                                                  'https://pbs.twimg.com/media/EhVsI0zWAAI6SMt?format=jpg&name=medium'),
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
                                      Text('Monday, 7th September 2020.',
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
                                        'Vice-President Yemi Osinbajo declared open the First Year Ministerial Performance Review Retreat on behalf of the President'
                                        ' Muhammadu Buhari.\nThe President\'s speech addressed achievements, current status of our revenue earnings, the ESP interventions among other things.',
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
                                                  'https://www.truenews.ng/wp-content/uploads/2020/09/VP-NES.jpg'),
                                              NetworkImage(
                                                  'https://i2.wp.com/www.pmnewsnigeria.com/wp-content/uploads/2020/04/Osinbajo-1-2.jpg?resize=700%2C601&ssl=1'),
                                              NetworkImage(
                                                  'https://www.yemiosinbajo.ng/wp-content/uploads/2020/08/LCCI-Presidential-Policy-Dialogue-with-VP-on-07082020-2.jpeg'),
                                              NetworkImage(
                                                  'https://i2.wp.com/allnaijamedia.com/wp-content/uploads/2020/05/COVID-%E2%80%93-19-Osinbajo-constitutes-committee-on-reopening-of-economy.jpg?resize=680%2C445&ssl=1'),
                                              NetworkImage(
                                                  'https://i0.wp.com/allnaijamedia.com/wp-content/uploads/2020/05/25a65e68-acfd-4a42-9c51-d58d65a334c5.png?fit=1200%2C650&ssl=1&resize=350%2C200'),
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
                                      Text('Tuesday, 1st September 2020.',
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
                                        'Vice-President Yemi Osinbajo delivered the keynote remarks at the virtual launch of 3 books on Policy,'
                                        ' Politics and Governance by Simbo Olorunfemi.\n'
                                        '"Some have argued that one of the challenges we have faced as a nation is the reluctance of our best minds to get involved in politics. What is the elite consensus?\nThe elites in most societies determine that direction even if the primary purpose is self-preservation.\nThe problem today is there is much concern with narrow perochial interest and the elites are unable to reach a consensus."',
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
                                            Duration(seconds: 7),
                                            dotBgColor:
                                            Colors.purple.withOpacity(0.0),
                                            borderRadius: true,
                                          )),
                                      Text('Wednesday, 2nd September 2020.',
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
                                        'Vice-President Yemi Osinbajo attended the Federal Executive Council Meeting presided over by President Muhammadu Buhari.',
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
                                      Text('Thursday, 3rd September 2020.',
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
                                        'Vice-President Yemi Osinbajo delivered the keynote remarks at the webinar by Gaval International titled "Media Coverage of Virtual Court Proceesings: Prospects and Challenges".\n'
                                        '"So we are at a point where at least we know that virtual hearings are legal. This means that the court is satisfied that appropriate means can be found to sense that the press and indeed members of the public can access the proceedings."',
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
                                      Text('Friday, 4th September 2020.',
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
                                        'Vice-President Yemi Osinbajo presided over the National Humanitarian Coordination Committee meetings.',
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
                                                  'https://www.yemiosinbajo.ng/wp-content/uploads/2020/04/Africa.com-Webinar-on-how-Africa-reacts-to-informal-sector-29042020-3.jpeg'),
                                              NetworkImage(
                                                  'https://www.yemiosinbajo.ng/wp-content/uploads/2020/06/VP-presides-over-the-Niger-Delta-Power-Holding-Company-Board-Management-Meeting-on-11062020.jpeg'),
                                              NetworkImage(
                                                  'https://www.page36news.com/wp-content/uploads/2020/05/20200523_094720.jpg'),
                                              NetworkImage(
                                                  'https://res.feednews.com/assets/v2/0e301b3ab396e25cae2c1218d4406a67-1?source=nlp&quality=uhq&resize=720'),
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
                                      Text('Sunday, 6th September 2020.',
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
                                        'Vice-President Yemi Osinbajo delivered the keynote remarks at the webinar by Gavel International titiled "Media Coverage of Virtual Court Processings: Prospects and challenge".'
                                        '\nSo we are at a point where at least we know that virtual hearings are legal. This means that the court is satisfied that appropriate means can be found to ensure that hearings are public, in the sense that the press and indeed members of the public can access the proceedings.',
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
