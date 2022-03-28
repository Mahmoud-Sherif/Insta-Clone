part of '../view.dart';

class _CaptionAndComments extends StatelessWidget {
  const _CaptionAndComments({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Post data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultTextStyle(
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(fontWeight: FontWeight.w800),
              child: Text(
                '${data.likes.length} likes',
                style: Theme.of(context).textTheme.bodyText2,
              )),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 8,
            ),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: primaryColor),
                children: [
                  TextSpan(
                    text: data.username.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '  ${data.caption}',
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              // await cubit.geCommentData(data.postId);
              // MagicRouter.navigateTo(
              //   CommentView(postData: data),
              // );
            },
            child: Container(
              child: const Text(
                'View all  comments',
                style: TextStyle(
                  fontSize: 16,
                  color: secondaryColor,
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 4),
            ),
          ),
          Container(
            child: Text(
              DateFormat.yMMMd().format(data.postDate),
              style: const TextStyle(
                color: secondaryColor,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 4),
          ),
        ],
      ),
    );
  }
}
