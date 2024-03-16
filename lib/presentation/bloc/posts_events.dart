abstract class PostsEvent {
  const PostsEvent();
  @override
  List<Object?> get props => [];
}

class OnFetchPostsEvent extends PostsEvent {
  const OnFetchPostsEvent();
}

class OnLoadMoreData extends PostsEvent {}

class ChangeBottomNavScreenEvent extends PostsEvent{
  final int index;
  const ChangeBottomNavScreenEvent({required this.index});
}

class OnRefreshData extends PostsEvent {}
