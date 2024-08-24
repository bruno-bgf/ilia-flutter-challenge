import 'package:flutter/material.dart';
import 'package:movie_app/src/presentation/widgets/button/action_button.dart';
import 'package:movie_app/src/presentation/widgets/card/movie_card.dart';
import 'package:movie_app/src/presentation/widgets/input/input_search.dart';
import 'package:movie_app/src/themes/movie_hub_colors.dart';
import 'package:movie_app/src/themes/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SearchInput(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MovieCard(
                  height: 220,
                  width: 160,
                  heightImage: 150,
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
                  onTap: () {},
                ),
                MovieCard(
                  height: 220,
                  width: 160,
                  heightImage: 150,
                  imageProvider: const AssetImage('assets/images/mando.jpg'),
                  title: const Text('Title'),
                  description: const Text('this is a description'),
                  onTap: () {},
                ),
              ],
            ),
            ActionButton(
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
