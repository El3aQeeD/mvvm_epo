import 'package:flutter/material.dart';
import 'package:mvvm_epo/repositories/posts_api.dart';
import 'package:mvvm_epo/view_models/post_view_model.dart';
import 'package:mvvm_epo/view_models/posts_view_model.dart';

class PostsView extends StatelessWidget {
  //Dependency Injection
  var postsViewModel = PostsViewModel(postRepository:PostsAPI());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(postsViewModel.title),
      ),
      body: Center(
        child: FutureBuilder<List<PostViewModel>>(
          future: postsViewModel.fetchAllPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              var posts = snapshot.data;
              return ListView.builder(
                itemCount: posts?.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Text(posts![index].id.toString()),
                  title: Text(posts[index].title),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
