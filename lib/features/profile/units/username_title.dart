part of '../view.dart';

class _UserNameTitle extends StatelessWidget with PreferredSizeWidget {
  const _UserNameTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = ProfileCubit.of(context);
    return AppBar(
      backgroundColor: mobileBackgroundColor,
      title: Text(cubit.userData.username),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50);
}
