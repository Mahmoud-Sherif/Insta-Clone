import 'package:chat_app/features/cubit/main_cubit.dart';
import 'package:flutter/material.dart';

class FeedView extends StatelessWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final cubit = MainCubit.of(context);
    return const Scaffold(
      body: Center(
        child: Text('cubit.userData.email'),
      ),
    );
  }
}
