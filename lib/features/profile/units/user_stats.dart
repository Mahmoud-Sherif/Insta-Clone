part of '../view.dart';

class _UserStats extends StatelessWidget {
  const _UserStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainCubit = MainCubit.of(context);
    final userPostCubit = ProfileCubit.of(context);

    return BlocBuilder(
      bloc: userPostCubit,
      builder: (context, state) {
        final int postLenth = userPostCubit.userPost.length;
        return state is ProfiUserPostsLoadding?
            ? const LoadingIndicator()
            : Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildStatColumn(postLenth, "posts"),
                  buildStatColumn(
                      mainCubit.userData.followers.length, "followers"),
                  buildStatColumn(
                      mainCubit.userData.following.length, "following"),
                ],
              );
      },
    );
  }

  Column buildStatColumn(int num, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          num.toString(),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
