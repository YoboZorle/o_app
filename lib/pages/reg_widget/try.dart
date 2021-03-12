import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oapp/values/values.dart';

import 'reg_widget.dart';


class Try extends StatefulWidget {
  Try({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TryState createState() => _TryState();
}

class _TryState extends State<Try> {
  final TextStyle textstyle =
      TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold);
  final InputDecoration decoration = InputDecoration(
    border: OutlineInputBorder(),
  );

  int _user;
  bool _value = false;
  var users = <String>[
    'Male',
    'Female',
  ];

  // checkBox varieables
  bool rememberMe = false;

  String _animationName = "Untitled";
  final String _id = 'assets/svg/id.svg';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
          backgroundColor: Colors.grey[400],
          body: Stack(
            children: <Widget>[
//              Container(
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                    image: AssetImage(
//                        "assets/images/signup_bg.png"), // <-- BACKGROUND IMAGE
//                    fit: BoxFit.cover,
//                  ),
//                ),
//              ),
              Container(
//          padding: EdgeInsets.all(4),
//          height: 108,
//          width: 300,
                // margin: EdgeInsets.only(left: 10),
                // color: Colors.blue,
                child: FlareActor(
                  // Using Flare Animations
                  "assets/flare/reg_bg_oapp.flr",
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  animation: _animationName,
                ),
              ),
              SafeArea(
                child: new LayoutBuilder(
                  builder: (BuildContext context,
                      BoxConstraints viewportConstraints) {
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: viewportConstraints.maxHeight),
                        child: Column(children: [
                          // remaining stuffs
//                          Container(
//                            height: 38,
//                            margin: EdgeInsets.only(top: 30),
//                            child: Image.asset(
//                              "assets/images/logo_landscape.png",
//                              fit: BoxFit.contain,
//                            ),
//                          ),
                          Container(
                            height: 65,
                            margin: EdgeInsets.only(left: 25, top: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topLeft,
                                  width: 50,
                                  child: new FlareActor(
                                      "assets/flare/logo_oapp_small.flr",
                                      fit: BoxFit.contain),
                                ),
                              ],
                            ),
                          ),
//                          SizedBox(
//                              height: MediaQuery.of(context).size.height * .06),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Column(
                              children: <Widget>[
                                Text('Sign Up',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "CircularStd",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 25,
                                      color: AppColors.primaryText,
                                    )),
                                SizedBox(height: 12),
                                Text('Fill in your personal information',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "CircularStd",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: AppColors.primaryText,
                                    )),
                              ],
                            ),
                          ),
                          firstName(),
                          lastName(),
                          designation(),
                          email(),
                          // matricNo(),
                          passWord(),
                          department(),
                          terms(),
                          // Expanded(child: Container()),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 30),
                              child: btnBottom()),
                          SizedBox(height: 30)
                        ]),
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }

  btnBottom() => Container(
        // color: Colors.orange,
        child: Column(
          children: <Widget>[
            // LOGIN
            SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width * 1,
              child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return new RegWidget();
                    }));
                  },
                  color: AppColors.primaryText,
                  splashColor: AppColors.primaryText.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5),
                  ),
                  child: Text("Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: 'Ubuntu',
                        color: AppColors.bgLowerGreen,
                        inherit: false,
                      ))),
            ),
            SizedBox(height: 5),
            // GO LOGIN PAGE
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width * 1,
              child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return new RegWidget();
                    }));
                  },
                  // color: AppColors.primaryText,
                  splashColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5),
                  ),
                  child: Text("Already registered? Sign in",
                      style: TextStyle(
                        fontFamily: "Sf-Pro-Text",
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: AppColors.primaryText,
                        inherit: false,
                      ))),
            ),
          ],
        ),
      );

  firstName() => Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('First name',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w500,
                    fontSize: 12)),
            Container(
              height: 40,
              margin: EdgeInsets.only(top: 4),
              child: TextFormField(
                // obscureText: true,
                textAlign: TextAlign.start,
                style: new TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: AppColors.primaryText),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.primaryText, width: 1.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.primaryText, width: 1.0),
                  ),
                ),
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return 'Username required';
                  }
                },
              ),
            ),
          ],
        ),
      );

  lastName() => Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Last name',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w500,
                    fontSize: 12)),
            Container(
              height: 40,
              margin: EdgeInsets.only(top: 4),
              child: TextFormField(
                // obscureText: true,
                textAlign: TextAlign.start,
                style: new TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: AppColors.primaryText),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.primaryText, width: 1.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.primaryText, width: 1.0),
                  ),
                ),
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return 'Username required';
                  }
                },
              ),
            ),
          ],
        ),
      );

  email() => Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Email',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w500,
                    fontSize: 12)),
            Container(
              height: 40,
              margin: EdgeInsets.only(top: 4),
              child: TextFormField(
                // obscureText: true,
                textAlign: TextAlign.start,
                style: new TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: AppColors.primaryText),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.primaryText, width: 1.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.primaryText, width: 1.0),
                  ),
                ),
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return 'Username required';
                  }
                },
              ),
            ),
          ],
        ),
      );

  designation() => Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nationaliy',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w500,
                    fontSize: 12)),
            Container(
              height: 40,
              margin: EdgeInsets.only(top: 4),
              child: TextFormField(
                // obscureText: true,
                textAlign: TextAlign.start,
                style: new TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: AppColors.primaryText),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.primaryText, width: 1.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.primaryText, width: 1.0),
                  ),
                ),
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return 'Username required';
                  }
                },
              ),
            ),
          ],
        ),
      );

  matricNo() => Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Matric. Number',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w500,
                    fontSize: 12)),
            Container(
              height: 40,
              margin: EdgeInsets.only(top: 4),
              child: TextFormField(
                // obscureText: true,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
                textAlign: TextAlign.start,
                style: new TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: AppColors.primaryText),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.primaryText, width: 1.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.primaryText, width: 1.0),
                  ),
                ),
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return 'Username required';
                  }
                },
              ),
            ),
          ],
        ),
      );

  passWord() => Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Password',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w500,
                    fontSize: 12)),
            Container(
              height: 40,
              margin: EdgeInsets.only(top: 4),
              child: TextFormField(
                obscureText: true,
                textAlign: TextAlign.start,
                style: new TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: AppColors.primaryText),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.primaryText, width: 1.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.primaryText, width: 1.0),
                  ),
                ),
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return 'Password required';
                  }
                },
              ),
            ),
          ],
        ),
      );

  department() => Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Gender',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w500,
                    fontSize: 12)),
            Theme(
                data: new ThemeData(
                    canvasColor: Colors.white,
                    primaryColor: AppColors.primaryText,
                    accentColor: AppColors.primaryText,
                    hintColor: AppColors.primaryText),
                child: Container(
                    height: 40.0,
                    margin: EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        border: Border.all(color: AppColors.primaryText)),
                    padding: EdgeInsets.only(right: 13, left: 15),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        iconEnabledColor: AppColors.primaryText,
                        style: TextStyle(
                            // color: Colors.yellow,
                            fontFamily: 'CircularStd',
                            fontWeight: FontWeight.w400,
                            fontSize: 13),
                        underline: Text(''),
                        isExpanded: true,
                        iconSize: 22,
                        // icon: ,
                        value: _user == null ? null : users[_user],
                        items: users.map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value,
                                style: TextStyle(
                                  fontFamily: 'CircularStd',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: AppColors.primaryText,
                                  inherit: false,
                                )),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _user = users.indexOf(value);
                          });
                        },
                      ),
                    )))
          ],
        ),
      );

  terms() => Container(
        // color: Colors.yellow,
        margin: EdgeInsets.only(left: 18, top: 15, bottom: 25, right: 30),
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Theme(
              data: ThemeData(unselectedWidgetColor: AppColors.primaryText),
              child: Checkbox(
                activeColor: AppColors.primaryText,
                checkColor: Colors.white,
                value: rememberMe,
                onChanged: _onRememberMeChanged,
              ),
            ),
            Text('Accept terms and conditions',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w400,
                    fontSize: 13)),
          ],
        ),
      );

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;

        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });
}
