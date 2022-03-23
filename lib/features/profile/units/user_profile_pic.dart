part of '../view.dart';

class _UserProfilePIc extends StatelessWidget {
  const _UserProfilePIc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = MainCubit.of(context);

    return CircleAvatar(
      backgroundColor: Colors.grey,
      backgroundImage: NetworkImage(cubit.userData.imageUrl),
      radius: 40,
    );
  }
}
