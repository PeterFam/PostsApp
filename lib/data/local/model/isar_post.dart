

import 'package:isar/isar.dart';
import 'package:ninjaz_posts_app/data/model/post.dart';

//generate isar-post object, run: flutter packages pub run build_runner build
part 'isar_post.g.dart';

@collection
class PostIsar {
  Id id = Isar.autoIncrement;
  late String postId;
  late String image;
  late String text;
  late int likes;
  late List<String> tags;
  late String publishDate;
  late String ownerId; // Owner id (your custom field)
  late String title;
  late String firstName;
  late String lastName;
  late String picture;

  Post toDomain(){
      return Post(
        id: postId,
        text: text,
        image: image,
        likes: likes,
        tags: tags,
        publishDate: publishDate,
        owner: Owner(id: ownerId, title: title, firstName: firstName, lastName: lastName, picture: picture)
      );
    }
    static PostIsar fromDomain(Post post){
        return PostIsar()
      ..postId = post.id!
      ..tags = post.tags!
      ..publishDate = post.publishDate!
      ..text = post.text!
      ..image = post.image!
      ..likes = post.likes!
      ..ownerId = post.owner!.id!
      ..picture = post.owner!.picture!
      ..lastName = post.owner!.lastName!
      ..title = post.owner!.title!
      ..firstName = post.owner!.firstName!;

    }
}