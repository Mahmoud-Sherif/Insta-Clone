part of '../view.dart';

class _PostCardImage extends StatelessWidget {
  const _PostCardImage({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Post data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onDoubleTap: () {
      //   FireStoreMethods().likePost(
      //     widget.snap['postId'].toString(),
      //     user.uid,
      //     widget.snap['likes'],
      //   );
      //   setState(() {
      //     isLikeAnimating = true;
      //   });
      // },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Image.network(
              data.postUrl,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
