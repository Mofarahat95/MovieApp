import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/providers/save_provider.dart';
import 'package:provider/provider.dart';

import 'Ui/HomeScreen/Browse/movieList.dart';
import 'Ui/HomeScreen/Search/Search.dart';
import 'Ui/HomeScreen/homeScreen.dart';
import 'Ui/HomeScreen/homeScreenWidgets/details/detailss.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create:(context) => SaveMovieProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        MovieDetails.routName:(_)=>const MovieDetails(),
        Home.routeName : (_) =>const Home(),
        MovieList.routeName : (_) => const MovieList(),
        Search.routeName:(_)=>const Search(),

      },
      initialRoute: Home.routeName,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1A1A1A),
              onPrimary: Colors.white,
              onSecondary: Colors.black
          ),
          primaryColor: const Color(0xFF1A1A1A),
          secondaryHeaderColor: Colors.black,
          scaffoldBackgroundColor:Colors.transparent ,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Color(0xFFFBAF22),
            unselectedItemColor: Colors.white,
            selectedIconTheme: IconThemeData(
                size: 32),
          ),
          useMaterial3: true
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}