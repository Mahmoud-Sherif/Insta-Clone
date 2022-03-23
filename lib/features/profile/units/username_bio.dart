part of '../view.dart';

class _UsernameAndBio extends StatelessWidget {
  const _UsernameAndBio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainCubit = MainCubit.of(context);
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(
            top: 15,
            left: 20,
          ),
          child: Text(
            mainCubit.userData.username,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(
            top: 1,
            left: 20,
          ),
          child: Text(
            mainCubit.userData.bio,
          ),
        ),
      ],
    );
  }
}
