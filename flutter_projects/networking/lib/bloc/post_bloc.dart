import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:your_app_name/post.dart';
import 'package:your_app_name/post_event.dart';
import 'package:your_app_name/post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is FetchPosts) {
      yield PostLoading();
      try {
        final response = await http
            .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
        if (response.statusCode == 200) {
          final List<dynamic> rawPosts = jsonDecode(response.body);
          final posts = rawPosts.map((post) => Post.fromJson(post)).toList();
          yield PostLoaded(posts: posts);
        } else {
          throw Exception('Error fetching posts');
        }
      } catch (_) {
        yield PostError();
      }
    }
  }
}
