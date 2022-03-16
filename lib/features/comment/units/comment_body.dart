part of '../view.dart';

class _CommentBottomNav extends StatelessWidget {
  const _CommentBottomNav({Key? key, required this.postData}) : super(key: key);
  final Post postData;
  @override
  Widget build(BuildContext context) {
    final mainCubit = MainCubit.of(context);
    final cubit = CommentCubit.of(context);

    return SafeArea(
      child: Container(
        height: kToolbarHeight,
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        padding: const EdgeInsets.only(left: 16, right: 8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(mainCubit.userData.imageUrl),
              radius: 18,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 8),
                child: TextField(
                  controller: cubit.commentEditingController,
                  decoration: InputDecoration(
                    hintText: 'Comment as ${mainCubit.userData.username}',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                await cubit.postComment(
                  postData.postId.toString(),
                  postData.uid,
                  postData.username,
                  postData.profilePic,
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: const Text(
                  'Post',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
