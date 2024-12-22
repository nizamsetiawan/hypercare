part of 'theming.dart';

abstract class SMColors {

  /// COLOR PALETTE
  static Color get primary => const Color(0xff8E97FD);
  static Color get secondary => const Color(0xff3F414E);
  static Color get tertiary => const Color(0xffEBEAEC);
  static Color get sleep => const Color(0xff03174C);
  static Color get sleepText => const Color(0xffE6E7F2);

  /// TEXT
  static Color get primaryText => const Color(0xff3F414E);
  static Color get primaryTextW => const Color(0xffF6F1FB);
  static Color get secondaryText => const Color(0xffA1A4B2);
  static Color get txtBG => const Color(0xffF2F3F7);

  ///NATURAL GREY
  static const Color naturalGrey100 = Color(0xFF464952);
  static const Color naturalGrey90 = Color(0xFF5B5F69);
  static const Color naturalGrey80 = Color(0xFF717580);
  static const Color naturalGrey70 = Color(0xFF878C96);
  static const Color naturalGrey60 = Color(0xFF9FA3AD);
  static const Color naturalGrey50 = Color(0xFFB7BBC4);
  static const Color naturalGrey40 = Color(0xFFD0D3DA);
  static const Color naturalGrey30 = Color(0xFFEAECF1);
  static const Color naturalGrey20 = Color(0xFFFCFDFF);
  static const Color naturalGrey10 = Color(0xFFFEFFFF);

  ///STATE INFO
  static const Color stateInfoBase = Color(0xFF004D94);
  static const Color stateInfoStroke = Color(0xFFCCDBEA);
  static const Color stateInfoFill = Color(0xFFF5F8FB);

  ///STATE ERROR
  static const Color stateErrorBase = Color(0xFFF55151);
  static const Color stateErrorStroke = Color(0xFFFCC5C5);
  static const Color stateErrorFill = Color(0xFFFFEAEA);

  ///STATE SUCCESS
  static const Color stateSuccessBase = Color(0xFF74B816);
  static const Color stateSuccessStroke = Color(0xFFD1E7B1);
  static const Color stateSuccessFill = Color(0xFFEEFCDB);

  ///STATE WARNING
  static const Color stateWarningBase = Color(0xFFFCC419);
  static const Color stateWarningStroke = Color(0xFFFEEBB2);
  static const Color stateWarningFill = Color(0xFFFFF7DD);

  /// COMMON
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Colors.transparent;
  static const Color divider = Color(0xFFD9D9D9);
}
