import 'package:uuid/uuid.dart';

import 'post_entity.dart';

class Post {
  final String id;
  final String title;
  final String text;

  //Post(this.id, this.title, this.text);

  Post({
    required this.title,
    required this.text,
    String? id,
  }) : this.id = id ?? Uuid().v4();

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ text.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Post &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          text == other.text;

  @override
  String toString() {
    return 'Post { id: $id, title: $title, text: $text }';
  }

  PostEntity toEntity() {
    return PostEntity(id: id, title: title, text: text);
  }

  static Post fromEntity(PostEntity entity) {
    return Post(
      title: entity.title,
      text: entity.text,
      id: entity.id,
    );
  }
}
