import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ninjaz_posts_app/presentation/layout/home_layout.dart';
import 'package:ninjaz_posts_app/data/remote/remote_data_source.dart';
import 'presentation/bloc/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const PostsApp());
}

class PostsApp extends StatelessWidget {
  const PostsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
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
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

