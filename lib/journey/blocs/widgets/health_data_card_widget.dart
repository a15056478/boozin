import 'package:boozin/miscellaneous/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../miscellaneous/hex_color.dart';
import '../../../miscellaneous/text-style.dart';

class HeathDataCardWidget extends StatelessWidget {
  const HeathDataCardWidget({
    super.key,
    required this.width,
    required this.value,
    required this.imgPath,
    required this.goalValue,
    required this.headerText,
  });

  final double width;
  final double value;
  final String imgPath;
  final double goalValue;
  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.w),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: HexColor(
            context.isDarkMode ? HexColors.darkGrey : HexColors.lightGrey,
          ),
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: 24.h, bottom: 24.h, left: 17.w, right: 35.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        text: '$headerText: ',
                        style: context.isDarkMode
                            ? ThemeText.s16w400White
                            : ThemeText.s16w400Black,
                        children: [
                          TextSpan(
                              text: '${value.toInt()}',
                              style: context.isDarkMode
                                  ? ThemeText.s16w600White
                                  : ThemeText.s16w600Black)
                        ]),
                  ),
                  SizedBox(
                    width: width * 0.6,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 16.h,
                                bottom: 8.h,
                              ),
                              child: LinearPercentIndicator(
                                padding: EdgeInsets.zero,
                                width: width * 0.6,
                                alignment: MainAxisAlignment.start,
                                animation: true,
                                animationDuration: 1000,
                                lineHeight: 16.h,
                                percent: (value / goalValue) > 1
                                    ? 1
                                    : (value / goalValue),
                                center: const Text(
                                  "",
                                ),
                                barRadius: Radius.circular(13.r),
                                backgroundColor: HexColor(context.isDarkMode
                                    ? HexColors.indicatorBackgroundDarkMode
                                    : HexColors.indicatorBackgroundLightMode),
                                progressColor: HexColor(context.isDarkMode
                                    ? HexColors.indicatorHighlightDarkMode
                                    : HexColors.indicatorHighlightLightMode),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '0',
                                style: context.isDarkMode
                                    ? ThemeText.s10w500White
                                    : ThemeText.s10w500Black,
                              ),
                              Text(
                                'Goal: ${goalValue.toInt()}',
                                style: context.isDarkMode
                                    ? ThemeText.s10w500White
                                    : ThemeText.s10w500Black,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Image.asset(
                imgPath,
                width: 52.w,
                fit: BoxFit.fitWidth,
              )
            ],
          ),
        ),
      ),
    );
  }
}
