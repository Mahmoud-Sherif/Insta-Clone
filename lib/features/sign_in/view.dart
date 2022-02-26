import 'package:chat_app/const/colors.dart';
import 'package:chat_app/core/responsive/screan_size.dart';
import 'package:chat_app/core/routes/magic_router.dart';
import 'package:chat_app/core/validate/validator.dart';
import 'package:chat_app/features/sign_in/cubit/signin_cubit.dart';
import 'package:chat_app/features/sign_up/view.dart';
import 'package:chat_app/widgets/text_field_inbut.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
part 'units/insat_logo.dart';
part 'units/log_in_button.dart';
part 'units/sign_in_fields.dart';
part 'units/sign_up_navigate.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            padding:
                // MediaQuery.of(context).size.width > 600
                //     ? EdgeInsets.symmetric(
                //         horizontal: MediaQuery.of(context).size.width / 3)
                //     :
                const EdgeInsets.symmetric(horizontal: 32),
            width: sizeFromWidth(context, 1),
            // height: sizeFromHeight(context, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                const _InstaLogo(),
                const _SignInFields(),
                const _LogInButton(),
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                const _SignUpNavigate(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
