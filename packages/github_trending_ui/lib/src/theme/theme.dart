import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_trending_ui/github_trending_ui.dart';

/// Namespace for Default Github Trending [ThemeData].
abstract class GTTheme {
  /// Default `ThemeData` for Github Trending UI.
  static final ThemeData themeData = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    brightness: Brightness.light,
    primaryColor: GTColors.indigo,
    primaryColorDark: GTColors.indigoDark,
    primaryColorLight: GTColors.indigoLight,
    canvasColor: _backgroundColor,
    backgroundColor: _backgroundColor,
    scaffoldBackgroundColor: _backgroundColor,
    iconTheme: _iconTheme,
    appBarTheme: _appBarTheme,
    dividerTheme: _dividerTheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    buttonTheme: _buttonTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    textButtonTheme: _textButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    splashColor: GTColors.transparent,
    snackBarTheme: _snackBarTheme,
    disabledColor: GTColors.grey,
    errorColor: GTColors.red,
    tabBarTheme: _tabBarTheme,
    dialogTheme: _dialogTheme,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: GTColors.lightBlue),
  );

  static const _dialogTheme = DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    elevation: 0,
  );

  static final _snackBarTheme = SnackBarThemeData(
    contentTextStyle: GtTextStyle.bodyText1.copyWith(
      color: GTColors.white,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(GTSpacing.s8),
    ),
    actionTextColor: GTColors.lightBlue,
    backgroundColor: GTColors.black,
    elevation: 4,
    behavior: SnackBarBehavior.floating,
  );

  static const _backgroundColor = GTColors.white;

  static final _appBarTheme = AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    color: GTColors.white,
    iconTheme: const IconThemeData(color: GTColors.black),
    centerTitle: true,
    toolbarTextStyle: _textTheme.bodyText2,
    titleTextStyle: _textTheme.headline4,
  );

  static const _iconTheme = IconThemeData(color: GTColors.black);

  static const _dividerTheme = DividerThemeData(
    color: GTColors.indigoLightest,
    space: GTSpacing.s2,
    thickness: GTSpacing.s2,
    indent: GTSpacing.s0,
    endIndent: GTSpacing.s0,
  );

  static final _textTheme = TextTheme(
    headline1: GtTextStyle.headline1,
    headline2: GtTextStyle.headline2,
    headline3: GtTextStyle.headline3,
    headline4: GtTextStyle.headline4,
    headline5: GtTextStyle.headline5,
    headline6: GtTextStyle.headline6,
    subtitle1: GtTextStyle.subtitle1,
    subtitle2: GtTextStyle.subtitle2,
    bodyText1: GtTextStyle.bodyText1,
    bodyText2: GtTextStyle.bodyText2,
    button: GtTextStyle.button,
    caption: GtTextStyle.caption,
    overline: GtTextStyle.overline,
  );

  static const _inputDecorationTheme = InputDecorationTheme(
    fillColor: Colors.white,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: GTColors.indigoLightest),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: GTColors.indigoLightest),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: GTColors.indigoLightest),
    ),
    labelStyle: TextStyle(color: GTColors.indigoLight),
    errorStyle: TextStyle(
      color: GTColors.errorColor,
    ),
  );

  static final _buttonTheme = ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    buttonColor: GTColors.darkBlue,
    height: 48,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(GTSpacing.s8),
    ),
  );

  static final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: GTColors.darkBlue,
      minimumSize: const Size(0, 48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(GTSpacing.s8),
      ),
      elevation: 0,
    ),
  );

  static final _textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: GTColors.darkBlue,
      backgroundColor: GTColors.lightBlue,
      minimumSize: const Size(0, 48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(GTSpacing.s8),
      ),
      elevation: 0,
    ),
  );

  static final _outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: GTColors.darkBlue,
      minimumSize: const Size(0, 48),
      side: const BorderSide(
        width: 2,
        color: GTColors.indigoLightest,
      ),
      backgroundColor: GTColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(GTSpacing.s8),
      ),
    ),
  );

  static final _tabBarTheme = TabBarTheme(
    labelColor: GTColors.indigo,
    unselectedLabelColor: GTColors.indigoLight,
    labelStyle: _textTheme.headline6!.copyWith(
      fontWeight: GTFontWeight.medium,
      color: GTColors.indigo,
    ),
    unselectedLabelStyle: _textTheme.headline6!.copyWith(
      fontWeight: GTFontWeight.medium,
      color: GTColors.indigoLight,
    ),
    labelPadding: const EdgeInsets.symmetric(
      horizontal: GTSpacing.s16,
    ),
    indicator: const UnderlineTabIndicator(
      borderSide: BorderSide(
        color: GTColors.indigo,
        width: GTSpacing.s2,
      ),
    ),
    indicatorSize: TabBarIndicatorSize.tab,
  );
}
