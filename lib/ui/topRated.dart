
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviemania/blocs/bloc.dart';
import 'package:moviemania/models/moviesmodel.dart';

class TopRatedMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    topRatedbloc.fetchTopRatedMovies();
    //upcomingbloc.fetchUpcomingMovies();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Top Rated Movies'),
      ),
      body: StreamBuilder(
        stream: topRatedbloc.allTopRatedMovies,
        builder: (context, AsyncSnapshot<TopRated> snapshot) {
          Widget child = SizedBox();
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done ||
              snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasError) {
              debugPrint('Errooorrr ${snapshot.error.toString()}');
            } else if (snapshot.hasData) {
              debugPrint("Snapshotdata#### ${snapshot.data}");

              var movies = snapshot.data?.results;
//debugPrint("Moviesss....${movies?.results}");
              child =
                  GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: MediaQuery
                              .of(context)
                              .size
                              .width /
                              (MediaQuery
                                  .of(context)
                                  .size
                                  .height),
                          crossAxisCount: 2,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 4),
                      itemCount: movies?.length,
                      itemBuilder: (BuildContext context, int index) {
                        debugPrint("Resultsssssss....${movies?.toString()}");
                        return Card(
                          child: Column(
                            children: [
                              Image.network(
                                "https://image.tmdb.org/t/p/w185${movies![index]
                                    .posterPath}", fit: BoxFit.scaleDown,),
                              Text(movies[index].title!),
                              Text('Rated: ${movies[index].voteCount}')
                            ],
                          ),
                        );
                      });


              // return buildList();
            }
          }

          //debugPrint("Snapshot $snapshot");
          // if (snapshot.hasData) {
          //   return buildList(snapshot);
          // } else if (snapshot.hasError) {
          //   return Text(snapshot.error.toString());
          // }
          //else
          return child;
        },
      ),
    );
  }

}