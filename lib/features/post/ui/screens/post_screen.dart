import 'package:post/index.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<PostProvider>().onPostFetch());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts'),),
      body: Consumer<PostProvider>(builder: (_, state, child){
        if(state.postState.status.isLoading){
          return const Center(child: CircularProgressIndicator(),);
        }else if(state.postState.status.isError){
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.postState.errorMessage!)));
          });
          return Container();
        }
        return ListView.builder(itemBuilder: (_, index){
          return ListTile(
            leading: CircleAvatar(child: Text(state.postState.posts![index].title[0].toUpperCase()),),
            title: Text(state.postState.posts![index].title, maxLines: 1,),
            subtitle: Text(state.postState.posts![index].body, maxLines: 1,),
          );
        });
      },
      ),
    );
  }
}
