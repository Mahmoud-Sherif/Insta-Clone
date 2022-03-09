part of '../view.dart';

class _LikeCommentSection extends StatelessWidget {
  const _LikeCommentSection({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Post data;
  @override
  Widget build(BuildContext context) {
    final mainCubit = MainCubit.of(context);
    return Row(
      children: [
        LikeAnimation(
          isAnimating: data.likes.contains(mainCubit.userData.uid),
          smallLike: true,
          child: IconButton(
              icon: data.likes.contains(mainCubit.userData.uid)
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.favorite_border,
                    ),
              onPressed: () {}
              //  => FireStoreMethods().likePost(
              //   widget.snap['postId'].toString(),
              //   user.uid,
              //   widget.snap['likes'],
              // ),
              ),
        ),
        IconButton(
          icon: const Icon(
            Icons.comment_outlined,
          ),
          onPressed: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => CommentsScreen(
            //       postId: widget.snap['postId'].toString(),
            //     ),
            //   ),
            // );
          },
        ),
        IconButton(
            icon: const Icon(
              Icons.send,
            ),
            onPressed: () {}),
        Expanded(
            child: Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
              icon: const Icon(Icons.bookmark_border), onPressed: () {}),
        ))
      ],
    );
  }
}
