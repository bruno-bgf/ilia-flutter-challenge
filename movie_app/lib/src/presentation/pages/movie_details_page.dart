import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/src/presentation/widgets/widgets.dart';

import 'package:movie_app/src/themes/themes.dart';

class MovieDetailsPage extends StatefulWidget {
  final VoidCallback? onTap;

  final ScrollController? scrollController;

  const MovieDetailsPage({
    super.key,
    this.onTap,
    this.scrollController,
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
            const _MovieDetailsBackgroundImage(
              backgroundImage: AssetImage('assets/images/mando.jpg'),
            ),
            _MovieDetailsContent(
              onTap: widget.onTap,
            ),
          ],
        ),
      ),
    );
  }
}

class _MovieDetailsContent extends StatelessWidget {
  final VoidCallback? onTap;

  const _MovieDetailsContent({
    Key? key,
    this.onTap,
  }) : super(key: key);

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
            const Text(
              "The Mandalorian",
              style: MovieHubTextStyles.kDetailsTitleStrong,
            ),
            const VSpace(12),
            const Text(
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nullam feugiat, turpis at pulvinar vulputate, erat libero tristique tellus, nec bibendum odio risus sit amet ante. Aliquam erat volutpat. Nunc auctor. Mauris pretium quam et urna. Fusce nibh. Duis risus. Curabitur sagittis hendrerit",
              style: MovieHubTextStyles.kSubtitle,
            ),
            const VSpace(12),
            const Text(
              "Stars: 4/5",
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
      height: 370,
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
              color: MovieHubColors.black,
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
