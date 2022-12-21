import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  final title;
  final genre;
  final imageUri;
  final overview;

  const MovieDetails(
      {required this.overview,
      required this.imageUri,
      required this.title,
      required this.genre,
      Key? key})
      : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.4;
    return Scaffold(
        body: Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w185${widget.imageUri}",
                  ),
                ),
                Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(16.0),
                        width: c_width,
                        child: Column(
                          children:  <Widget>[
                            Text(
                                widget.title,
                                textAlign: TextAlign.left),
                          ],
                        )),

                    // Text(widget.title, style: TextStyle(fontSize: 20),overflow: TextOverflow.ellipsis,),
                    // Text(widget.title, style: TextStyle(fontSize: 20),),
                    // Text(widget.title, style: TextStyle(fontSize: 20),),
                  ],
                  //
                  // Text(widget.title, style: TextStyle(fontSize: 20),),
                  //
                ),
              ],
            ),
            Text(widget.overview),
          ],
        ),
      ),
    ));
  }
}
