import 'package:boozin/miscellaneous/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class ThemeText {
  static TextStyle s32w700Black = TextStyle(
    fontFamily: 'Nunito',
    color: HexColor(
      HexColors.textBlack,
    ),
    fontSize: 32.sp,
    height: 1.6,
    fontWeight: FontWeight.w700,
  );

  static TextStyle s16w600Black = TextStyle(
    fontFamily: 'Nunito',
    color: HexColor(
      HexColors.textBlack,
    ),
    fontSize: 16.sp,
    height: 1.6,
    fontWeight: FontWeight.w600,
  );

  static TextStyle s16w400Black = TextStyle(
    fontFamily: 'Nunito',
    color: HexColor(
      HexColors.textBlack,
    ),
    fontSize: 16.sp,
    height: 1.6,
    fontWeight: FontWeight.w400,
  );

  static TextStyle s10w500Black = TextStyle(
    fontFamily: 'Nunito',
    color: HexColor(
      HexColors.textBlack,
    ),
    fontSize: 10.sp,
    height: 1.6,
    fontWeight: FontWeight.w500,
  );

  static TextStyle s32w700White = TextStyle(
    fontFamily: 'Nunito',
    color: HexColor(
      HexColors.textWhite,
    ),
    fontSize: 32.sp,
    height: 1.6,
    fontWeight: FontWeight.w700,
  );

  static TextStyle s16w600White = TextStyle(
    fontFamily: 'Nunito',
    color: HexColor(
      HexColors.textWhite,
    ),
    fontSize: 16.sp,
    height: 1.6,
    fontWeight: FontWeight.w600,
  );

  static TextStyle s16w400White = TextStyle(
    fontFamily: 'Nunito',
    color: HexColor(
      HexColors.textWhite,
    ),
    fontSize: 16.sp,
    height: 1.6,
    fontWeight: FontWeight.w400,
  );

  static TextStyle s10w500White = TextStyle(
    fontFamily: 'Nunito',
    color: HexColor(
      HexColors.textWhite,
    ),
    fontSize: 10.sp,
    height: 1.6,
    fontWeight: FontWeight.w500,
  );
}
