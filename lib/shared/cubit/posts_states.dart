abstract class PostsStates{}

class AppInitialState extends PostsStates{}

class AppBottomNavChangeState extends PostsStates{}

class LoadingDataState extends PostsStates{}

class PullToRefreshState extends PostsStates{}

class GetPostsSuccessState extends PostsStates{}
class GetPostsSuccessPTRState extends PostsStates{}

class GetPostsErrorPTRState extends PostsStates{
  final String error;

  GetPostsErrorPTRState(this.error);
}
class GetPostsErrorState extends PostsStates{
  final String error;

  GetPostsErrorState(this.error);
}