import 'package:dio/dio.dart';
import 'package:mvvm_epo/Models/post_model.dart';
import 'package:mvvm_epo/repositories/post_repository.dart';
import 'package:mvvm_epo/view_models/post_view_model.dart';

class PostsViewModel {
  final String title = "All Posts";

  PostRepository? postRepository;

  PostsViewModel({this.postRepository});

  Future<List<PostViewModel>> fetchAllPosts() async{
   List<PostModel> list = await postRepository!.getAllPosts();
  return list.map((post) => PostViewModel(postModel:post)).toList();
  }
}