import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/utils/app_details.dart';
import 'package:flutter/material.dart';

final _scaleWidth = AppDetails.screenSize.width / AppDetails.designWidth;

extension TextStyleX on TextStyle {
  TextStyle get w300 => copyWith(fontWeight: FontWeight.w300);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get s09 => copyWith(fontSize: 9 * _scaleWidth);
  TextStyle get s10 => copyWith(fontSize: 10 * _scaleWidth);
  TextStyle get s11 => copyWith(fontSize: 11 * _scaleWidth);
  TextStyle get s12 => copyWith(fontSize: 12 * _scaleWidth);
  TextStyle get s14 => copyWith(fontSize: 14 * _scaleWidth);
  TextStyle get s16 => copyWith(fontSize: 16 * _scaleWidth);
  TextStyle get s18 => copyWith(fontSize: 18 * _scaleWidth);
  TextStyle get s20 => copyWith(fontSize: 20 * _scaleWidth);
  TextStyle get s22 => copyWith(fontSize: 22 * _scaleWidth);
  TextStyle get s24 => copyWith(fontSize: 24 * _scaleWidth);
  TextStyle get s26 => copyWith(fontSize: 26 * _scaleWidth);
  TextStyle get s28 => copyWith(fontSize: 28 * _scaleWidth);
  TextStyle get s30 => copyWith(fontSize: 30 * _scaleWidth);
  TextStyle get s31 => copyWith(fontSize: 31 * _scaleWidth);

  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  TextStyle get raleway => copyWith(fontFamily: 'Raleway');
  TextStyle get roboto => copyWith(fontFamily: 'Roboto');
  TextStyle get gilroy => copyWith(fontFamily: 'Gilroy');

  TextStyle get white => copyWith(color: ColorResources.white);
  TextStyle get black => copyWith(color: ColorResources.black);
  TextStyle get bluishGray => copyWith(color: ColorResources.bluishGray);
  TextStyle get roseRed => copyWith(color: ColorResources.roseRed);
  TextStyle get indigoBlue => copyWith(color: ColorResources.indigoBlue);
  TextStyle get amber => copyWith(color: ColorResources.amber);
  TextStyle get silverGray => copyWith(color: ColorResources.silverGray);
  TextStyle get dustyBlue => copyWith(color: ColorResources.dustyBlue);
  TextStyle get rosePink => copyWith(color: ColorResources.rosePink);

  TextStyle get shade100 => copyWith(color: color?.withValues(alpha: 0.1));
  TextStyle get shade200 => copyWith(color: color?.withValues(alpha: 0.2));
  TextStyle get shade300 => copyWith(color: color?.withValues(alpha: 0.3));
  TextStyle get shade400 => copyWith(color: color?.withValues(alpha: 0.4));
  TextStyle get shade500 => copyWith(color: color?.withValues(alpha: 0.5));
  TextStyle get shade600 => copyWith(color: color?.withValues(alpha: 0.6));
  TextStyle get shade700 => copyWith(color: color?.withValues(alpha: 0.7));
  TextStyle get shade800 => copyWith(color: color?.withValues(alpha: 0.8));
  TextStyle get shade900 => copyWith(color: color?.withValues(alpha: 0.9));
}
