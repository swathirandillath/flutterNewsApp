import 'package:NewsApp/UI/forgot_password/forgot_password.dart';
import 'package:NewsApp/UI/login/widgets/social_icon.dart';
import 'package:NewsApp/UI/onboarding/onboarding_page.dart';
import 'package:NewsApp/widgets/tools/view_model_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'custom_icons.dart';
import 'login_viewmodel.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {


  bool _isSelected = false;
  bool _lockUIButtons = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2.0, color: Colors.black),
        ),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  bool _obscurePass = false;

  void _togglePass() {
    {
      setState(() {
        _obscurePass = !_obscurePass;
      });
    }
  }

  Widget formCardLogin() => Container(
      width: double.infinity,
      //height: ScreenUtil().setHeight(600),
      /* decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 15.0),
            blurRadius: 15.0,
          ),
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, -10.0),
            blurRadius: 10.0,
          ),
        ],
      ),*/
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
            /*Text(
              'Email address',
              style: GoogleFonts.lato(
                fontSize: ScreenUtil().setSp(26),
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),*/ //

            TextField(
              style: GoogleFonts.lato(
                fontSize: ScreenUtil().setSp(30),
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              ),
              decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.email),
                  labelText: 'Email address',
                  labelStyle: GoogleFonts.lato(
                    fontSize: ScreenUtil().setSp(26),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                  // border: OutlineInputBorder(),
                  //border: UnderlineInputBorder(),

                  hintText: 'email address',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 12.0),
                  errorText: null),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(50),
            ),
            /* Text('Password',
                style: GoogleFonts.lato(
                  fontSize: ScreenUtil().setSp(26),
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                )),*/
            TextField(
              obscureText: !_obscurePass,
              style: GoogleFonts.lato(
                fontSize: ScreenUtil().setSp(30),
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              ),
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePass ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () => _togglePass(),
                  ),
                  labelText: 'Password',
                  labelStyle: GoogleFonts.lato(
                    fontSize: ScreenUtil().setSp(26),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                  hintText: 'password',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 12.0),
                  errorText: null),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(35),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPassword()));
                        },
                        child: Center(
                            child: Text(
                          'Forgot Password?',
                          style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: ScreenUtil().setSp(26),
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                        ))))
              ],
            )
          ],
        ),
      ));


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(750, 1334),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);

    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) =>MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue,
          accentColor: Colors.blueAccent,
          textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.blue)),
        ),
        home: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: true,
            body: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                /* Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Image.asset('assets/images/image_01.png')),
                    Expanded(
                      child: Container(),
                    ),
                    Image.asset('assets/images/image_02.png'),
                  ],
                ),*/
                SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: 28.0, right: 28.0, top: 60.0, bottom: 60.0),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Image.asset(
                                'assets/images/news_logo.png',
                                width: ScreenUtil().setWidth(250),
                                height: ScreenUtil().setHeight(250),
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(50),
                            ),
                            formCardLogin(),
                            SizedBox(
                              height: ScreenUtil().setHeight(35),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              // change with spaceBetween for remember me
                              children: <Widget>[
                                /*Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width:
                                          ScreenUtil().setWidth(12.0),
                                    ),
                                    GestureDetector(
                                      onTap: _radio,
                                      child: radioButton(_isSelected),
                                    ),
                                    SizedBox(
                                      width: ScreenUtil().setWidth(8.0),
                                    ),
                                    Text('Remember me',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontFamily: 'Poppins-Medium',
                                        )),
                                  ],
                                ),*/
                                /*Container(
                                          width: ScreenUtil()
                                              .setWidth(300),
                                          height: ScreenUtil()
                                              .setHeight(100),
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              Color(0xFF17ead9),
                                              Color(0xFF6078ea)
                                            ]),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0xFF6078ea)
                                                    .withOpacity(.3),
                                                offset: Offset(0.0, 8.0),
                                                blurRadius: 8.0,
                                              )
                                            ],
                                          ),
                                          child: Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                  onTap: () async {
                                                    _lockUIButtons = true;

                                                    Future.delayed(
                                                        Duration(seconds: 1),
                                                        () => Navigator.of(context)
                                                            .pushReplacement(
                                                                MaterialPageRoute(
                                                                    builder: (BuildContext
                                                                            context) =>
                                                                        MyHome())));
                                                  },
                                                  child: Center(
                                                      child: Text('SIGNIN',
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontFamily:
                                                                  'Poppins-Bold',
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  1.0)))))),*/
                                Container(
                                    child: _lockUIButtons
                                        ? const CircularProgressIndicator(
                                            backgroundColor: Colors.cyan,
                                            strokeWidth: 5,
                                          )
                                        : Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16.0,
                                                  top: 16.0,
                                                  right: 16.0),
                                              child: MaterialButton(
                                                  height: ScreenUtil().setHeight(80),
                                                  color: Colors.blue,
                                                  onPressed: () async {
                                                    setState(() {
                                                      _lockUIButtons = true;
                                                    });

                                                    Future.delayed(
                                                        const Duration(seconds: 2), () {
                                                      setState(() {
                                                        _lockUIButtons = false;
                                                      });
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  OnboardingPage()));
                                                    });
                                                  },
                                                  child: Center(
                                                      child: Text('Sign in',
                                                          style: GoogleFonts.lato(
                                                            color: Colors.white,
                                                            fontSize: ScreenUtil
                                                                    ()
                                                                .setSp(35),
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontStyle:
                                                                FontStyle.normal,
                                                          )))),
                                            ),
                                          ))
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(40),
                            ),

                            /// hidden social login text
                            /*Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                horizontalLine(),
                                Text(
                                    'Social Login',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'Poppins-Medium',
                                    )
                                ),
                                horizontalLine(),
                              ],
                            ),*/
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                horizontalLine(),
                                Text('    OR    ',
                                    style: GoogleFonts.lato(
                                      color: Colors.grey,
                                      fontSize:
                                          ScreenUtil().setSp(25),
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    )),
                                horizontalLine(),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),

                           /* Padding(
                              padding: EdgeInsets.only(
                                  left: 16.0, top: 16.0, right: 16.0),
                              child: MaterialButton(
                                  height: ScreenUtil().setHeight(80),
                                  color: Colors.blue,
                                  onPressed: () {},
                                  child: Center(
                                      child: Text('Login With Facebook',
                                          style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontSize: ScreenUtil()
                                                .setSp(35),
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                          )))),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 16.0, top: 16.0, right: 16.0),
                              child: MaterialButton(
                                  height: ScreenUtil().setHeight(80),
                                  color: Colors.red,
                                  onPressed: () {},
                                  child: Center(
                                      child: Text('Login With Google',
                                          style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontSize: ScreenUtil()
                                                .setSp(35),
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                          )))),
                            ),*/

                            /// hidden social icons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: SocialIcon(
                                    colors: const [
                                      Color(0xFF102397),
                                      Color(0xFF187adf),
                                      Color(0xFF00eaf8),
                                    ],
                                    icondata: CustomIcons.facebook,
                                    onPressed: () {
                                      model.signInWithFacebook();

                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: SocialIcon(
                                    colors: const [
                                      Color(0xFFff4f38),
                                      Color(0xFFff355d),
                                    ],
                                    icondata: CustomIcons.googlePlus,
                                    onPressed: () {
                                      model.signInWithGoogle();
                                    // var signIn =
                                    // signIn.asStream()
                                    //   signInWithGoogle();


                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: SocialIcon(
                                    colors: const [
                                      Color(0xFF17ead9),
                                      Color(0xFF6078ea),
                                    ],
                                    icondata: CustomIcons.twitter,
                                    onPressed: () {
                                      model.signInWithTwitter();

                                    },
                                  ),
                                ),
                             /*   SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: SocialIcon(
                                    colors: const [
                                      Color(0xFF00c6fb),
                                      Color(0xFF005bea),
                                    ],
                                    icondata: CustomIcons.linkedin,
                                    onPressed: () {},
                                  ),
                                ),*/
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(30),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'New User? ',
                                  style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontSize: ScreenUtil().setSp(25),
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    /* Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => NewRegister()));*/
                                  },
                                  child: Text(
                                    'SignUp',
                                    style: GoogleFonts.lato(
                                      color: Colors.red,
                                      fontSize:
                                          ScreenUtil().setSp(25),
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ))),
              ],
            )),
      ),
        viewModelBuilder: () =>LoginViewModel(),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
