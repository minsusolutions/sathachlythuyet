import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class Font {
  static const montserrat = 'Montserrat';
}

///Styles used for Text around the app
const activityLikes = TextStyle(
  color: MyColors.grey,
  fontWeight: FontWeight.w700,
  fontSize: 13,
);

const activityDate = TextStyle(
  color: MyColors.black,
  fontWeight: FontWeight.w600,
  fontSize: 11,
);

const userCardPoints = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 20,
);

///System styles
const kStatusBarLight = SystemUiOverlayStyle(
  statusBarIconBrightness: Brightness.dark,
  statusBarBrightness: Brightness.dark,
);
const kStatusBarDark = SystemUiOverlayStyle(
  statusBarIconBrightness: Brightness.light,
  statusBarBrightness: Brightness.light,
);
