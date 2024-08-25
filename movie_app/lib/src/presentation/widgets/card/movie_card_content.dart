import 'package:flutter/material.dart';

class MovieCardContent extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final Widget? title;
  final Widget? footer;

  const MovieCardContent({
    super.key,
    this.contentPadding,
    this.title,
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: contentPadding ??
          const EdgeInsets.only(
            top: 8,
            bottom: 12,
            left: 8,
            right: 8,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) title!,
                ],
              ),
            ),
          if (footer != null)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: footer!,
            ),
        ],
      ),
    );
  }
}
