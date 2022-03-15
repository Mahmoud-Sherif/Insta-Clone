part of '../view.dart';

AppBar _appBar(AddPostCubit cubit, MainCubit mainCubit) {
  return AppBar(
    backgroundColor: mobileBackgroundColor,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        // cubit.clearImgae;
        // MagicRouter.navigateAndPopAll(const HomeView());
      },
    ),
    title: const Text(
      'Post to',
    ),
    centerTitle: false,
    actions: [
      TextButton(
        onPressed: () {
          cubit.uplaodPost(
            mainCubit.userData.uid,
            mainCubit.userData.username,
            mainCubit.userData.imageUrl,
          );
        },
        child: const Text(
          "Post",
          style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 16.0),
        ),
      )
    ],
  );
}
