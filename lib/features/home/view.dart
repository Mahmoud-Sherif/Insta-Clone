import 'package:chat_app/const/colors.dart';
import 'package:chat_app/features/cubit/main_cubit.dart';
import 'package:chat_app/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'units/bottom_nav_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainCubit = MainCubit.of(context);
    return BlocBuilder(
      bloc: mainCubit,
      builder: (context, state) {
        return state is MainLoadingUserData
            ? const Center(
                child: CircularProgressIndicator(color: primaryColor),
              )
            : BlocProvider(
                create: (context) => HomeCubit(),
                child: Scaffold(
                  body: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      final cubit = HomeCubit.of(context);
                      return cubit.homeViews[cubit.bottomNavBarIndex];
                    },
                  ),
                  bottomNavigationBar: const _BottomNavBar(),
                ),
              );
      },
    );
  }
}
