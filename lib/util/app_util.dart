import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

///Text styles
 textStyleBoldBlack() => GoogleFonts.lato(
      color: Colors.black,
      fontSize: ScreenUtil().setSp(30),
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    );

 textStyleBlack() => GoogleFonts.lato(
      color: Colors.black,
      fontSize: ScreenUtil().setSp(30),
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    );
