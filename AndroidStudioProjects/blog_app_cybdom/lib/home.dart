import 'dart:convert';
import 'package:blog_app/post_container.dart';
import 'package:blog_app/posts.dart';
import 'package:blog_app/repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'models/singlePost.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<SinglePost>> _postsFuture;
  @override
  void initState() {
    super.initState();

    //on initialize app, display posts
    _postsFuture = getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<SinglePost>>(
        future: _postsFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text(
                  "Flutter Tutorials",

                ),
                // actions: <Widget>[
                //   Padding(
                //     padding: const EdgeInsets.all(9.0),
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(9),
                //       child: Image.network(
                //         "${snapshot.data![0].avatarURL}",
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   )
                // ],
              ),
              body: ListView(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.all(9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 20,
                          itemBuilder: (context, i) => PostContainer(
                            author: "${snapshot.data![i].authorName}",
                            image: "${snapshot.data![i].featuredImage}",
                            title: "${snapshot.data![i].title}",
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PostScreen(postData: snapshot.data![i]),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}