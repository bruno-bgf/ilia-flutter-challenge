import 'package:flutter/material.dart';
import 'package:movie_app/src/themes/movie_hub_colors.dart';
import 'package:movie_app/src/themes/themes.dart';

class SearchInput extends StatefulWidget {
  final Function(String)? onQueryChanged;
  final TextEditingController? controller;
  const SearchInput({
    super.key,
    this.onQueryChanged,
    this.controller,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  void _onQueryChanged(String query) {
    setState(() {
      widget.onQueryChanged?.call(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 25,
        right: 25,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: TextField(
                  onChanged: _onQueryChanged,
                  controller: widget.controller,
                  cursorColor: MovieHubColors.graniteGray,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusColor: MovieHubColors.primaryPurple,
                    hintText: 'Search movies',
                    hintStyle: MovieHubTextStyles.kHintText,
                    suffixIcon: const Icon(
                      Icons.search,
                    ),
                    suffixIconColor: MovieHubColors.black,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
