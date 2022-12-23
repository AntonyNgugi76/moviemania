import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:moviemania/blocs/bloc.dart';
import 'package:moviemania/models/model.dart';
import 'package:moviemania/ui/DynamicMovieDetails.dart';
import 'package:moviemania/ui/home/TabHome.dart';
import 'package:moviemania/ui/PopularMovies.dart';
import 'package:moviemania/utils/stykes.dart';
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
    final _advancedDrawerController = AdvancedDrawerController();
    TextEditingController textController = TextEditingController();
    bloc.fetchAllMovies();
    upcomingbloc.fetchUpcomingMovies();
    topRatedbloc.fetchTopRatedMovies();
    return AdvancedDrawer(
      backdropColor: Colors.black,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        //Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.amber,
            child: Column(
              mainAxisSize: MainAxisSize.max,

              children: [
                Container(
                  width: 128.0,
                  height: 128.0,

                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    CupertinoIcons.person_alt_circle,

                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.to(() => TabHome());
                  },
                  leading: Icon(Icons.home),
                  title: Text('Home',
                      style: GoogleFonts.raleway(textStyle: TextStyle())),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.account_circle_rounded),
                  title: Text('Profile',
                    style: GoogleFonts.raleway(textStyle: TextStyle()),),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.favorite),
                  title: Text('Favourite Movies',
                      style: GoogleFonts.raleway(textStyle: TextStyle())),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.settings),
                  title: Text('Settings',
                      style: GoogleFonts.raleway(textStyle: TextStyle())),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy',
                      style: GoogleFonts.raleway(textStyle: TextStyle()),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
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
                          child: const Icon(
                            CupertinoIcons.bars,
                            size: 50,
                          ),
                          onTap: () {
                            _advancedDrawerController.showDrawer();
                          }


                      ),
                      // Container(
                      //   height: 50,
                      //child:
                      // TextField(
                      //   decoration: InputDecoration(
                      //     label: Text('Search Movie'),
                      //   ),
                      // ),
                      // ),
                      AnimSearchBar(
                        style: GoogleFonts.raleway(),
                        width: 250,
                        textController: textController,
                        onSuffixTap: () {
                          setState(() {
                            textController.clear();
                          });
                        }, onSubmitted: (String) {},
                      ),
                      //
                      // Icon(
                      //   CupertinoIcons.search_circle,
                      //   size: 50,
                      // )
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
                      child: Text(
                        'Popular Movies',
                        style: GoogleFonts.raleway(
                          textStyle: TextStyle(color: Colors.black,
                              fontSize: 18,
                              letterSpacing: .5),
                        ),
                        //TextStyle(fontSize: 18,fontFamily:  ),
                      ),
                      onTap: () {
                        Get.to(() => MovieList());
                      },
                    ),
                    InkWell(
                      child: Text(
                        'View More >',
                        style: GoogleFonts.raleway(
                          textStyle: TextStyle(fontSize: 15,
                              color: Colors.amber),
                        ),),
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
                          const Center(child:  CircularProgressIndicator());
                          if (snapshot.hasData) {
                            var movies = snapshot.data?.results;

                            return ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: movies?.length,
                                itemBuilder: (BuildContext contect,
                                    int index) {
                                  return Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: InkWell(
                                          onTap: () {
                                            Get.to(() =>
                                                MovieDetails(
                                                  imageUri:
                                                  movies[index].posterPath,
                                                  title: movies[index].title,
                                                  genre: movies[index]
                                                      .genreIds,
                                                  overview:
                                                  movies[index].overview,
                                                ));
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.only(topRight: Radius.circular(15.0)),
                                            child: Column(
                                              children: [
                                                Image.network(
                                                  "https://image.tmdb.org/t/p/w185${movies![index]
                                                      .posterPath!}",
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
                      child: Text(
                        'Top Rated Movies',
                        style: GoogleFonts.raleway(textStyle: TextStyle(
                            fontSize: 18, fontFamily: 'Jost'),
                        ),),
                      onTap: () {
                        Get.to(() => TopRated());
                      },
                    ),
                    InkWell(
                      child: Text(
                        'View More >',
                        style: GoogleFonts.raleway(textStyle: TextStyle(
                            fontSize: 15, color: Colors.amber),
                        ),),
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
                           const Center(child:  CircularProgressIndicator());
                           if (snapshot.hasData) {
                            var movies = snapshot.data?.results;

                            return ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: movies?.length,
                                itemBuilder: (BuildContext context,
                                    int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(() =>
                                            MovieDetails(
                                              imageUri:
                                              movies![index].posterPath,
                                              title: movies[index].title,
                                              genre: movies[index]
                                                  .genreIds,
                                              overview:
                                              movies[index]?.overview,
                                            ));
                                      },
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                         // topRight: Radius.circular(25.0),
                                          bottomRight: Radius.circular(10.0),),
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          heightFactor: 1,
                                          //widthFactor: 0.5,
                                        child: Column(
                                        children: [
                                        Image.network(
                                      "https://image.tmdb.org/t/p/w185${movies![index]
                                          .posterPath!}",
                                        fit: BoxFit.cover,
                                        height: 170,
                                      ),
                                      // Text(movies[index].title!)
                                      ],
                                    ),
                                  ))));
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
                      child: Text(
                          'Upcoming Movies',
                          style: GoogleFonts.raleway(textStyle: TextStyle(
                              fontSize: 18
                          ))
                      ),
                      onTap: () {
                        Get.to(() => MovieList());
                      },
                    ),
                    InkWell(
                      child: Text(
                        'View More >',
                        style: GoogleFonts.raleway(textStyle: TextStyle(
                            fontSize: 15, color: Colors.amber),
                        ),),
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
                                itemBuilder: (BuildContext contect,
                                    int index) {
                                  return Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: InkWell(
                                          onTap: () {
                                            Get.to(() =>
                                                MovieDetails(
                                                    overview: movies[index]
                                                        .overview,
                                                    imageUri:
                                                    movies[index].posterPath,
                                                    title: movies[index]
                                                        .title,
                                                    genre: movies[index]
                                                        .genreIds));
                                          },
                                          child: ClipRRect(
                                            borderRadius:  BorderRadius
                                                .only(topRight: Radius.circular(15)),
                                            child: Column(
                                              children: [
                                                Image.network(
                                                  "https://image.tmdb.org/t/p/w185${movies![index]
                                                      .posterPath!}",
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
      ),
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
          width: MediaQuery
              .of(context)
              .size
              .width * 0.7,
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
