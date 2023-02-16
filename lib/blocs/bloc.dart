


import 'package:moviemania/models/moviesmodel.dart';
import 'package:moviemania/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<ItemModel>();


  Stream<ItemModel> get allMovies => _moviesFetcher.stream;


  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();

  }
}

final bloc = MoviesBloc();


class UpcomingBloc{
  final _repository = Repository();
  final _upComingMoviesFetcher= PublishSubject<Upcoming>();

  Stream<Upcoming> get allUpcomingMovies=> _upComingMoviesFetcher.stream;
  fetchUpcomingMovies() async{
    Upcoming upcoming= await _repository.fetchUpcomingMovies();
    _upComingMoviesFetcher.sink.add(upcoming);

  }
  dispose(){
    _upComingMoviesFetcher.close();
  }
}
final upcomingbloc = UpcomingBloc();





class TopRatedMoviesBloc{
  final _repository = Repository();
  final _topRatedMoviesFetcher = PublishSubject<TopRated>();

  Stream<TopRated> get allTopRatedMovies=> _topRatedMoviesFetcher.stream;

  fetchTopRatedMovies() async{
    TopRated topRated = await _repository.fetchTopRatedMovies();
    _topRatedMoviesFetcher.add(topRated);
  }
  dispose(){
    _topRatedMoviesFetcher.close();
  }
}
final topRatedbloc= TopRatedMoviesBloc();