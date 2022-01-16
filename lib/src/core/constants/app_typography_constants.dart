import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// constants
import 'package:capitalplace/src/core/constants/app_constants.dart';

class AppTypographyConstants {
  static final TextStyle button = GoogleFonts.inter(
    color: AppColorConstants.white,
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle heading = GoogleFonts.inter(
    color: AppColorConstants.secondary,
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle body = GoogleFonts.inter(
    color: AppColorConstants.text,
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle link = GoogleFonts.inter(
    color: AppColorConstants.secondary,
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle label = GoogleFonts.inter(
    color: AppColorConstants.black,
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle hint = GoogleFonts.inter(
    color: AppColorConstants.black,
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
  );
}
