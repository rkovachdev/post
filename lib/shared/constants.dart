import '../data/models/post_model.dart';

enum PostStatus {
 initial, loading, success, error
}

extension PostStatusX on PostStatus{
  bool get isInitial => this == PostStatus.initial;
  bool get isLoading => this == PostStatus.loading;
  bool get isSuccess => this == PostStatus.success;
  bool get isError => this == PostStatus.error;
}

class PostState{
  final List<Post>? posts;
  final String? errorMessage;
  final PostStatus status;

  PostState({required this.status, this.posts, this.errorMessage});
}