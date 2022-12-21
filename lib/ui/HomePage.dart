import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:moviemania/blocs/bloc.dart';
import 'package:moviemania/models/model.dart';
import 'package:moviemania/ui/Moiedetails.dart';
import 'package:moviemania/ui/moviewlist.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late PersistentTabController _controller;
  // static final List<dynamic> _listwidgets = [
  //   HomePage(),
  //   Get.to(()=>MovieList()),
  //   Get.to(()=>TopRated()),
  //   Get.to(()=>Upcoming()),// Text(
  //
  // ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _controller = PersistentTabController(initialIndex: 0);
    bloc.fetchAllMovies();
    upcomingbloc.fetchUpcomingMovies();
    topRatedbloc.fetchTopRatedMovies();
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.amber,
      //   title: Text('Movie Mania'),
      // ),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Icon(
                              CupertinoIcons.bars, size: 50,
                            ),
                          //   Image.asset(
                          //   "assets/icons/menuicon.png",
                          //   height: 50,
                          // ),
                            onTap: (){
                              Drawer;
                            },
                          ),
                        Icon(CupertinoIcons.person_alt_circle, size: 50,)
                        //   Image.asset(
                        //     "assets/icons/iconuser.png",
                        //     height: 50,
                        //   ),
                         ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: SizedBox(
                        height: 230,
                        child: ImageSlideshow(
                          initialPage: 0,
                          indicatorColor: Colors.black,
                          width: double.infinity,
                          height: 230,
                          autoPlayInterval: 3000,
                          isLoop: true,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                "assets/images/men.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset("assets/images/oneway.jpg",
                                  fit: BoxFit.cover),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset("assets/images/wakanda.jpg",
                                  fit: BoxFit.cover),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Text(
                    //   'Movie Time',
                    //   textAlign: TextAlign.start,
                    //   style: TextStyle(fontSize: 55),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: const Text(
                            'Popular Movies',
                            style: TextStyle(fontSize: 18),
                          ),
                          onTap: () {
                            Get.to(() => MovieList());
                          },
                        ),
                        InkWell(
                          child: const Text(
                            'View More >',
                            style: TextStyle(fontSize: 15, color: Colors.amber),
                          ),
                          onTap: () {
                            Get.to(() => MovieList());
                          },
                        ),
                      ],
                    ),
                    Card(
                      elevation: 0,
                      child: SizedBox(
                        height: 190,
                        child: StreamBuilder(
                          stream: bloc.allMovies,
                          builder: (BuildContext context,
                              AsyncSnapshot<ItemModel> snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.active ||
                                snapshot.connectionState ==
                                    ConnectionState.done) {
                              if (snapshot.hasData) {
                                var movies = snapshot.data?.results;

                                return ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: movies?.length,
                                    itemBuilder:
                                        (BuildContext contect, int index) {
                                      return Padding(
                                          padding: const EdgeInsets.all(3),
                                          child: InkWell(
                                              onTap: () {
                                                Get.to(() => MovieDetails(
                                                      imageUri: movies[index]
                                                          .posterPath,
                                                      title:
                                                          movies[index].title,
                                                      genre: movies[index]
                                                          .genreIds,
                                                      overview: movies[index]
                                                          .overview,
                                                    ));
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: Column(
                                                  children: [
                                                    Image.network(
                                                      "https://image.tmdb.org/t/p/w185${movies![index].posterPath!}",
                                                      fit: BoxFit.cover,
                                                      height: 170,
                                                    ),
                                                    // Text(movies[index].title!)
                                                  ],
                                                ),
                                              )));
                                    });
                              }
                            }
                            return const SizedBox();
                          },
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: const Text(
                            'Top Rated Movies',
                            style: TextStyle(fontSize: 18, fontFamily: 'Jost'),
                          ),
                          onTap: () {
                            Get.to(() => TopRated());
                          },
                        ),
                        InkWell(
                          child: const Text(
                            'View More >',
                            style: TextStyle(fontSize: 15, color: Colors.amber),
                          ),
                          onTap: () {
                            Get.to(() => MovieList());
                          },
                        ),
                      ],
                    ),
                    Card(
                      elevation: 0,
                      child: SizedBox(
                        height: 190,
                        child: StreamBuilder(
                          stream: topRatedbloc.allTopRatedMovies,
                          builder: (BuildContext context,
                              AsyncSnapshot<TopRated> snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.active ||
                                snapshot.connectionState ==
                                    ConnectionState.done) {
                              if (snapshot.hasData) {
                                var movies = snapshot.data?.results;

                                return ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: movies?.length,
                                    itemBuilder:
                                        (BuildContext contect, int index) {
                                      return Padding(
                                          padding: const EdgeInsets.all(3),
                                          child: InkWell(
                                              onTap: () {
                                                Get.to(() => MovieDetails(
                                                      imageUri: movies[index]
                                                          .posterPath,
                                                      title:
                                                          movies[index].title,
                                                      genre: movies[index]
                                                          .genreIds,
                                                      overview: movies[index]
                                                          .overview,
                                                    ));
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(15)),
                                                child: Column(
                                                  children: [
                                                    Image.network(
                                                      "https://image.tmdb.org/t/p/w185${movies![index].posterPath!}",
                                                      fit: BoxFit.cover,
                                                      height: 170,
                                                    ),
                                                    // Text(movies[index].title!)
                                                  ],
                                                ),
                                              )));
                                    });
                              }
                            }
                            return const SizedBox();
                          },
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: const Text(
                            'Upcoming Movies',
                            style: TextStyle(fontSize: 18),
                          ),
                          onTap: () {
                            Get.to(() => MovieList());
                          },
                        ),
                        InkWell(
                          child: const Text(
                            'View More >',
                            style: TextStyle(fontSize: 15, color: Colors.amber),
                          ),
                          onTap: () {
                            Get.to(() => Upcoming());
                          },
                        ),
                      ],
                    ),
                    Card(
                      elevation: 0,
                      child: Container(
                        height: 190,
                        child: StreamBuilder(
                          stream: upcomingbloc.allUpcomingMovies,
                          builder: (BuildContext context,
                              AsyncSnapshot<Upcoming> snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.active ||
                                snapshot.connectionState ==
                                    ConnectionState.done) {
                              if (snapshot.hasData) {
                                var movies = snapshot.data?.results;

                                return ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: movies?.length,
                                    itemBuilder:
                                        (BuildContext contect, int index) {
                                      return Padding(
                                          padding: const EdgeInsets.all(3),
                                          child: InkWell(
                                              onTap: () {
                                                Get.to(() => MovieDetails(
                                                    overview:
                                                        movies[index].overview,
                                                    imageUri: movies[index]
                                                        .posterPath,
                                                    title: movies[index].title,
                                                    genre: movies[index]
                                                        .genreIds));
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(15)),
                                                child: Column(
                                                  children: [
                                                    Image.network(
                                                      "https://image.tmdb.org/t/p/w185${movies![index].posterPath!}",
                                                      fit: BoxFit.cover,
                                                      height: 170,
                                                    ),
                                                    // Text(movies[index].title!)
                                                  ],
                                                ),
                                              )));
                                    });
                              }
                            }
                            return const SizedBox();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // _listwidgets.elementAt(_selectedIndex),
            // BottomNavigationBar(
            //   // backgroundColor: Colors.amber,
            //   items: <BottomNavigationBarItem>[
            //     BottomNavigationBarItem(
            //         icon: Lottie.asset('assets/lottie/popular.json',
            //             height: 50, reverse: true),
            //         label: 'Popular',),
            //     BottomNavigationBarItem(
            //         icon: Lottie.asset('assets/lottie/popular.json',
            //             height: 50, reverse: true),
            //         label: 'Popular'),
            //     BottomNavigationBarItem(
            //         icon: Lottie.asset('assets/lottie/top.json',
            //             height: 50, reverse: true),
            //         label: 'Top'),
            //     BottomNavigationBarItem(
            //         icon: Lottie.asset('assets/lottie/upcoming.json',
            //             height: 50, reverse: true),
            //         label: 'Upcoming')
            //   ],
            //   currentIndex: _selectedIndex,
            //   onTap: onItemTapped,
            // ),
        //  ])),
      // drawer: Container(
      //   width: MediaQuery.of(context).size.width * 0.7,
      //   child: Drawer(
      //       child: ListView(
      //     padding: const EdgeInsets.all(0),
      //         children: [
      //           const DrawerHeader(
      //             decoration: BoxDecoration(
      //               color: Colors.amber,
      //             ),
      //             child: Text('Drawer Header'),
      //           ),
      //           ListTile(
      //             leading: Icon(
      //               Icons.home,
      //             ),
      //             title: const Text('Page 1'),
      //             onTap: () {
      //               Navigator.pop(context);
      //             },
      //           ),
      //           ListTile(
      //             leading: Icon(
      //               Icons.train,
      //             ),
      //             title: const Text('Page 2'),
      //             onTap: () {
      //               Navigator.pop(context);
      //             },
      //           ),
      //         ],
      //   )),
      // )
    );
  }
}

class Drawer extends StatefulWidget {
  const Drawer({Key? key, required child}) : super(key: key);

  @override
  State<Drawer> createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
          child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: const Text('Page 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.train,
            ),
            title: const Text('Page 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      )),
    ));
    //);
  }
}
