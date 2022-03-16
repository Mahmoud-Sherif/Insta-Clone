part of '../view.dart';

class _CommentBody extends StatelessWidget {
  const _CommentBody({Key? key, required this.commentData}) : super(key: key);
  final commentData;
  @override
  Widget build(BuildContext context) {
    final mainCubit = MainCubit.of(context);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: mainCubit.userData.username,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  TextSpan(
                    text: '  ${commentData['comment']}',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                DateFormat.yMMMd().format(
                  commentData['datePublished'].toDate(),
                ),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
