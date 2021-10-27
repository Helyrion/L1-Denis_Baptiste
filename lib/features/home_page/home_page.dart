import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cine_list/features/home_page/logic/home_page_bloc.dart';

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
          children: const [Icon(Icons.people), Text('News'), Icon(Icons.add)],
        ),
      ),
      body: SingleChildScrollView(
          child: BlocProvider<HomePageBloc>(
              create: (BuildContext context) => HomePageBloc(),
              child: BlocBuilder<HomePageBloc, HomePageState>(
                  builder: (context, state) {
                var homePageProvider = BlocProvider.of<HomePageBloc>(context);
                if (state is HomePageInitial) {
                  homePageProvider.add(HomePageGetData());
                }
                if (state is HomePageSuccess) {
                  print(state.news);
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      cardNews(
                          'https://www.jeuneafrique.com/medias/2018/09/21/27171hr_-592x296.jpg',
                          'Actu 1')
                    ],
                  );
                }
                return const Center(
                  child: Text('Loading ...'),
                );
                // return widget here based on BlocA's state
              }))),
    );
  }
}
