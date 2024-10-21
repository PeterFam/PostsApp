import 'package:isar/isar.dart';
import 'package:ninjaz_posts_app/data/local/model/isar_post.dart';
import 'package:ninjaz_posts_app/data/model/post.dart';
import 'package:ninjaz_posts_app/domain/repo/post_repo.dart';

class IsarPostRepo implements PostRepo{

  final Isar db;

  IsarPostRepo(this.db);

  @override
  Future<void> addPost(Post newPost) async {
   final post = PostIsar.fromDomain(newPost);

   return db.writeTxn(() => db.postIsars.put(post));
  }

  @override
  Future<void> deleteAllPosts() async {
    await db.writeTxn(() => db.postIsars.clear());
  }

  @override
  Future<List<Post>> getPostsList() async {
    final posts = await db.postIsars.where().findAll();

    return posts.map((postsIsar) => postsIsar.toDomain()).toList();
  }

}