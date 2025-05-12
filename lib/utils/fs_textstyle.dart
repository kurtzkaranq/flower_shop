import 'package:flower_shop/utils/fs_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FsTextstyle {
  static TextStyle body = GoogleFonts.inter(
      textStyle: TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.0, // 16px line height / 16px font size
    letterSpacing: 0,
    color: FsColor.white,
  ));

  static TextStyle get header {
    return body.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.green,
    );
  }

  static TextStyle get secondary {
    return body.copyWith(
      color: FsColor.mainGreen,
    );
  }
}
