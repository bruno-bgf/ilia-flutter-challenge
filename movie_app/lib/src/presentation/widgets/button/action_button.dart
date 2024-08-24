import 'package:flutter/material.dart';
import 'package:movie_app/src/themes/themes.dart';

class ActionButton extends StatelessWidget {
  final void Function()? onTap;

  const ActionButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: FloatingActionButton.extended(
        label: const Text(
          'Watch the trailer',
          style: MovieHubTextStyles.kButtonTitleWhite,
        ),
        backgroundColor: MovieHubColors.primaryPurple,
        icon: const Icon(
          Icons.play_circle_outline_outlined,
          size: 24.0,
          color: MovieHubColors.white,
        ),
        onPressed: onTap,
      ),
    );
  }
}
