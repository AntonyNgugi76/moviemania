import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

import 'package:moviemania/models/model.dart';


class MovieApiProvider {
  //Client client = Client();
  final base_url = 'https://api.themoviedb.org/3/movie/';
      String keyword="";
      String api_key='api_key=2825be9bc56ebcf10251b98b902493e4';


  Future<ItemModel> fetchPopularMovieList() async {
    print("entered");
    keyword='popular?';
    final response = await http
        .get(Uri.parse(base_url+keyword+api_key));
    print(response.body.toString());
    debugPrint("movies#### $response");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<Upcoming> fetchUpComingMovies() async{
    keyword = 'upcoming?';
    final response = await http.get(Uri.parse(base_url+keyword+api_key));

    var res = jsonDecode(response.body);
    debugPrint("upcoming Movies${response.body}");

    if(response.statusCode==200)
      {
        return Upcoming.fromJson(res);

      }else{
      throw Exception('Failed to Load');
    }
  }
  Future<TopRated> fetchTopRatedMovies() async{
    keyword = 'top_rated?';
    final response = await http.get(Uri.parse(base_url+keyword+api_key));
    var res = jsonDecode(response.body);
    debugPrint("top rated$res");
    if(response.statusCode==200){
      return TopRated.fromJson(res);
    } else{
      throw Exception('Failed to load Movies');
    }
  }
}

