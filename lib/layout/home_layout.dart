import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjaz_posts_app/shared/cubit/cubit.dart';
import 'package:ninjaz_posts_app/shared/cubit/posts_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => PostsAppCubit()..getPosts(),
      child: BlocConsumer<PostsAppCubit, PostsStates>(
        listener: (BuildContext context, PostsStates state){

        },
        builder: (BuildContext context, PostsStates state){
          var cubit = PostsAppCubit.get(context);
          return Scaffold(
            appBar: AppBar(title:const Text('Posts', style: TextStyle(color: Colors.amber),),),
            body: cubit.postsScreenList[cubit.bottomNavigationCurrentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.bottomNavigationCurrentIndex,
              items: cubit.bottomPostsScreenItems,
              onTap: (index){
                cubit.changeBottomNavBarIndex(index);
              },
            ),
          );
        },
      ),
      );
  }
}
