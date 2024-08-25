import 'package:flutter/material.dart';
import 'package:movie_app/src/themes/movie_hub_colors.dart';

class MovieHubTextStyles {
  static const kScreenTitle = TextStyle(
    fontFamily: 'Gilroy',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: MovieHubColors.white,
    height: 1.5,
  );
  static const kTitleStrong = TextStyle(
    fontFamily: 'Gilroy',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: MovieHubColors.black,
    height: 1.42,
  );
  static const kTitleWhiteStrong = TextStyle(
    fontFamily: 'Gilroy',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: MovieHubColors.white,
    height: 1.42,
  );
  static const kDetailsTitleStrong = TextStyle(
    fontFamily: 'Gilroy',
    fontSize: 25,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: MovieHubColors.black,
    height: 1.42,
  );
  static const kButtonTitleWhite = TextStyle(
    fontFamily: 'Gilroy',
    fontSize: 14,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.7,
    color: MovieHubColors.white,
    overflow: TextOverflow.ellipsis,
    height: 1.5,
  );
  static const kSubtitle = TextStyle(
    fontFamily: 'Gilroy',
    fontSize: 12,
    fontWeight: FontWeight.w800,
    letterSpacing: 0,
    color: MovieHubColors.graniteGray,
    height: 1.25,
  );
  static const kHintText = TextStyle(
    fontFamily: 'Gilroy',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    color: MovieHubColors.graniteGray,
    height: 1.5,
  );
}
