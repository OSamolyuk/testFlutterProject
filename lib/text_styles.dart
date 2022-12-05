import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _defaultFontSize = 15.0;

class TextStyles {
  const TextStyles();

  TextStyle defaultTextStyle() => GoogleFonts.openSans(
      textStyle: const TextStyle(
        color: Colors.black,
        fontSize: _defaultFontSize,
        fontWeight: FontWeight.w400,
      ));
}