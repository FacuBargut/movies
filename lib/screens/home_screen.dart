import 'package:flutter/material.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:movies/search/search_delegate.dart';
import 'package:movies/widgets/widgets.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {

  
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      
      appBar: AppBar(
        title: Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () => showSearch(
              context: context,
              delegate: MovieSearchDelegate()
            )
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          //Tarjetas principales
          CardSwiper(movies: moviesProvider.onDisplayMovies),
          //Slider de peliculas
          MovieSlider(
            title: 'Populares',
            popularMovies: moviesProvider.onPopularMovies,
            onNextPage: () => moviesProvider.getOnPopularMovies()
            ),
          //Listado horizontal de peliculas
        ],
      ),
      )
    );
  }
}