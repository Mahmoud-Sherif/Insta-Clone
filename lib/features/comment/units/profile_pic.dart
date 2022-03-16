part of '../view.dart';

class _ProfilePic extends StatelessWidget {
  const _ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainCubit = MainCubit.of(context);
    return CircleAvatar(
      backgroundImage: NetworkImage(mainCubit.userData.imageUrl),
      radius: 18,
    );
  }
}
