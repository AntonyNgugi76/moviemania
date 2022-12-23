import 'dart:async';

import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:moviemania/ui/home/TabHome.dart';

class SplashFuturePage extends StatefulWidget {
  SplashFuturePage({Key? key}) : super(key: key);

  @override
  _SplashFuturePageState createState() => _SplashFuturePageState();
}

class _SplashFuturePageState extends State<SplashFuturePage> {
  Future<Widget> futureCall() async {
    // do async operation ( api call, auto login)
    return Future.value(new TabHome());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(backgroundColor: Colors.white,),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          SizedBox(
            height: 150,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Movie Mania',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Lottie.asset('assets/lottie/ej.json'),
          ),
          const Text(
            "It's Movie Time",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
              const SizedBox(
                height: 80,
              ),
              FloatingActionButton(clipBehavior: Clip.none,
                  child: Icon(CupertinoIcons.arrow_right),
                  onPressed: (){
                Get.to(()=>TabHome());

              })
        ]));
    // return EasySplashScreen(
    //   logo: Lottie.asset('assets/lottie/splbg'),
    //   title: Text(
    //     "Title",
    //     style: TextStyle(
    //       fontSize: 18,
    //       fontWeight: FontWeight.bold,
    //     ),
    //   ),
    //   backgroundColor: Colors.grey.shade400,
    //   showLoader: true,
    //   loadingText: Text("Loading..."),
    //   futureNavigator: futureCall(),
    // );
  }
}
