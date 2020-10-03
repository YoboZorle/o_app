import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oapp/values/values.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost>
    with SingleTickerProviderStateMixin {
  final String _back = 'assets/svg/back.svg';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Image> imgs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: NestedScrollView(
            physics: NeverScrollableScrollPhysics(),
            headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
              return <Widget>[
//                SliverAppBar(
//                  elevation: 0,
//                  centerTitle: true,
//                  automaticallyImplyLeading: false,
//                  title: title(),
//                  expandedHeight: 50,
//                  backgroundColor: Colors.transparent,
//                  snap: true,
//                  floating: true,
//                  pinned: true,
//                  leading: leading(),
//                ),
              ];
            },
            body: _body(),
          ),
        ));
  }

  Widget title() => Text('Create Post',
      style: TextStyle(
          fontFamily: 'Ubuntu',
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: AppColors.primaryText));

  yarnInput() => Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Container(
                  height: 35,
                  width: 35,
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://pbs.twimg.com/profile_images/1282055533093171206/1iIQxCaf_400x400.jpg'),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                flex: 1),
            Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(
                    // color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: TextField(
                    textAlign: TextAlign.start,
                    maxLines: 4,
                    minLines: 3,
                    autocorrect: true,
                    cursorColor: AppColors.primaryText,
                    style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Ubuntu",
                        fontSize: 15),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[400],
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.w400),
                      hintText: 'What\'s on your mind?',
                      hintMaxLines: 1,
                      border: InputBorder.none,
                      // contentPadding: EdgeInsets.all(5),
                    ),
                  ),
                ),
                flex: 8),
          ],
        ),
      );

  Widget leading() => IconButton(
        icon: Row(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(12),
                child: SvgPicture.asset(_back,
                    color: Colors.black,
                    height: 19,
                    semanticsLabel: 'Back icon')),
          ],
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

  Widget uploadImg() => Container(
      height: 100,
      margin: EdgeInsets.only(top: 15, left: 15),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imgs.length,
          itemBuilder: (context, i) => Stack(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 8),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(3.0),
                          child: imgs[i])),
                  Positioned(
                      right: -2,
                      top: -9,
                      child: IconButton(
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.black.withOpacity(0.5),
                            size: 18,
                          ),
                          onPressed: () => setState(() {
                                imgs.removeAt(i);
                              })))
                ],
              )));

  Widget postBtn() => FlatButton(
        onPressed: () {},
        color: AppColors.primaryText,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        textColor: Color.fromARGB(255, 255, 255, 255),
        padding: EdgeInsets.only(left: 45, right: 45),
        child: Text(
          "Post",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: AppColors.bgLowerGreen,
            fontWeight: FontWeight.w500,
            fontFamily: 'Ubuntu',
            fontSize: 14,
          ),
        ),
      );

  Widget uploadPhoto() => FlatButton(
        onPressed: () async {
          var imgFile =
              await ImagePicker.pickImage(source: ImageSource.gallery);
          setState(() {
            imgs.add(Image.file(imgFile, height: 100));
          });
        },
        // color: Colors.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        textColor: Color.fromARGB(255, 255, 255, 255),
        padding: EdgeInsets.only(left: 2, right: 5),
        child: Row(
          children: <Widget>[
            Icon(Icons.photo_library, size: 20,  color: AppColors.primaryText,),
            SizedBox(width: 10),
            Text(
              "Add photo",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.w500,
                fontFamily: 'Ubuntu',
                fontSize: 14,
              ),
            ),
          ],
        ),
      );

  Widget _body() => Container(
        color: AppColors.bgUpperGreen,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 0),
              child: Column(children: <Widget>[
//                SizedBox(height: 10),
//                title(),
                SizedBox(height: 15),
                yarnInput(),

                Container(
                  height: 1,
                  color: AppColors.bgLowerGreen.withOpacity(0.4),
                  margin:
                      EdgeInsets.only(top: 15, bottom: 10, left: 20, right: 20),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      uploadPhoto(),
                      postBtn(),
                    ],
                  ),
                ),
                uploadImg(),
              ])),
        ),
      );
}
