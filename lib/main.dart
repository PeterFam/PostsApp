import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ninjaz_posts_app/layout/home_layout.dart';
import 'shared/AppBlocObserver.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(PostsApp());
}

class PostsApp extends StatelessWidget {
  const PostsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.amber
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.deepPurpleAccent
          ),
          elevation: 0.0
        )
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

