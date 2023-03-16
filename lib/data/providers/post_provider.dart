import 'package:post/index.dart';

class PostProvider with ChangeNotifier{
  PostProvider(){
    onPostFetch();
  }
  PostState _postState = PostState(status: PostStatus.initial);

  PostState get postState => _postState;

  final PostService _postService = PostService();

  Future<void> onPostFetch() async{
    _postState = PostState(status: PostStatus.loading);
    notifyListeners();
    try{
      final posts = await _postService.getPost();
      _postState = PostState(status: PostStatus.success, posts: posts);
      notifyListeners();
    } on Exception catch (error){
      _postState = PostState(status: PostStatus.error, posts: [], errorMessage: error.toString());
      notifyListeners();
    }
  }
}