part of '../view.dart';

class _ProfilePosts extends StatelessWidget {
  const _ProfilePosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postCubit = ProfileCubit.of(context);

    return BlocBuilder(
      bloc: postCubit,
      builder: (context, state) {
        return state is ProfiUserPostsFinshed
            ? GridView.builder(
                shrinkWrap: true,
                itemCount: postCubit.userPost.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 1.5,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final userPostData = postCubit.userPost[index];
                  return Image(
                    image: NetworkImage(userPostData.postUrl),
                    fit: BoxFit.cover,
                  );
                },
              )
            : const LoadingIndicator();
      },
    );
  }
}
