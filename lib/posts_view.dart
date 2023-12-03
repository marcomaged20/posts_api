import 'package:flutter/material.dart';
import 'package:posts_api/api_services.dart';
import 'package:posts_api/post_model.dart';

class postsView extends StatefulWidget {
  const postsView({super.key});

  @override
  State<postsView> createState() => _postsViewState();
}

class _postsViewState extends State<postsView> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Apiservices.getPosts().then((value) => print(value![0].title));
  // };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: Apiservices.getPostsbyDio(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<postModel> posts = snapshot.data;
                    return ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            tileColor: Colors.red,
                            title: Text(posts[index].title),
                            subtitle: Text(posts[index].body),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ],
      ),
    );
  }
}
