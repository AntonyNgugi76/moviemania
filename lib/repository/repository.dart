import 'dart:async';

import 'package:moviemania/models/model.dart';
import 'package:moviemania/services/service.dart';


class Repository {
  final moviesApiProvider = MovieApiProvider();


  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchPopularMovieList();
  Future<Upcoming> fetchUpcomingMovies()=> moviesApiProvider.fetchUpComingMovies();
  Future<TopRated> fetchTopRatedMovies()=>moviesApiProvider.fetchTopRatedMovies();
}