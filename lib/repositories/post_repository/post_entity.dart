import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostEntity extends Equatable {
  final String id;
  final String title;
  final String text;

  const PostEntity({required this.id, required this.title, required this.text});

  Map<String, Object> toJson() {
    return {
      "id": id,
      "title": title,
      "text": text,
    };
  }

  @override
  List<Object> get props => [id, title, text];

  static PostEntity fromJson(Map<String, Object> json) {
    return PostEntity(
      id: json["id"] as String,
      title: json["title"] as String,
      text: json["text"] as String,
    );
  }

  static PostEntity fromSnapshot(DocumentSnapshot snap) {
    final data = snap.data();
    if (data == null) throw Exception();
    return PostEntity(
      id: snap.id,
      title: data['title'],
      text: data['text'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      "title": title,
      "text": text,
    };
  }
}
