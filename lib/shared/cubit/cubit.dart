
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjaz_posts_app/module/posts_screen/posts_screen.dart';
import 'package:ninjaz_posts_app/module/tab_2/tab_2_screen.dart';
import 'package:ninjaz_posts_app/module/tab_3_screen/tab_3_screen.dart';
import 'package:ninjaz_posts_app/shared/component/constants.dart';
import 'package:ninjaz_posts_app/shared/cubit/posts_states.dart';

import '../network/remote/dio_helper.dart';

class PostsAppCubit extends Cubit<PostsStates>{

  PostsAppCubit(): super (AppInitialState());

  static PostsAppCubit get(context) => BlocProvider.of(context);

  int bottomNavigationCurrentIndex = 0;

  var bottomPostsScreenItems = [
    BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: Constants.postsTab),
    BottomNavigationBarItem(icon: Icon(Icons.looks_two), label: Constants.tab2),
    BottomNavigationBarItem(icon: Icon(Icons.looks_3), label: Constants.tab3),
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

  List<dynamic> postsList = [];

  void getPosts(){
    emit(LoadingDataState());
    DioHelper().getData(url: Constants.postsUrl).then((value) {

      postsList = value.data['data'];
      emit(GetPostsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetPostsErrorState(error.toString()));
    });
  }
  Future<void> getPostsPullToRefresh() async {
    print("pull To refresh");
    postsList.clear();
    emit(PullToRefreshState());

    DioHelper().getData(url: Constants.postsUrl).then((value) {
      postsList = value.data['data'];
      emit(GetPostsSuccessPTRState());
    }).catchError((error){
      print(error.toString());
      emit(GetPostsErrorPTRState(error.toString()));
    });
  }

}