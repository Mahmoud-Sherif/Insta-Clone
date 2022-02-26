import 'package:chat_app/const/colors.dart';
import 'package:chat_app/core/routes/magic_router.dart';
import 'package:chat_app/features/sign_in/view.dart';

import 'package:chat_app/features/sign_up/cubit/signup_cubit.dart';
import 'package:chat_app/core/validate/validator.dart';
import 'package:chat_app/widgets/text_field_inbut.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
part 'units/insat_logo.dart';
part 'units/sign_up_button.dart';
part 'units/sign_up_fields.dart';
part 'units/sign_in_navigate.dart';
part 'units/profile_pic.dart';


class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: Container(
                padding:
                    // MediaQuery.of(context).size.width > 600
                    //     ? EdgeInsets.symmetric(
                    //         horizontal: MediaQuery.of(context).size.width / 3)
                    //     :
                    const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    _InstaLogo(),
                    _ProfilePic(),
                    _SignUpFields(),
                    _SignUpButton(),
                    _SignInNavigate()
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
