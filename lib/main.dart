import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ninjaz_posts_app/presentation/layout/home_layout.dart';
import 'di/service_locator.dart';
import 'presentation/bloc/bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppServiceLocator.initAppServiceLocator();
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

