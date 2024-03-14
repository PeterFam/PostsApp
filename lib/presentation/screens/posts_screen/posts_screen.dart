import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjaz_posts_app/core/component/list_divider.dart';
import 'package:ninjaz_posts_app/core/component/posts_item.dart';
import 'package:ninjaz_posts_app/presentation/bloc/cubit.dart';
import 'package:ninjaz_posts_app/presentation/bloc/posts_states.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsAppCubit, PostsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = PostsAppCubit.get(context).postsList;
        return RefreshIndicator(
          onRefresh: () async => {
            PostsAppCubit.get(context).getPostsPullToRefresh()
          },
          child: ConditionalBuilder(
          condition: list.isNotEmpty,
          builder: (context) => ListView.separated(
            itemCount: list.length,
            itemBuilder: (context, index) => buildPostItem(list[index]),
            separatorBuilder: (context, index) => listDivider(),),
                fallback: (context) => const Center(child: CircularProgressIndicator())),
        );
    });
  }
}
