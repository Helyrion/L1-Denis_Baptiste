// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:l1_denis_baptiste/routes/routes.dart';

import '../state/movies.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final Feed _f = Get.put(Feed());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
        actions: [
          IconButton(
              onPressed: () => Get.toNamed(AppRoutes.PROFILE),
              icon: const Icon(Icons.account_circle))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: _f.items.length,
                  itemBuilder: (context, index) {
                    final movie = _f.items[index];
                    return Card(
                      key: ValueKey(movie.id),
                      margin: const EdgeInsets.all(5),
                      color: Colors.amberAccent,
                      child: ListTile(
                        title: Text(movie.title),
                        // Use Obx(()=> to update icon color when product.inWishList change
                        trailing: Obx(() => IconButton(
                              onPressed: () {
                                if (movie.isFav.value == false) {
                                  _f.addFav(movie.id);
                                } else {
                                  _f.removeFav(movie.id);
                                }
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: movie.isFav.value == false
                                    ? Colors.white
                                    : Colors.red,
                              ),
                            )),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
