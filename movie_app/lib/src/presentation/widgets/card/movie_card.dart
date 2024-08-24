// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:movie_app/src/presentation/widgets/card/movie_card_content.dart';
import 'package:movie_app/src/themes/movie_hub_colors.dart';

class MovieCard extends StatelessWidget {
  final double? width;
  final double? height;
  final double? heightImage;
  final double borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final ImageProvider imageProvider;
  final Color color;
  final Widget? title;
  final Widget? description;
  final void Function()? onTap;

  const MovieCard({
    super.key,
    this.width,
    this.height,
    this.heightImage,
    this.borderRadius = 12,
    this.contentPadding,
    required this.imageProvider,
    this.color = MovieHubColors.white,
    this.title,
    this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      splashColor: MovieHubColors.graniteGray,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: color.withOpacity(0.90),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                offset: const Offset(3, 3),
                color: MovieHubColors.graniteGray.withAlpha(50),
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              ),
              child: Image(
                image: imageProvider,
                width: width,
                height: heightImage,
                fit: BoxFit.fill,
              ),
            ),
            MovieCardContent(
              contentPadding: contentPadding,
              title: title,
              description: description,
            ),
          ],
        ),
      ),
    );
  }
}
