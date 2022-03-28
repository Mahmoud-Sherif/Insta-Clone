part of '../view.dart';

class _UserStats extends StatelessWidget {
  const _UserStats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = ProfileCubit.of(context);

    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        final int postLenth = cubit.userPost.length;
        return state is ProfileUserPostsLoadding?
            ? const LoadingIndicator()
            : Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildStatColumn(postLenth, "posts"),
                  buildStatColumn(cubit.userData.followers.length, "followers"),
                  buildStatColumn(cubit.userData.following.length, "following"),
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
