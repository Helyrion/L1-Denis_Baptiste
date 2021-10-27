import 'package:get/get.dart';
import '../models/post.dart';

class Feed extends GetxController {
  final RxList<Post> _items = List.generate(
          100,
          (index) =>
              Post(id: index, title: 'Post $index', text: '', isFav: false.obs))
      .obs;

  List<Post> get items {
    return [..._items];
  }

  List<Post> get wishListItems {
    return _items.where((item) => item.isFav.value == true).toList();
  }

  void addFav(int id) {
    final int index = _items.indexWhere((item) => item.id == id);
    _items[index].isFav.value = true;
  }

  void removeFav(int id) {
    final int index = _items.indexWhere((item) => item.id == id);
    _items[index].isFav.value = false;
  }
}
