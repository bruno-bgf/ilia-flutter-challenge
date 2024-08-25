import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/src/domain/domain.dart';
import 'package:movie_app/src/presentation/pages/movie_details_page.dart';
import 'package:movie_app/src/presentation/stores/stores.dart';
import 'package:movie_app/src/presentation/widgets/widgets.dart';
import 'package:movie_app/src/themes/themes.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({
    super.key,
  });

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  late final MovieCubit _cubit;
  List<MovieEntity> _movieList = <MovieEntity>[];

  @override
  void initState() {
    _cubit = GetIt.I.get();
    _cubit.init();

    super.initState();
  }

  List<Map<String, dynamic>> toMap(List<MovieEntity> movies) {
    List<Map<String, String>> list;

    list = movies.map((movie) {
      return {
        "name": movie.title ?? '',
      };
    }).toList();

    return list;
  }

  List<MovieEntity> getMovieList(List<MovieEntity> movieList) {
    return movieList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome to the MovieHub!',
          style: MovieHubTextStyles.kScreenTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const VSpace(16),
            SearchBar(
              cubit: _cubit,
              updateMovieList: (changedList) {
                setState(() {
                  _movieList = changedList;
                });
              },
              movieList: _movieList,
              padding: const EdgeInsets.all(
                2,
              ),
            ),
            BlocBuilder<MovieCubit, MovieState>(
              bloc: _cubit,
              builder: (context, state) {
                if (state is MovieLoaded) {
                  List<MovieEntity> movies = getMovieList(
                    state.movieList,
                  );

                  return _buildGridView(movies);
                }
                return const Padding(
                  padding: EdgeInsets.only(top: 64.0),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: MovieHubColors.secondaryPurple,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Column _buildGridView(
    List<MovieEntity> movies,
  ) {
    return Column(
      children: [
        const VSpace(16),
        GridView.builder(
          itemCount: movies.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.85,
            mainAxisSpacing: 30.0,
          ),
          itemBuilder: (_, index) => Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: MovieCard(
              height: 170,
              width: 160,
              heightImage: 180,
              imageProvider: NetworkImage(
                "https://image.tmdb.org/t/p/original${movies[index].posterPath ?? ''}",
              ),
              title: Text(
                movies[index].title ?? '',
                style: MovieHubTextStyles.kTitleStrong,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => MovieDetailsPage(
                      movie: movies[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  final MovieCubit cubit;
  final List<MovieEntity> movieList;
  final Function(List<MovieEntity>) updateMovieList;
  final EdgeInsets padding;

  const SearchBar({
    super.key,
    required this.cubit,
    required this.movieList,
    required this.updateMovieList,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<MovieCubit, MovieState>(
      bloc: cubit,
      listener: (context, state) {
        if (state is MovieLoaded && movieList.isEmpty) {
          updateMovieList(state.movieList);
        }
        if (state is MovieListChanged) {
          updateMovieList(state.movieList);
        }
      },
      child: Padding(
        padding: padding,
        child: InputSearch(
          onQueryChanged: (value) {
            cubit.filter(movieList, value);
          },
        ),
      ),
    );
  }
}
