import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cine_list/features/home_page/logic/home_page_bloc.dart';
import 'package:my_cine_list/repositories/post_repository/firebase_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget cardNews(String url, String titre) {
    return Container(
      color: Colors.teal,
      child: Column(
        children: [
          Image.network(
            url,
            fit: BoxFit.cover,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.thumb_up),
              const Icon(Icons.favorite),
              Text(titre),
              const Icon(Icons.thumb_down),
              const Icon(Icons.arrow_downward),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.people),
            Text('News'),
            Icon(Icons.add),
            /*IconButton(
                onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()))
                    },
                icon: const Icon(Icons.people)),
            const Text('News'),
            IconButton(
                onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddPage()))
                    },
                icon: const Icon(Icons.add)),*/
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: BlocProvider<PostsBloc>(
              create: (BuildContext context) =>
                  PostsBloc(postsRepository: FirebasePostsRepository()),
              child: BlocBuilder<PostsBloc, HomePageState>(
                  builder: (context, state) {
                var homePageProvider = BlocProvider.of<PostsBloc>(context);
                if (state is HomePageInitial) {
                  homePageProvider.add(LoadPosts());
                }
                if (state is HomePageSuccess) {
                  final posts = state.posts;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        print(post);
                        return Text(post.text);
                      });
                }
                return const Center(
                  child: Text('Loading ...'),
                );
                // return widget here based on BlocA's state
              }))),
    );
  }
}
