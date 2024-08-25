import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/src/domain/domain.dart';
import 'package:movie_app/src/presentation/widgets/widgets.dart';

import 'package:movie_app/src/themes/themes.dart';

class MovieDetailsPage extends StatefulWidget {
  final VoidCallback? onTap;

  final ScrollController? scrollController;
  final MovieEntity movie;

  const MovieDetailsPage({
    super.key,
    this.onTap,
    this.scrollController,
    required this.movie,
  });

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MovieHubColors.cultured,
        child: Column(
          children: [
            _MovieDetailsBackgroundImage(
              backgroundImage: NetworkImage(
                "https://image.tmdb.org/t/p/original${widget.movie.backdropPath ?? ''}",
              ),
            ),
            _MovieDetailsContent(
              onTap: widget.onTap,
              movie: widget.movie,
            ),
          ],
        ),
      ),
    );
  }
}

class _MovieDetailsContent extends StatelessWidget {
  final VoidCallback? onTap;
  final MovieEntity movie;

  const _MovieDetailsContent({
    this.onTap,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              movie.title ?? '',
              style: MovieHubTextStyles.kDetailsTitleStrong,
            ),
            const VSpace(12),
            Text(
              movie.overview ?? '',
              style: MovieHubTextStyles.kSubtitle,
            ),
            const VSpace(12),
            Text(
              "Average Rating: ${movie.voteAverage}",
              style: MovieHubTextStyles.kTitleStrong,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ActionButton(
                        onTap: () {},
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MovieDetailsBackgroundImage extends StatelessWidget {
  final ImageProvider backgroundImage;

  const _MovieDetailsBackgroundImage({
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Stack(
        children: [
          Image(
            fit: BoxFit.fill,
            image: backgroundImage,
          ),
          Positioned(
            top: 50,
            left: 10,
            child: IconButton.outlined(
              color: MovieHubColors.white,
              icon: const Icon(
                Icons.chevron_left,
                size: 40,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.02,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
