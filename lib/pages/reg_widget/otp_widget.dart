import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:oapp/pages/menu_widget/menu_widget.dart';
import 'package:oapp/values/values.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OtpWidget extends StatefulWidget {
  @override
  OtpWidgetState createState() => OtpWidgetState();
}

class OtpWidgetState extends State<OtpWidget> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  BuildContext _context;
  final PageController _pageController = PageController(initialPage: 0);
  int _pageIndex = 0;

  String number = "08038752226";
  String secure;

  @override
  void initState() {
    super.initState();
    _pinPutFocusNode.requestFocus();
    secure = number.replaceAll(RegExp(r'.(?=.{4})'), '*');
  }

  @override
  void dispose() {
    _pinPutFocusNode.dispose();
    super.dispose();
  }

  Widget onlySelectedBorderPinPut() {
    BoxDecoration pinPutDecoration = BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(
          width: .8,
          color: AppColors.primaryText,
        ));
    return PinPut(
      fieldsCount: 5,
      textStyle: TextStyle(
          fontSize: 25, fontFamily: 'Ubuntu', color: AppColors.primaryText),
      eachFieldWidth: 40,
      eachFieldHeight: 50,
      onSubmit: (String pin) => _showSnackBar(pin),
      focusNode: _pinPutFocusNode,
      autofocus: true,
      controller: _pinPutController,
      submittedFieldDecoration: pinPutDecoration,
      selectedFieldDecoration: pinPutDecoration.copyWith(
          color: AppColors.primaryText,
          border: Border.all(
            width: 1.5,
            color: AppColors.primaryText,
          )),
      followingFieldDecoration: pinPutDecoration,
      pinAnimationType: PinAnimationType.slide,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pinPuts = [
      onlySelectedBorderPinPut(),
    ];

    List<Color> _bgColors = [
      Colors.white,
      Color.fromRGBO(43, 36, 198, 1),
      Colors.white,
      Color.fromRGBO(75, 83, 214, 1),
      Color.fromRGBO(43, 46, 66, 1),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        platform: TargetPlatform.iOS,
      ),
      home: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            fit: StackFit.passthrough,
            children: <Widget>[
              new Container(
                child: new FlareActor("assets/flare/reg_bg_oapp.flr",
                    fit: BoxFit.cover),
              ),
              Builder(
                builder: (context) {
                  _context = context;
                  return AnimatedContainer(
                    // color: _bgColors[_pageIndex],
                    duration: Duration(milliseconds: 200),
                    padding: EdgeInsets.all(40),
                    child: PageView(
                      scrollDirection: Axis.vertical,
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _pageIndex = index;
                        });
                      },
                      children: _pinPuts.map((p) {
                        return FractionallySizedBox(
                          heightFactor: 1,
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 50),
                              headerOTP(),
                              bodyOTP(),
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: p),
                            ],
                          )),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
              _bottomAppBar,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _bottomAppBar {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: resendOTP(),
    );
  }

  void _showSnackBar(String pin) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 8),
      content: Container(
          height: 80.0,
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Pin Submitted Value: $pin',
                  style: TextStyle(fontSize: 14.0, color: Colors.white),
                ),
                FlatButton(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text(
                      'Verify',
                      style: TextStyle(
                          color: AppColors.bgLowerGreen,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Ubuntu'),
                    ),
                  ),
                  color: AppColors.primaryText,
                  textColor: Colors.white,
                  onPressed: formReg,
                ),
              ],
            ),
          )),
      backgroundColor: AppColors.bgLowerGreen,
    );
    Scaffold.of(_context).hideCurrentSnackBar();
    Scaffold.of(_context).showSnackBar(snackBar);
  }

  headerOTP() => Container(
        margin: EdgeInsets.only(bottom: 15),
        child: Text(
          'Enter your\nverification code',
          //'Create an account',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'Ubuntu',
            color: AppColors.primaryText,
            fontWeight: FontWeight.w700,
            height: 1.3,
          ),
        ),
      );

  bodyOTP() => Container(
        margin: EdgeInsets.only(bottom: 30),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'We sent a verification code to ',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Ubuntu',
                color: Colors.white,
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '+234',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Ubuntu',
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),
                TextSpan(
                  text: secure,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Ubuntu',
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                )
              ]),
        ),
      );

  resendOTP() => Container(
        margin: EdgeInsets.only(bottom: 15),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Did not receive code?',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Ubuntu',
                color: Colors.white,
                fontWeight: FontWeight.w400,
                height: 1.2,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: ' Send again',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Ubuntu',
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // navigate to desired screen
                      })
              ]),
        ),
      );

  void formReg() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new MenuWidget();
        },
        fullscreenDialog: true));
  }
}
