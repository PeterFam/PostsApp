import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:ninjaz_posts_app/presentation/bloc/posts_events.dart';
import 'package:ninjaz_posts_app/presentation/bloc/posts_states.dart';

import '../../core/handle_error/failure.dart';
import '../../core/utils/constants.dart';
import '../../data/model/post.dart';
import '../../domain/use_case/get_posts_data_usecase.dart';
import '../screens/posts_screen/posts_screen.dart';
import '../screens/tab_2/tab_2_screen.dart';
import '../screens/tab_3_screen/tab_3_screen.dart';

class PostsBloc extends Bloc<PostsEvent, PostsStates>{
  final GetDataUseCase getDataUseCase;
  List<Post> postsList = [];
  bool isLastPage = true;
  bool isLoadMore = false;
  int pageNumber = 0;
  final int nextPageTrigger = 3;

  int bottomNavigationCurrentIndex = 0;
  ScrollController scrollController = ScrollController();
  var bottomPostsScreenItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.newspaper), label: Constants.postsTab),
    const BottomNavigationBarItem(
        icon: Icon(Icons.looks_two), label: Constants.tab2),
    const BottomNavigationBarItem(
        icon: Icon(Icons.looks_3), label: Constants.tab3),
  ];

  var postsScreenList = [
    const PostsScreen2(),
    const Tab2Screen(),
    const Tab3Screen()
  ];
  PostsBloc(this.getDataUseCase) : super(AppInitialState()) {
    scrollController.addListener(() { 
      add(OnLoadMoreData());
    });

    on<OnFetchPostsEvent>((event, emit) async {
      emit(LoadingDataState());
      try {
        final Either<Failure, List<Post>> result =
            await getDataUseCase(pageNumber: pageNumber);
        result.fold((l) {
          emit(GetPostsErrorState());
        }, (postList) {
          isLastPage = postList.length < totalItemsNum;
          pageNumber++;
          postsList.addAll(postList);
          emit(GetPostsSuccessState());
        });
      } catch (e) {
        print("error --> $e");
        emit(GetPostsErrorState());
      }
    });

    on<OnLoadMoreData>((event, emit) async {
      emit(LoadingDataState());
     if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
       isLoadMore = true;
       pageNumber++;
      add(const OnFetchPostsEvent());
     }
    });
    on<OnRefreshData>((event, emit) async {
      emit(LoadingDataState());
      isLoadMore = false;
      pageNumber = 0;
      postsList.clear();
      add(const OnFetchPostsEvent());
    });
    on<ChangeBottomNavScreenEvent>((event, emit) async{
      bottomNavigationCurrentIndex = event.index;
      emit(AppBottomNavChangeState());
    });
  }
}



