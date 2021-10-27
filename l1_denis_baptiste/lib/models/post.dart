import 'package:get/get.dart';

class Post {
  int id;
  String title;
  String text;
  RxBool isFav;
  Post(
      {required this.id,
      required this.title,
      required this.text,
      required this.isFav});
}
