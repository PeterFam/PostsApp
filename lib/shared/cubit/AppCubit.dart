
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjaz_posts_app/module/posts_screen/posts_screen.dart';
import 'package:ninjaz_posts_app/module/tab_2/tab_2_screen.dart';
import 'package:ninjaz_posts_app/module/tab_3_screen/tab_3_screen.dart';
import 'package:ninjaz_posts_app/shared/cubit/PostsState.dart';

class PostsAppCubit extends Cubit<PostsStates>{

  PostsAppCubit(): super (AppInitialState());

  static PostsAppCubit get(context) => BlocProvider.of(context);

  int bottomNavigationCurrentIndex = 0;

  var bottomPostsScreenItems = [
    BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "Posts"),
    BottomNavigationBarItem(icon: Icon(Icons.looks_two), label: "Tab2"),
    BottomNavigationBarItem(icon: Icon(Icons.looks_3), label: "Tab3"),
  ];

  var postsScreenList = [
    PostsScreen(),
    Tab2Screen(),
    Tab3Screen()
  ];

  void changeBottomNavBarIndex(int index){
    bottomNavigationCurrentIndex = index;
    emit(AppBottomNavChangeState());
  }

}