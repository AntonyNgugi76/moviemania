
import 'package:flutter/material.dart';
// import 'package:fteam_authentication_firebase/fteam_authentication_firebase.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviemania/firebase_options.dart';
import 'package:moviemania/ui/auth/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:moviemania/ui/home/TabHome.dart';

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  // startFirebaseDatasource(
  //   ProviderOptions(
  //     appleClientId: 'br.com.example',
  //     appleRedirectUri: Uri.parse('https://exemplo.com'),
  //   ),
  //   firebaseOptions: const FirebaseOption(
  //     appId: '1:326402988845:android:7c78a6cc66509326e951a4',
  //     apiKey: 'AIzaSyBZdyTGdhRbIOAQ4HXn89EoLC4S-k0nR4c',
  //     projectId: 'canvas-griffin-233009',
  //     messagingSenderId: '326402988845',
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.ralewayTextTheme(
        ),
        useMaterial3: true,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.amber,

      ),
      home: SplashFuturePage(),
    );
  }
}

