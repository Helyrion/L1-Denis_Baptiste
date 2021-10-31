import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Login'),
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
                return Container();
                // return widget here based on BlocA's state
              }))),
    );
  }
}
