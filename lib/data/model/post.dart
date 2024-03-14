class Post {
  String? id;
  String? image;
  int? likes;
  List<String>? tags;
  String? text = "";
  String? publishDate;
  Owner? owner;

  Post({
    this.id,
    this.image,
    this.likes,
    this.tags,
    this.text,
    this.publishDate,
    this.owner,
  });

  Post.fromJson(
  Map<String, dynamic> json) {
  id = json['id'] as String?;
  image = json['image'] as String?;
  likes = json['likes'] as int?;
  tags = (json['tags'] as List?)?.map((dynamic e) => e as String).toList();
  text = json['text'] as String?;
  publishDate = json['publishDate'] as String?;
  owner = (json['owner'] as Map<String,dynamic>?) != null ? Owner.fromJson(json['owner'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> json = <String, dynamic>{};
  json['id'] = id;
  json['image'] = image;
  json['likes'] = likes;
  json['tags'] = tags;
  json['text'] = text;
  json['publishDate'] = publishDate;
  json['owner'] = owner?.toJson();
  return json;
  }
}

class Owner {
  String? id;
  String? title;
  String? firstName;
  String? lastName;
  String? picture;

  Owner({
    this.id,
    this.title,
    this.firstName,
    this.lastName,
    this.picture,
  });

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    title = json['title'] as String?;
    firstName = json['firstName'] as String?;
    lastName = json['lastName'] as String?;
    picture = json['picture'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['title'] = title;
    json['firstName'] = firstName;
    json['lastName'] = lastName;
    json['picture'] = picture;
    return json;
  }
}