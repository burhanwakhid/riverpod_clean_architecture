import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:github_trending_ui/src/colors/colors.dart';

/// LightBridge Text Style Definitions
abstract class GtTextStyle {
  /// Headline 1 Text Style
  static final TextStyle headline1 = _baseTextStyle.copyWith(
    fontSize: 48,
    fontStyle: FontStyle.normal,
    fontWeight: GTFontWeight.light,
    height: 1,
    letterSpacing: 4,
    fontFamily: 'Roboto',
  );

  /// Headline 2 Text Style
  static final TextStyle headline2 = _baseTextStyle.copyWith(
    fontSize: 40,
    fontStyle: FontStyle.normal,
    fontWeight: GTFontWeight.light,
    height: 1.2,
    fontFamily: 'Roboto',
  );

  /// Headline 3 Text Style
  static final TextStyle headline3 = _baseTextStyle.copyWith(
    fontSize: 32,
    fontStyle: FontStyle.normal,
    fontWeight: GTFontWeight.light,
    height: 1,
    fontFamily: 'Roboto',
  );

  /// Headline 4 Text Style
  static final TextStyle headline4 = _baseTextStyle.copyWith(
    fontSize: 21,
    fontStyle: FontStyle.normal,
    fontWeight: GTFontWeight.regular,
    fontFamily: 'Roboto',
    color: GTColors.veryDarkMostBlue,
  );

  /// Headline 5 Text Style
  static final TextStyle headline5 = _baseTextStyle.copyWith(
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: GTFontWeight.regular,
    height: 1.22,
    fontFamily: 'Roboto',
  );

  /// Headline 6 Text Style
  static final TextStyle headline6 = _baseTextStyle.copyWith(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: GTFontWeight.regular,
    height: 1.25,
    fontFamily: 'Roboto',
  );

  /// Subtitle 1 Text Style
  static final TextStyle subtitle1 = _baseTextStyle.copyWith(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: GTFontWeight.regular,
    height: 1.29,
    fontFamily: 'Roboto',
  );

  /// Subtitle 2 Text Style
  static final TextStyle subtitle2 = _baseTextStyle.copyWith(
    fontSize: 12,
    fontStyle: FontStyle.normal,
    fontWeight: GTFontWeight.regular,
    fontFamily: 'Roboto',
    color: GTColors.veryDarkGrayishBlue,
  );

  /// Body Text 1 Text Style
  static final TextStyle bodyText1 = _baseTextStyle.copyWith(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: GTFontWeight.medium,
    fontFamily: 'Roboto',
    color: GTColors.veryDarkGrayishBlue,
  );

  /// Body Text 2 Text Style (the default)
  static final TextStyle bodyText2 = _baseTextStyle.copyWith(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: GTFontWeight.regular,
    height: 1.43,
    fontFamily: 'Roboto',
  );

  /// Button Text Style
  static final TextStyle button = _baseTextStyle.copyWith(
    fontSize: 20,
    fontStyle: FontStyle.normal,
    fontWeight: GTFontWeight.medium,
    height: 1.2,
    fontFamily: 'Roboto',
  );

  /// Caption Text Style
  static final TextStyle caption = _baseTextStyle.copyWith(
    fontSize: 10,
    fontStyle: FontStyle.normal,
    fontWeight: GTFontWeight.regular,
    height: 1.2,
    fontFamily: 'Roboto',
  );

  /// Overline Text Style
  static final TextStyle overline = _baseTextStyle.copyWith(
    fontSize: 12,
    fontStyle: FontStyle.normal,
    fontWeight: GTFontWeight.regular,
    height: 1,
    letterSpacing: 2,
    fontFamily: 'Roboto',
  );

  static final _baseTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: GTFontWeight.regular,
    height: 1.5,
    fontFeatures: [
      FontFeature.stylisticSet(1),
      const FontFeature.slashedZero(),
      const FontFeature.enable('ordn'),
      const FontFeature.enable('cv05'),
      const FontFeature.enable('case'),
    ],
  );
}

/// Namespace for Default LightBridge Font Weights
abstract class GTFontWeight {
  /// FontWeight value of `w900`
  static const FontWeight black = FontWeight.w900;

  /// FontWeight value of `w800`
  static const FontWeight extraBold = FontWeight.w800;

  /// FontWeight value of `w700`
  static const FontWeight bold = FontWeight.w700;

  /// FontWeight value of `w600`
  static const FontWeight semiBold = FontWeight.w600;

  /// FontWeight value of `w500`
  static const FontWeight medium = FontWeight.w500;

  /// FontWeight value of `w400`
  static const FontWeight regular = FontWeight.w400;

  /// FontWeight value of `w300`
  static const FontWeight light = FontWeight.w300;

  /// FontWeight value of `w200`
  static const FontWeight extraLight = FontWeight.w200;

  /// FontWeight value of `w100`
  static const FontWeight thin = FontWeight.w100;
}
