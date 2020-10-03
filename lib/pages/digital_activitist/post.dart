import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';
import 'package:oapp/values/values.dart';

const double buttonSize = 28.0;

class Post extends StatefulWidget {
  final List<String> galleryItems;

  Post(this.galleryItems);
  bool isExpanded = false;

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
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
        SizedBox(height: 10),
        userInfoRow(),
        Text('Yobo', style: TextStyle(fontSize: 100, color: Colors.white),),
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
                    child: Icon(Icons.reply, size: 19, color: Colors.grey)),
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
              Icons.favorite,
              color: isLiked ? AppColors.primaryText : Colors.grey,
              size: 18,
            );
          },
          likeCount: 103,
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
  );

}
