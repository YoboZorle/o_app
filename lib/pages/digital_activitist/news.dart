import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:oapp/values/values.dart';
import 'package:readmore/readmore.dart';

const double buttonSize = 28.0;

class News extends StatefulWidget {
  final List<String> galleryItems;

  News(this.galleryItems);
  bool isExpanded = false;

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  int pageViewActiveIndex = 0;
  int likeCount = -1;

  final String _star_line = 'assets/svg/star_line.svg';
  final String _reyarn = 'assets/svg/reyarn.svg';
  final String _comment = 'assets/svg/comment.svg';

  final int _loveCount = 999;

  String firstHalf;
  String fullText;
  String secondHalf;

  bool flag = true;

  final String description =
      'Yesterday, someone asked what’s my life’s greatest lesson. I told him, “shut-up” 😁 \nIn a world of chaos, where everyone is noisy, nosy and desperately wanna be heard by all means, #Brain the best thing to do is to “calm down, and know thyself” 🤦🏽‍♀️🤦🏽‍♀️🤦🏽‍♀️ \n\nAn old friend once said, “...poverty is the way to success, chaos is the path to peace, darkness creates the need for light and lack is simply the presence of ignorance” \nYesterday I was privileged to have a quick powwow with my teammates, we discussed profusely on the best approach for originality and problem solving. We had to redefine our methods despite the core challenges facing us as multinationals we must thrive to be different. \nWe are not the best but we believe in one thing as a team; \n\n“Creators are many, opportunities are few and the future is hungry for solutions” Klynox \n\nThe most difficult thing in life is to hold on.';

  @override
  void initState() {
    super.initState();

    if (description.length > 100) {
      firstHalf = description.substring(0, 100);
      secondHalf = description.substring(100, description.length);
      fullText = firstHalf + secondHalf;
    } else {
      firstHalf = description;
      secondHalf = "";
      fullText = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        gallery(),
        // SizedBox(height: 10),
        // userInfoRow(),
        newsTitle(),
        uploadText(),
        postActions(),
        // yobo_z(),
        SizedBox(height: 15),
      ],
    );
  }

  Widget userInfoRow() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(width: 15),
          Container(
            height: 33,
            width: 33,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/model5.jpg'),
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
                        text: "tina_samuel44",
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
                      'Ungwawan Sarki, Kaduna',
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
                    uploadedTime(),
                  ],
                ),
              ],
            ),
          ),
          Container(
              height: 33,
              child: IconButton(
                  icon: Icon(Icons.more_horiz, size: 22, color: Colors.grey),
                  onPressed: null)),
        ],
      );

  Widget gallery() => Stack(children: <Widget>[
        Container(
            constraints: BoxConstraints(
              maxHeight: 160.0, // changed to 400
              minHeight: 100.0, // changed to 200
              maxWidth: double.infinity,
              minWidth: double.infinity,
            ),
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
//          border: Border(
//            top: BorderSide(
//              color: Colors.grey[200],
//              width: 0.4,
//            ),
//          ),
                ),
            // child: Image.asset(
            //   UIImageData.storiesList[index],
            //   fit: BoxFit.contain,
            // ),
            child: widget.galleryItems.length > 1
                ? galleryPageView()
                : Image.asset(
                    widget.galleryItems[0],
                    fit: BoxFit.cover,
                  )),
      ]);

  Widget galleryPageView() {
    return PageView.builder(
      itemCount: widget.galleryItems.length,
      onPageChanged: (currentIndex) {
        setState(() {
          this.pageViewActiveIndex = currentIndex;
        });
      },
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(
          widget.galleryItems[index],
          fit: BoxFit.cover,
        );
      },
    );
  }

  Widget uploadedTime() => Text(
        '33 mins ago ',
        style: TextStyle(
            fontFamily: 'Ubuntu',
            fontWeight: FontWeight.w400,
            color: Colors.grey,
            fontSize: 12),
      );

  List<TextSpan> _processCaption(
      String caption, String matcher, TextStyle style) {
    List<TextSpan> spans = [];

    caption.split(' ').forEach((text) {
      if (text.toString().contains(matcher)) {
        spans.add(TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // do something
                print('Hashtag clicked ');
              },
            text: text + ' ',
            style: style));
      } else {
        spans.add(TextSpan(text: text + ' '));
      }
    });

    return spans;
  }

  List<Widget> sliderIndicator(int totalItem, int currentItem) {
    return null;
  }

  postActions() => Container(
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
                            child: Icon(Icons.remove_red_eye, size: 18, color: Colors.grey)),
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
                  circleColor:
                      CircleColor(start: Colors.pinkAccent, end: Color(0xff0099cc)),
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
                    var color = isLiked ? AppColors.primaryText : Colors.grey;
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
            SizedBox(height: 8),
            Text(
              "July 25, 2020",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.grey,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w400,
                fontSize: 12,
                letterSpacing: -0.28,
              ),
            ),
          ],
        ),
      );

  Widget newsTitle() => Container(
    margin: EdgeInsets.only(left: 15, right: 15, top: 10),
    child: Text(
          "Virtual Valedictory Service For Graduating Students Of Edgewood College, Lekki",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.w700,
            fontSize: 16,
            letterSpacing: -0.28,
          ),
        ),
  );

  Widget uploadText() => Container(
    margin: EdgeInsets.only(left: 15, right: 15, top: 8),
    child: ReadMoreText(
          'OSINBAJO TO YOUNG NIGERIANS: COVID-19 PANDEMIC OFFERS YOU OPPORTUNITY TO PROFFER SOLUTIONS TO PROBLEMS NOW & COMING YEARS\n\n'
          'As the world grapples with the fallouts of the COVID-19 pandemic, young Nigerians should seize opportunities of the moment to change the course of human history, do things never done before and become problem solvers, according to Vice President Yemi Osinbajo, SAN.\n\n'
          'The Vice President stated this on Saturday at the virtual valedictory service for graduating students of Edgewood College, Lagos.\n\n'
          'According to Prof. Osinbajo, “No matter how you look at it, you are unique. The game changed in your generation, you are certainly a class of game-changers. The point with any opportunity is that it must be seized if you are to benefit from it, which is why you must never take your place in history for granted. There is always a divine reason for it.”\n\n'
          'Historically, he said “circumstances have moved you ahead. No one has been here before. None of your parents or mine can tell you how life would be in or after a global pandemic. We know some but not nearly all of the challenges and all of the opportunities that will come with it. And if you tell me that you would have to wait until you get into University and even graduate before you start to answer those questions then you are missing the opportunity that history is offering you.”\n\n'
          'He further explained that when an opportunity to make history comes, it is often disguised as a challenge, a drawback or even a tragedy, adding that an opportunity often “hardly ever looks like the next great leap of mankind.”\n\n'
          'The VP said young age is a profound advantage in a time of uncertainty such as now and that such times also offer opportunity. In his words, “there is no qualifying age to be a problem solver, an entrepreneur, a great poet, an inventor, or an author. Age doesn’t matter. You must from now begin to examine the solutions to the problems that we face and will face now and in the coming years.”\n\n'
          'BELOW IS THE FULL TEXT OF THE VICE PRESIDENT’S REMARKS:\n\n'
          'REMARKS BY HIS EXCELLENCY, PROF. YEMI OSINBAJO, SAN, VICE PRESIDENT, FEDERAL REPUBLIC OF NIGERIA AT THE VIRTUAL VALEDICTORY SERVICE FOR GRADUATING STUDENTS OF EDGEWOOD COLLEGE, LEKKI, LAGOS, ON SATURDAY JULY 25, 2020\n\n'
          'First, let me commend the vision and dedication of the founder of Edgewood College, for conceiving of and delivering this unique centre of education which combines a strong commitment to developing God fearing and selfless leaders with a dedication to offering the best in the sixth form education blending both local and the UK curricula.\n\n'
          'To the staff of the College, it is to your knowledge, and expertise and your experience that our most important national resources, these young people are committed year in, year out. And you must be doing many things right to have received the Outstanding Cambridge Learner Awards, top in 2017 and the awardee of the high achievement in Cambridge A level Law in 2018. Congratulations and very well done.\n\n'
          'For parents and guardians of the members of the graduating class, we all join you in rejoicing today and in thanking God for this great gifts of success and accomplishments.\nAnd to the graduating class of 2020, my very special and warm congratulations. I have a short message for you, it is tilted “The Class of Game Changers”.\n\n'
          'Every generation is gifted by God with a unique set of circumstances that give them an opportunity to distinguish themselves, to make history, to do something never done before, to positively alter the trajectory of the story of mankind. That opportunity usually comes disguised as a challenge, a drawback, even a tragedy; it hardly ever looks like the next great leap of mankind that it really is.\n\n'
          'The generation that should take advantage may sometimes even miss the opportunity, because as human beings our inclination is to look back rather than ahead. We seek comfort in the familiar things, the known course of events, we want progress but we still want things to be the way they were.',
          trimLines: 3,
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
  );
}
