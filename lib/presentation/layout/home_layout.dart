import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjaz_posts_app/di/service_locator.dart';
import 'package:ninjaz_posts_app/presentation/bloc/posts_bloc.dart';
import 'package:ninjaz_posts_app/presentation/bloc/posts_events.dart';
import 'package:ninjaz_posts_app/presentation/bloc/posts_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          appServiceLocator<PostsBloc>()..add(const OnFetchPostsEvent()),
      child: BlocConsumer<PostsBloc, PostsStates>(
        listener: (BuildContext context, PostsStates state) {},
        builder: (BuildContext context, PostsStates state) {
          var cubit = context.read<PostsBloc>();
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Ninjaz Posts',
                style: TextStyle(color: Colors.amber),
              ),
            ),
            body: cubit.postsScreenList[cubit.bottomNavigationCurrentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.bottomNavigationCurrentIndex,
              items: cubit.bottomPostsScreenItems,
              onTap: (index) {
               cubit.add(ChangeBottomNavScreenEvent(index: index));
              },
            ),
          );
        },
      ),
    );
  }
}
