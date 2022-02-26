part of '../view.dart';

class _SignInFields extends StatelessWidget {
  const _SignInFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = SigninCubit.of(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          TextFieldInput(
            onSaved: (s) => cubit.email = s!,
            validator: Validator.email,
            hintText: 'Enter your email',
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 24,
          ),
          TextFieldInput(
            onSaved: (s) => cubit.password = s!,
            validator: Validator.password,
            hintText: 'Enter your password',
            textInputType: TextInputType.text,
            isPass: true,
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
