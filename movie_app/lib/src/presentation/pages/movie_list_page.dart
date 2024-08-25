import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/presentation/pages/movie_details_page.dart';
import 'package:movie_app/src/presentation/widgets/widgets.dart';
import 'package:movie_app/src/themes/themes.dart';
//import 'package:get_it/get_it.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({
    super.key,
  });

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  @override
  void initState() {
    super.initState();
  }

  void showCustomerEmailExistSnackbar() {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Current Customer Email already exist.'),
      ),
    );
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
            const Padding(
              padding: EdgeInsets.all(2.0),
              child: SearchInput(),
            ),
            const VSpace(16),
            _buildGridView(),
          ],
        ),
      ),
    );
  }

  Column _buildGridView() {
    return Column(
      children: [
        GridView.builder(
          itemCount: 4,
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
              height: 200,
              width: 160,
              heightImage: 160,
              imageProvider: const AssetImage('assets/images/mando.jpg'),
              title: const Text(
                'The Mandalorian',
                style: MovieHubTextStyles.kTitleStrong,
                overflow: TextOverflow.ellipsis,
              ),
              description: const Text(
                'Action/Adventure',
                overflow: TextOverflow.ellipsis,
                style: MovieHubTextStyles.kSubtitle,
              ),
              onTap: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const MovieDetailsPage(),
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
