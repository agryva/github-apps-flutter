

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Helpers {

  static getWidthPageSize(BuildContext context) => MediaQuery.of(context).size.width;

  static getHeightPageSize(BuildContext context) => MediaQuery.of(context).size.height;

  static String dateFormatFromTimestampZFAndFormat(String date, String format) {
    try {
      final df = DateFormat("yyyy-MM-dd'T'HH:mm:ss", "en");
      final parseDate = df.parse(date);
      return DateFormat(format, "en").format(parseDate);
    } catch(e) {
      print(e);
      final df = DateFormat("yyyy-MM-dd'T'HH:mm:ss", "en");
      final parseDate = df.parse(date);
      return DateFormat(format, "en").format(parseDate);
    }

  }

  static showSnackBar(BuildContext context, {
    required SnackBarMode snackBarMode,
    required String content,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        content,
        style: GoogleFonts.inter(
            color: snackBarMode == SnackBarMode.SUCCESS ? const Color(0xff22AA5F) : const Color(0xffB61616)
        ),
      ),
      backgroundColor: snackBarMode == SnackBarMode.SUCCESS ? const Color(0xffAAEEC9) : const Color(0xffFFB7B7),
      behavior: SnackBarBehavior.floating,
      elevation: 0.2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9)
      ) ,
    ));
  }

}


enum SnackBarMode {
  ERROR,
  SUCCESS
}