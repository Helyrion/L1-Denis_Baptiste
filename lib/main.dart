import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cine_list/features/home_page/home_page.dart';
import 'package:my_cine_list/features/auth/logic/auth_bloc.dart';
import 'package:my_cine_list/features/home_page/logic/home_page_bloc.dart';
import 'package:my_cine_list/repositories/post_repository/firebase_post.dart';
import 'package:my_cine_list/repositories/user_repository/firebase_user.dart';

import 'features/home_page/home_page.dart';
import 'features/auth/logic/auth_event.dart';
import 'features/auth/logic/auth_state.dart';

/*void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const HomePage(),
      },
    ),
  );
}*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObserver();
  await Firebase.initializeApp();
  runApp(const CineListApp());
}

class CineListApp extends StatelessWidget {
  const CineListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) {
              return AuthenticationBloc(
                userRepository: FirebaseUserRepository(),
              )..add(AppStarted());
            },
          ),
          BlocProvider<PostsBloc>(
            create: (context) {
              return PostsBloc(
                postsRepository: FirebasePostsRepository(),
              )..add(LoadPosts());
            },
          )
        ],
        child: MaterialApp(title: 'My CineList', routes: {
          '/': (context) {
            return BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                if (state is Authenticated) {
                  return const HomePage();
                }
                if (state is Unauthenticated) {
                  return const Center(
                    child: Text('Could not authenticate with Firestore'),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            );
          },
        }));
  }
}
