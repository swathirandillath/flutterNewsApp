
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size( 750, 1334 ),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);

    bool _showEmailField = true;

    Widget _showPasswordUi() {
      return Column(children:  <Widget> [
        TextField(
          style: GoogleFonts.lato(
            fontSize: ScreenUtil().setSp(30),

            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.email),
              labelText: 'New password',
              labelStyle: GoogleFonts.lato(
                fontSize: ScreenUtil().setSp(26),
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
              // border: OutlineInputBorder(),
              //border: UnderlineInputBorder(),

              hintText: 'new password',
              hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
              errorText: null),
          keyboardType: TextInputType.emailAddress,
        ),
        TextField(
          style: GoogleFonts.lato(
            fontSize: ScreenUtil().setSp(30),
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),
          decoration: InputDecoration(
              suffixIcon: const Icon(Icons.email),
              labelText: 'Confirm password',
              labelStyle: GoogleFonts.lato(
                fontSize: ScreenUtil().setSp(26),
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
              // border: OutlineInputBorder(),
              //border: UnderlineInputBorder(),

              hintText: 'confirm password',
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 12.0),
              errorText: null),
          keyboardType: TextInputType.emailAddress,
        )
      ],);

    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(left: 28.0, right: 28.0, top: 100.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Forgot Password',
                        style: GoogleFonts.lato(
                          fontSize: ScreenUtil().setSp(50),
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(30),
                      ),
                      Text(
                        'Enter the email address you used to create your account and we will email you a link to reset your password',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontSize: ScreenUtil().setSp(26),
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(100),
                      ),
                      _showEmailField ? TextField(
                        style: GoogleFonts.lato(
                          fontSize: ScreenUtil().setSp(30),
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.email),
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
                      ) : _showPasswordUi(),
                      SizedBox(
                        height: ScreenUtil().setHeight(50),
                      ),
                      MaterialButton(
                          height: ScreenUtil().setHeight(80),
                          color: Colors.blue,
                          onPressed: (){
                            setState(() {
                              _showEmailField = false;
                            });
                          },
                          child: Center(
                              child: Text('Submit',
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: ScreenUtil().setSp(35),
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  )))),

                    ],
                  ),
                ))),
      ),
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
