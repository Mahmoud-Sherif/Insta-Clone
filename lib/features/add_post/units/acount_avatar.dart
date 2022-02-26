part of '../view.dart';

class _AccountAvatar extends StatelessWidget {
  const _AccountAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainCubit = MainCubit.of(context);
    return CircleAvatar(
      backgroundImage: NetworkImage(mainCubit.userData.imageUrl),
    );
  }
}
