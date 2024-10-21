import '../../data/model/post.dart';

abstract class PostRepo{

  Future<List<Post>> getPostsList();

  Future<void> addPost(Post newPost);

  Future<void> deleteAllPosts();

}