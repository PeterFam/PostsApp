import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjaz_posts_app/core/component/constants.dart';
import 'package:ninjaz_posts_app/presentation/screens/posts_screen/posts_screen.dart';
import 'package:ninjaz_posts_app/presentation/screens/tab_2/tab_2_screen.dart';
import 'package:ninjaz_posts_app/presentation/screens/tab_3_screen/tab_3_screen.dart';
import 'package:ninjaz_posts_app/presentation/bloc/posts_states.dart';

import '../../data/model/post.dart';
import '../../data/remote/remote_data_source.dart';

class PostsAppCubit extends Cubit<PostsStates> {
  PostsAppCubit() : super(AppInitialState());

  static PostsAppCubit get(context) => BlocProvider.of(context);

  int bottomNavigationCurrentIndex = 0;

  var bottomPostsScreenItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.newspaper), label: Constants.postsTab),
    const BottomNavigationBarItem(
        icon: Icon(Icons.looks_two), label: Constants.tab2),
    const BottomNavigationBarItem(
        icon: Icon(Icons.looks_3), label: Constants.tab3),
  ];

  var postsScreenList = [
    const PostsScreen(),
    const Tab2Screen(),
    const Tab3Screen()
  ];

  void changeBottomNavBarIndex(int index) {
    bottomNavigationCurrentIndex = index;
    emit(AppBottomNavChangeState());
  }

  List<Post> postsList = [];

  void getPosts() {
    emit(LoadingDataState());
    RemoteDataImpl().getData(pageNumber: 2).then((value) {
      postsList = value;
      emit(GetPostsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetPostsErrorState(error.toString()));
    });
  }

  Future<void> getPostsPullToRefresh() async {
    postsList.clear();
    emit(PullToRefreshState());

    RemoteDataImpl().getData(pageNumber: 2).then((value) {
      postsList = value;
      emit(GetPostsSuccessPTRState());
    }).catchError((error) {
      print(error.toString());
      emit(GetPostsErrorPTRState(error.toString()));
    });
  }
}
