import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyle {
  // mobileHeading1 Text Style
  static final mobileHeading1 = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w700, // bold
    height: 1, // 32px
    letterSpacing: -0.32, // -1%
  );
  // mobileHeading2 Text Style
  static final TextStyle mobileHeading2 = GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.w700, // bold
    height: 1, // 28px
    letterSpacing: -0.28, // -1%
  );
  // mobileHeading3 Text Style
  static final TextStyle mobileHeading3 = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600, // semi bold
    height: 1, // 24px
    letterSpacing: -0.24, // -1%
  );
  // regularBody1 Text Style
  static final TextStyle regularBody1 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400, // regular
    height: 1, // 18px
  );
  // regularBody2 Text Style
  static final TextStyle regularBody2 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400, // regular
    height: 1, // 16px
  );
  // regularBody3 Text Style
  static final TextStyle regularBody3 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400, // regular
    height: 1.14, // 16px
  );
  // mediumBody1 Text Style
  static final TextStyle mediumBody1 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w500, // medium
    height: 1, // 18px
  );
  // mediumBody2 Text Style
  static final TextStyle mediumBody2 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500, // medium
    height: 1.25, // 20px
  );
  // mediumBody3 Text Style
  static final TextStyle mediumBody3 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500, // medium
    height: 1.14, // 16px
  );
  // boldBody1 Text Style
  static final TextStyle boldBody1 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w700, // bold
    height: 1, // 18px
  );
  // boldBody2 Text Style
  static final TextStyle boldBody2 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700, // bold
    height: 1, // 16px
  );
  // boldBody3 Text Style
  static final TextStyle boldBody3 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w700, // bold
    height: 1, // 14px
  );
}
