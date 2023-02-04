import 'package:mvvm_epo/Models/post_model.dart';

abstract class PostRepository{
  Future<List<PostModel>> getAllPosts();
  Future<PostModel> getPostById(int id);
}