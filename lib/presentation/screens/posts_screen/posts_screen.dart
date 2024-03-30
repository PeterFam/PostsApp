
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjaz_posts_app/core/widgets/error_dialog.dart';
import 'package:ninjaz_posts_app/core/widgets/posts_item.dart';
import 'package:ninjaz_posts_app/presentation/bloc/posts_bloc.dart';
import 'package:ninjaz_posts_app/presentation/bloc/posts_events.dart';
import 'package:ninjaz_posts_app/presentation/bloc/posts_states.dart';

import '../../../core/widgets/list_divider.dart';
import '../../../data/model/post.dart';

class PostsScreen2 extends StatelessWidget {
  const PostsScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<PostsBloc>();
    return BlocBuilder<PostsBloc, PostsStates>(
      builder: (context, state) {
        if(bloc.postsList.isEmpty){
          if(state is LoadingDataState){
            return const Center(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: CircularProgressIndicator(),
                ));
          } else  {
            return Center(
                child: errorDialog(
                    size: 15,
                    onPressed: () {
                      bloc.add(const OnFetchPostsEvent());
                    }));
          }
        }
        return RefreshIndicator(
          onRefresh: () async => bloc.add( OnRefreshData()),
          child: ListView.builder(
              controller: bloc.scrollController,
              itemBuilder: (context, index) {
                if (index == bloc.postsList.length) {
                  if(state is GetPostsErrorState){
                    return Center(
                        child: errorDialog(
                            size: 15,
                            onPressed: () {
                              bloc.add(const OnFetchPostsEvent());
                            }));
                  } else {
                    return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: CircularProgressIndicator(),
                        ));
                  }
                }
                final Post post = bloc.postsList[index];
                return buildPostItem(post);
              },
              itemCount: bloc.isLoadMore ? bloc.postsList.length + 1 : bloc.postsList.length),
        );
      },
    );
  }
}
